#lang racket

(require redex)
(require "./rule-grabber.rkt")

(require "./clock-numbers.rkt"
         "./list-algebra.rkt")

(define-union-language clock-numbers++-lang list-lang clock-numbers-lang)

(define-extended-language _clock-numbers++-lang-eval clock-numbers++-lang
  (E hole
     (S E)))

(define-union-language clock-numbers++-lang-eval
  _clock-numbers++-lang-eval
  clock-numbers-lang-eval
  list-lang-eval)

(define-metafunction+ clock-numbers++-lang
  S++~ : e -> e
  [(S++~ (cons 9 any_1)) (cons 0 (S++~ any_1))]
  [(S++~ (cons number_1 any_1)) (cons (S~ number_1) any_1)]
  [(S++~ any_1) (S~ any_1)]
  )


(define clock-numbers++-red
  (reduction-relation
   clock-numbers++-lang-eval
   #:domain e 
   (--> (in-hole E (S any_1))  (in-hole E (S++~ any_1)) S++)))

(module+ test
  (traces clock-numbers++-red
          (term (S (cons 9 (cons 0 nil))))))