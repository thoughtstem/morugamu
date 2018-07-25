#lang racket

(provide list-lang
         list-lang-red
         list-lang-eval)

(require redex)
(require "./rule-grabber.rkt")


(define-language list-lang
  (out-list l (tail l))
  (e l-e)
  (l-e l
       (head l)
       (tail l))
  (l nil
     (cons e e)))

(define-extended-language list-lang-eval list-lang
  (E hole     
     (head E)
     (tail E)))


(define-metafunction+ list-lang-eval
  head~ : e -> e
  [(head~ (cons any_1 any_2)) any_1])

(define-metafunction+ list-lang-eval
  tail~ : e -> e
  [(tail~ (cons any_1 any_2)) any_2])


(define list-lang-red
  (reduction-relation
   list-lang-eval
   #:domain e
   (--> (in-hole E (head any_1)) (in-hole E (head~ any_1)) head)
   (--> (in-hole E (tail any_1)) (in-hole E (tail~ any_1)) tail)))

(module+ test
  (traces list-lang-red
          (term (head (cons (cons nil nil) nil)))))


