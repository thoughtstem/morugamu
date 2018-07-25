#lang racket

(provide clock-numbers++-lang
         clock-numbers++-red
         clock-numbers++-lang-eval)

(require redex)
(require "./rule-grabber.rkt")

(require "./clock-numbers.rkt"
         "./list-algebra.rkt")


(define-language _clock-numbers++-lang
  (e n++ op)
  (n++ (cons n n++) nil)
  (op (S n++) (P n++))
  (n 0 1 2 3 4 5 6 7 8 9))

(define-union-language clock-numbers++-lang
  _clock-numbers++-lang
  list-lang
  clock-numbers-lang)

(define-extended-language _clock-numbers++-lang-eval clock-numbers++-lang
  (E hole
     (S E)
     (P E)))

(define-union-language clock-numbers++-lang-eval
  _clock-numbers++-lang-eval
  clock-numbers-lang-eval
  list-lang-eval)

(define-metafunction+ clock-numbers++-lang
  S++~ : any -> any
  [(S++~ nil)                   nil]
  [(S++~ (cons 9 any_1))        (cons 0 (S++~ any_1))]
  [(S++~ (cons number_1 any_1)) (cons (S~ number_1) any_1)])

(define-metafunction+ clock-numbers++-lang
  P++~ : any -> any
  [(P++~ nil)                   nil]
  [(P++~ (cons 0 any_1))        (cons 9 (P++~ any_1))]
  [(P++~ (cons number_1 any_1)) (cons (P~ number_1) any_1)])


(define _clock-numbers++-red
  (reduction-relation
   clock-numbers++-lang-eval
   #:domain any
   
   (--> (in-hole E (S nil))  (in-hole E (S++~ nil)) S-nil)
   (--> (in-hole E (S (cons any_1 any_2)))  (in-hole E (S++~ (cons any_1 any_2))) S)
   
   (--> (in-hole E (P nil))  (in-hole E (P++~ nil)) P-nil)
   (--> (in-hole E (P (cons any_1 any_2)))  (in-hole E (P++~ (cons any_1 any_2))) P)))


(define extended-list-lang-red
  (extend-reduction-relation list-lang-red
                             clock-numbers++-lang-eval))

(define clock-numbers++-red
  (union-reduction-relations _clock-numbers++-red
                             extended-list-lang-red))

(module+ test
  #;(traces clock-numbers++-red
          (term (S (P (cons 3 nil)))))
  (traces clock-numbers++-red
          (term (S (P (cons 4 (cons 0 nil))))))
  (traces clock-numbers++-red
          (term (S (cons 9 (cons 0 nil)))))
  (traces clock-numbers++-red
          (term (P (cons 0 (cons 0 nil))))))




