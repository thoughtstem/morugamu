#lang racket

(provide clock-numbers-lang
         clock-numbers-lang-red
         clock-numbers-lang-eval
         S~
         P~)

(require redex)
(require "./rule-grabber.rkt")

(define-language clock-numbers-lang
  (e out-num)
  (out-num cn-e)
  (cn-e  (bop out-num out-num)
         (op out-num)
         n)
  (n   0 1 2 3 4 5 6 7 8 9)
  (op  S P)
  (bop add sub))

(define-extended-language clock-numbers-lang-eval  clock-numbers-lang
  (E hole
     (S E)
     (P E)
     (add out-num E)
     (add E out-num)
     (sub out-num E)
     (sub E out-num)))

(define-metafunction+ clock-numbers-lang-eval
  S~ : any -> any
  [(S~ 0) 1]
  [(S~ 1) 2]
  [(S~ 2) 3]
  [(S~ 3) 4]
  [(S~ 4) 5]
  [(S~ 5) 6]
  [(S~ 6) 7]
  [(S~ 7) 8]
  [(S~ 8) 9]
  [(S~ 9) 0])

(define-metafunction+ clock-numbers-lang-eval
  P~ : any -> any
  [(P~ 0) 9]
  [(P~ 1) 0]
  [(P~ 2) 1]
  [(P~ 3) 2]
  [(P~ 4) 3]
  [(P~ 5) 4]
  [(P~ 6) 5]
  [(P~ 7) 6]
  [(P~ 8) 7]
  [(P~ 9) 8])

(define-metafunction+ clock-numbers-lang-eval
  add~ : any any -> any
  [(add~ n_1 0) n_1]
  [(add~ n_1 n_2) (add (S n_1) (P n_2))])

(define-metafunction+ clock-numbers-lang-eval
  sub~ : any any -> any
  [(sub~ n_1 0) n_1]
  [(sub~ n_1 n_2) (sub (P n_1) (P n_2))])

(define clock-numbers-lang-red
  (reduction-relation
   clock-numbers-lang-eval
   #:domain any
   (--> (in-hole E (S n)) (in-hole E (S~ n)) S)
   (--> (in-hole E (P n)) (in-hole E (P~ n)) P)
   (--> (in-hole E (add n_1 n_2)) (in-hole E (add~ n_1 n_2)) add)
   (--> (in-hole E (sub n_1 n_2)) (in-hole E (sub~ n_1 n_2)) sub)))
   



(module+ test
  (traces clock-numbers-lang-red
          (term (add 1 2))
          #;(term (add 4 (P (sub 9 (S 4)))))))

