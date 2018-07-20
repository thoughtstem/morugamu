#lang racket

(provide boolean-algebra-lang
         boolean-algebra-lang-red
         boolean-algebra-lang-eval)

(require redex)


(define-language boolean-algebra-lang
  (ba-e  (and ba-e ba-e)
      (or ba-e ba-e)
      (not ba-e)
      bv)
  (bv T F))



(define-extended-language boolean-algebra-lang-eval boolean-algebra-lang
  (E hole
     (not E)
     (and bv E)
     (and E ba-e)
     (or bv E)
     (or E ba-e)))


(define-metafunction boolean-algebra-lang-eval
  not~ : bv -> bv
  [(not~ F) T]
  [(not~ T) F])

(define-metafunction boolean-algebra-lang-eval
  and~ : bv bv -> bv
  [(and~ T F) F]
  [(and~ F T) F]
  [(and~ F F) F]
  [(and~ T T) T])

(define-metafunction boolean-algebra-lang-eval
  or~ : bv bv -> bv
  [(or~ F T) T]
  [(or~ T F) T]
  [(or~ T T) T]
  [(or~ F F) F])


(define boolean-algebra-lang-red
  (reduction-relation
   boolean-algebra-lang-eval
   #:domain ba-e
   (--> (in-hole E (not bv))        (in-hole E (not~ bv)) not)
   
   (--> (in-hole E (and bv_1 bv_2)) (in-hole E (and~ bv_1 bv_2)) and)
   (--> (in-hole E (or  bv_1 bv_2)) (in-hole E (or~  bv_1 bv_2))  or)))



(module+ test
  (traces boolean-algebra-lang-red
          (term (and (or F T) (and T F)))))


