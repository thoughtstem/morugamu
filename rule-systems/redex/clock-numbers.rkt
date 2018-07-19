#lang racket

(require redex)
(module+ test (require rackunit))

(define-language clock-numbers-lang
  (e   ::=
       (bop e e)
       (op e)
       n)
  (n   ::=
       0 1 2 3 4 5 6 7 8 9)
  (op  ::=
       S P)
  (bop ::=
       add sub))

(define-extended-language eval-clock-numbers-lang  clock-numbers-lang
  (E hole (S E) (P E) (add n E) (add E e) (sub n E) (sub E e)))

(define-metafunction eval-clock-numbers-lang
  S~ : n -> n
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

(define-metafunction eval-clock-numbers-lang
  P~ : n -> n
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

(define clock-numbers-lang-red
  (reduction-relation
   eval-clock-numbers-lang
   #:domain e
   (--> (in-hole E (S n)) (in-hole E (S~ n)) S)
   (--> (in-hole E (P n)) (in-hole E (P~ n)) P)

   ;Should implement these as meta-functions like S~ and P~ (add~, or~)
   (--> (in-hole E (add 0 n_1))
        (in-hole E n_1)
        B)
   (--> (in-hole E (add n n_1))
        (in-hole E (add (P n) (S n_1)))
        (side-condition (> (term n) 0)) R)))



(module+ test
  (traces clock-numbers-lang-red
          (term (add 2 1))))
