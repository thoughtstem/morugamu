#lang racket

(provide clock-numbers++-lang
         clock-numbers++-red
         clock-numbers++-lang-eval)

(require redex)
(require "./rule-grabber.rkt")

(require "./inequalities.rkt"
         "./list-algebra.rkt")

;I keep accidentally using this function,
; instead of test-->>.  Preventing future mistakes here. 
(define (test--> . x)
  (raise "don't use test-->, use test-->>"))

(define-language _clock-numbers++-lang
  (e cn++-e)
  (cn++-e n++ (op cn++-e) (bop cn++-e cn++-e))
  (n++ (cons n n++) nil)
  (op S P zero? unpad pad nines?)
  (bop add sub div mod mult cons)
  (n 0 1 2 3 4 5 6 7 8 9))

(define-union-language clock-numbers++-lang
  _clock-numbers++-lang
  inequalities-lang-eval
  list-lang)

(define-extended-language _clock-numbers++-lang-eval clock-numbers++-lang
  (E hole
     (op E)
     (bop E e)
     (bop e E)))

(define-union-language clock-numbers++-lang-eval
  _clock-numbers++-lang-eval
  inequalities-lang-eval
  list-lang-eval)


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
     ,(meta: name) : any -> any
     ,@(map f-name->meta: fns)  ))

(define-for-syntax (->red-line head)
  ;TODO: Handle higher arity functions...
  ;TODO: Don't want to have to use n++, but using any clashes
  ;      with lower level versions of (S ...)
  `(--> (in-hole E (,(first head) n++))
        (in-hole E (,(format-symbol "meta:~a" (first head)) n++))
        ,(format "~a~a" (first head) (random 10000)) ))

(define-for-syntax (->red red-name lang-eval-name heads)
  `(define ,red-name
     (reduction-relation
      ,lang-eval-name
      #:domain any

      ,@(map ->red-line heads)
      ;(--> (in-hole E (S n++ ))             (in-hole E (S~ n++)) S++)
      ;(--> (in-hole E (add n++_1 n++_2))    (in-hole E (add~ n++_1 n++_2)) add++)
      )))




(define-syntax (functions stx)
  (define inputs (rest (syntax->datum stx)))
  
  (define lang   (first inputs))
  (define lang-eval-name   (second inputs))
  (define red-name   (third inputs))
  
  (define kvs    (drop inputs 3))

  
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
                      ,(->red red-name lang-eval-name uniq-heads))))




;Does this work?  Do we need to figure out squiggles?
(functions clock-numbers++-lang      ;Uses this (could define?)
           clock-numbers++-lang-eval ;Uses this (could define?)
           TEST_clock-numbers++-red      ;Defines this
 
 (S nil)                  nil
 (S (cons 9 any_1))       (cons 0 (S any_1))
 (S (cons any_1 any_2))   (cons (S any_1) any_2)
 
 (P nil)                  nil
 (P (cons 0 any_1))       (cons 9 (P any_1))
 (P (cons any_1 any_2))   (cons (P any_1) any_2))


;Can we macroify the following....

#;(define-metafunction+ clock-numbers++-lang
  S~ : any -> any
  [(S~ nil)                nil]
  [(S~ (cons 9 any_1))     (cons 0 (S any_1))]
  [(S~ (cons any_1 any_2)) (cons (S any_1) any_2)])

#;(define-metafunction+ clock-numbers++-lang
  P~ : any -> any
  [(P~ nil)                   nil]
  [(P~ (cons 0 any_1))        (cons 9 (P any_1))]
  [(P~ (cons any_1 any_2)) (cons (P any_1) any_2)])

(define-metafunction+ clock-numbers++-lang
  zero?~ : any -> any
  [(zero?~ nil) #t]
  [(zero?~ (cons 0 nil))             #t]
  [(zero?~ (cons 0 any_1))           (zero?~ any_1)]
  [(zero?~ (cons number_1 any_1))    #f])


(define-metafunction+ clock-numbers++-lang
  pad~ : any -> any
  [(pad~ nil)                 (cons 0 nil)]
  [(pad~ (cons any_1 any_2))  (cons any_1 (pad any_2))])

(define-metafunction+ clock-numbers++-lang
  nines?++~ : any -> any
  [(nines?++~ nil)                      #f]
  [(nines?++~ (cons 9 nil))             #t]
  [(nines?++~ (cons 9 any_1))           (nines?++~ any_1)]
  [(nines?++~ (cons number_1 any_1))    #f])




(define-metafunction+ clock-numbers++-lang
  safe-pad~ : any  -> any
  [(safe-pad~ any_1)    (if (nines? any_1)
                              (pad any_1)
                              any_1) ])





(define-metafunction+ clock-numbers++-lang
  add~ : any any -> any
  [(add~ any_1 any_2)        (if (zero? any_2)
                                   any_1
                                   (add (S any_1) (P any_2)))])

(define-metafunction+ clock-numbers++-lang
  mult~ : any any -> any
  [(mult~ any_1 any_2)        (if (zero? any_2)
                                    (cons 0 nil)
                                    (add any_1 (mult any_1 (P any_2))))])

(define-metafunction+ clock-numbers++-lang
  sub~ : any any -> any
  [(sub~ any_1 any_2)        (if (zero? any_2)
                                   any_1
                                   (sub (P any_1) (P any_2)))])

(define-metafunction+ clock-numbers++-lang
  mod~ : any any -> any
  [(mod~ any_1 any_2)        (if (< any_2 any_1)
                                   any_2
                                   (mod (sub any_1 any_2)
                                        any_2))])



(define-metafunction+ clock-numbers++-lang
  unpad~ : any  -> any
  [(unpad~ nil) nil]
  [(unpad~ (cons any_1 any_2))    (if (zero? any_2)
                                        (cons any_1 nil)
                                        (cons any_1 (unpad any_2))) ])





(define-metafunction+ clock-numbers++-lang
  num-digits++ : any  -> any
  [(num-digits++ nil)                (cons 0 nil)]
  [(num-digits++ (cons any_1 any_2)) (S (safe-pad
                                         (num-digits any_2)))])


#;(define-metafunction+ clock-numbers++-lang
  <++~ : any any -> any
  [(<++~ any_1 any_2)    (???) ])


(define _clock-numbers++-red
  (reduction-relation
   clock-numbers++-lang-eval
   #:domain any
   
   
  ; (--> (in-hole E (S n++ ))             (in-hole E (S~ n++)) S++)
  ; (--> (in-hole E (P n++ ))             (in-hole E (P~ n++)) P++)
   (--> (in-hole E (zero? n++ ))         (in-hole E (zero?~ n++)) zero?++)
   (--> (in-hole E (unpad n++ ))         (in-hole E (unpad~ n++)) unpad++)

   (--> (in-hole E (nines? n++ ))        (in-hole E (nines?++~ n++)) nines?++)
   (--> (in-hole E (pad n++ ))           (in-hole E (pad~ n++)) pad++)
   (--> (in-hole E (safe-pad n++ ))      (in-hole E (safe-pad~ n++)) safe-pad++)
   
   (--> (in-hole E (add n++_1 n++_2))    (in-hole E (add~ n++_1 n++_2)) add++)
   (--> (in-hole E (sub n++_1 n++_2))    (in-hole E (sub~ n++_1 n++_2)) sub++)
   (--> (in-hole E (mult n++_1 n++_2))   (in-hole E (mult~ n++_1 n++_2)) mult++)
   (--> (in-hole E (mod n++_1 n++_2))    (in-hole E (mod~ n++_1 n++_2)) mod++)))

;End macroification

 

(define extended-list-lang-red
  (extend-reduction-relation list-lang-red
                             clock-numbers++-lang-eval))

(define extended-inequalities-lang-red
  (extend-reduction-relation inequalities-lang-red
                             clock-numbers++-lang-eval))

(define clock-numbers++-red
  (union-reduction-relations _clock-numbers++-red
                             TEST_clock-numbers++-red
                             extended-inequalities-lang-red
                             extended-list-lang-red
                             ))



;TODO: Make this an automated test.  Ditto for all tests in file.
(module+ test

  (displayln "Test S")
  (test-->> clock-numbers++-red
            (term
             (S (cons 0 nil)))
            (term (cons 1 nil)))

  
  (displayln "Test nines?")
  (test-->> clock-numbers++-red
            (term
             (nines? (cons 9 (cons 8 nil))))
            (term #f)))


(module+ test
  (displayln "Test safe-pad")
  (test-->> clock-numbers++-red
            (term
             (safe-pad (cons 9 (cons 8 nil))))
            (term
             (cons 9 (cons 8 nil)))))

(module+ test
  (displayln "Test unpad")
  (test-->>
   clock-numbers++-red
   (term
    (unpad (cons 2 (cons 2 (cons 0 (cons 0 (cons 0 nil)))))))
   (term
    (cons 2 (cons 2 nil)))))

#;(module+ test
  (test--> clock-numbers++-red
           (term
            (num-digits (cons 2 (cons 2 nil))))
           (term
            (cons 2 nil))))


#;(module+ test
  (test-->> clock-numbers++-red
            (term
             (mult (cons 2 (cons 0 nil))
                   (cons 5 (cons 0 nil))))
            (term
             (cons 0 (cons 1 nil)))))


#;(module+ test
  (test-->> clock-numbers++-red
            (term
             (sub (cons 5 nil)
                  (cons 2 nil)))
            (term
             (cons 3 nil))))


#;(module+ test
  (test-->> clock-numbers++-red
            (term
             (mod (cons 9 nil)
                  (cons 2 nil)))
            (term
             (cons 1 nil))))



#;(module+ test
  (traces clock-numbers++-red
          (term
           (< (cons 2 (cons 1))                 ;12 vs
              (cons 5 (cons 2 (cons 0 nil)))    ;025 (zero padded 25)
              ))))



(module+ test
  #;(displayln "Test add")
  #;(test-->> clock-numbers++-red
            (term (add (cons 5 (cons 0 nil))
                       (cons 0 (cons 1 nil))))
            (term (cons 5 (cons 1))))

  (displayln "Test zero?")
  (test-->> clock-numbers++-red
            (term (zero? (cons 0 (cons 0 nil))))
            (term #t))

  (displayln "Test zero?")
  (test-->> clock-numbers++-red
           (term (zero? (cons 0 (cons 1 nil))))
           (term #f))

  (displayln "Test (S (P x))")
  (test-->> clock-numbers++-red
           (term (S (P (cons 4 (cons 0 nil)))))
           (term (cons 4 (cons 0 nil))))

  (displayln "Test S")
  (test-->> clock-numbers++-red
           (term (S (cons 9 (cons 0 nil))))
           (term (cons 0 (cons 1 nil))))

  (displayln "Test P")
  (test-->> clock-numbers++-red
           (term (P (cons 0 (cons 0 nil))))
           (term (cons 9 (cons 9 nil)))))






