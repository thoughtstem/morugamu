#lang racket

(require redex)

(provide define-metafunction+
         get-rule-data
         rules-for
         language
         test-->)

(define data (hash))
(define (set-data! d)
  (set! data d))
(define (get-rule-data) data)

(define (filter-rules l)
  (filter list? l))

(define (untilde s)
  (cond [(list? s) (map untilde s)]
        [(boolean? s) (untilde (if s 'T 'F))]
        [(number? s) s]
        [else
         (string->symbol
          (string-replace (symbol->string s) "~" ""))]))

(define (rules-for s)
  (hash-ref (get-rule-data) s #f))

(define-syntax-rule (define-metafunction+ lang id rules ...)
  (begin
    (define-metafunction lang id rules ...)
    (set-data! (hash-set data
                         (untilde 'id)
                         (filter-rules (list (untilde 'rules) ...))))))



(require (for-syntax racket racket/list racket/syntax))

(define-for-syntax (every-other l #:start-at start-at)
  (define new-l (drop l start-at))
  (define indexes (filter even? (range 0 (length new-l))))

  (map (curry list-ref new-l) indexes))


(define-for-syntax (f-name head-and-body)
  (first (first head-and-body)))

(define-for-syntax (f-name->meta: head-and-body)
  (define head (first head-and-body))
  (define body (second head-and-body))

  (define name (first head))

  (define new-head (list-set head 0 (meta: name)))

  (list new-head body))

(define-for-syntax (meta: s)
  (format-symbol "meta:~a" s))

(define-for-syntax (->meta lang fns)
  (define name (f-name (first fns)))
  `(define-metafunction+ ,lang
     ,(meta: name) : ,@(map (thunk* 'any) (range (arity (first (first fns))))) -> any
     ,@(map f-name->meta: fns)  ))

(define-for-syntax (arity head)
  (sub1 (length head)))

(define-for-syntax (vars-for head domain)
  (define (var-for-num n) (format-symbol "~a_~a" domain n)) ;n++_1 here is annoying.  Make any_1?
  (map var-for-num (range 1 (add1 (arity head)))))

(define-for-syntax (->red-line head domain)
  `(--> (in-hole E (,(first head) ,@(vars-for head domain) #;n++))
        (in-hole E (,(format-symbol "meta:~a" (first head)) ,@(vars-for head domain) #;n++))
        ,(format "~a-~a" (first head) domain) ))

(define-for-syntax (->red red-name lang-eval-name heads domain)
  `(define ,red-name
     (reduction-relation
      ,lang-eval-name
      #:domain any

      ,@(map (curryr ->red-line domain) heads))))




(define-for-syntax (functions lang eval-lang red-name extends f-defs)

  (define domain (first f-defs))  
  (define kvs    (rest f-defs))
  
  (define heads  (every-other kvs #:start-at 0))
  (define bodies (every-other kvs #:start-at 1))

  (define zipped-heads-and-bodies (map list heads bodies))

  (define fns (group-by f-name zipped-heads-and-bodies))

  (define uniq-heads
    (map first
         (group-by first heads)))

  `(begin
     ,@(map (curry ->meta lang) fns)
     ,(->red '_red-name eval-lang uniq-heads domain)
                      
     ,@(map
        (lambda (e)
          `(define ,(format-symbol "extended-~a-lang-red" e)
             (extend-reduction-relation ,(format-symbol "~a-lang-red" e)
                                        ,eval-lang)))
        extends)

     (define ,red-name
       (union-reduction-relations _red-name
                                  ,@(map (curry format-symbol "extended-~a-lang-red") extends)
                                  ))

     ))



(define-syntax (language stx)
  (define inputs (rest (syntax->datum stx)))
  
  (define lang (first inputs))
  (define eval-lang (second inputs))
  (define red-name (third inputs))

  (define the-rest (drop inputs 3))

  (define extends (rest (first the-rest))) ;Hmmm....

  (define grammar (rest (second the-rest))) ;Okay, I am seeing the point of patterns now...

  (define f-defs (rest (third the-rest)))
  
  (datum->syntax stx
                 `(begin
                    
                    
                    (define-language
                      _temp ;,lang
                      ,@grammar)
                    
                    (define-extended-language _temp-eval _temp
                      (E hole
                         (op E)
                         (bop E e)
                         (bop e E)))

                    ;Are these unions strickly necessary?  Or was I just
                    ; stabbing in the dark?
                    
                    (define-union-language ,lang
                      _temp
                      ,@(map (curry format-symbol "~a-lang") extends))

                    (define-union-language ,eval-lang
                      _temp-eval
                      ,@(map (curry format-symbol "~a-lang-eval") extends))


                    ,(functions lang eval-lang red-name extends f-defs)

                    )))




