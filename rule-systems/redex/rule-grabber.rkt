#lang racket

(require redex)

(provide define-metafunction+
         get-rule-data
         rules-for
         functions)

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
        ,(format "~a~a" (first head) (random 10000)) ))

(define-for-syntax (->red red-name lang-eval-name heads domain)
  `(define ,red-name
     (reduction-relation
      ,lang-eval-name
      #:domain any

      ,@(map (curryr ->red-line domain) heads))))




(define-syntax (functions stx)
  (define inputs (rest (syntax->datum stx)))
  
  (define lang   (first inputs))
  (define lang-eval-name   (second inputs))
  (define red-name   (third inputs))
  (define domain (fourth inputs))
  
  (define kvs    (drop inputs 4))

  
  (define heads  (every-other kvs #:start-at 0))
  (define bodies (every-other kvs #:start-at 1))

  (define zipped-heads-and-bodies (map list heads bodies))

  (define fns (group-by f-name zipped-heads-and-bodies))

  (define uniq-heads
    (map first
         (group-by first heads)))

  (datum->syntax stx
                 `(begin
                      ,@(map (curry ->meta lang) fns)
                      ,(->red red-name lang-eval-name uniq-heads domain))))




