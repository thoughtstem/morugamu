#lang racket

(provide boolean-algebra-lang
         boolean-algebra-lang-red
         boolean-algebra-lang-eval)

(require redex)
(require "./rule-grabber.rkt")


(define-language boolean-algebra-lang
  (e out-bool )
  (out-bool ba-e)
  (ba-e
      (and out-bool out-bool)
      (or out-bool out-bool)
      (not out-bool)
      bv)
  (bv T F))


(define-extended-language boolean-algebra-lang-eval boolean-algebra-lang
  (E hole
     (not E)
     (and out-bool E)
     (and E out-bool)
     (or out-bool E)
     (or E out-bool)))


(define-metafunction+ boolean-algebra-lang-eval
  not~ : bv -> bv
  [(not~ F) T]
  [(not~ T) F])

(define-metafunction+ boolean-algebra-lang-eval
  and~ : bv bv -> bv
  [(and~ T T) T]
  [(and~ T F) F]
  [(and~ F T) F]
  [(and~ F F) F])

(define-metafunction+ boolean-algebra-lang-eval
  or~ : bv bv -> bv
  [(or~ F T) T]
  [(or~ T F) T]
  [(or~ T T) T]
  [(or~ F F) F])


(define boolean-algebra-lang-red
  (reduction-relation
   boolean-algebra-lang-eval
   #:domain e
   (--> (in-hole E (not bv))        (in-hole E (not~ bv)) not)
   (--> (in-hole E (and bv_1 bv_2)) (in-hole E (and~ bv_1 bv_2)) and)
   (--> (in-hole E (or  bv_1 bv_2)) (in-hole E (or~  bv_1 bv_2))  or)))


(module+ test
  (traces boolean-algebra-lang-red
          (term (and T F)))
  (traces boolean-algebra-lang-red
          (term (and (or F T) (and T F)))))


