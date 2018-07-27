#lang racket

(provide clock-numbers++-lang
         clock-numbers++-red
         clock-numbers++-lang-eval)

(require redex)
(require "./rule-grabber.rkt")

(require "./inequalities.rkt"
         "./list-algebra.rkt")

(define-language _clock-numbers++-lang
  (e cn++-e)
  (cn++-e n++ (op cn++-e) (bop cn++-e cn++-e))
  (n++ (cons n n++) nil)
  (op S P)
  (bop add sub)
  (n 0 1 2 3 4 5 6 7 8 9))

(define-union-language clock-numbers++-lang
  _clock-numbers++-lang
  inequalities-lang-eval
  list-lang)

(define-extended-language _clock-numbers++-lang-eval clock-numbers++-lang
  (E hole
     (S E)
     (P E)
     (add E e)
     (add e E)
     (sub E e)
     (sub e E)
     (zero? E)
     (cons E e)
     (cons e E)))

(define-union-language clock-numbers++-lang-eval
  _clock-numbers++-lang-eval
  inequalities-lang-eval
  list-lang-eval)


(define-metafunction+ clock-numbers++-lang
  S++~ : any -> any
  [(S++~ nil)                   nil]
  [(S++~ (cons 9 any_1))        (cons 0 (S any_1))]
  [(S++~ (cons any_1 any_2)) (cons (S any_1) any_2)])

(define-metafunction+ clock-numbers++-lang
  P++~ : any -> any
  [(P++~ nil)                   nil]
  [(P++~ (cons 0 any_1))        (cons 9 (P any_1))]
  [(P++~ (cons any_1 any_2)) (cons (P any_1) any_2)])

(define-metafunction+ clock-numbers++-lang
  zero?++~ : any -> any  
  [(zero?++~ (cons 0 nil))             #t]
  [(zero?++~ (cons 0 any_1))           (zero?++~ any_1)]
  [(zero?++~ (cons number_1 any_1))    #f])


(define-metafunction+ clock-numbers++-lang
  add++~ : any any -> any
  [(add++~ any_1 any_2)        (if (zero? any_2)
                                   any_1
                                   (add (S any_1) (P any_2)))])


(define _clock-numbers++-red
  (reduction-relation
   clock-numbers++-lang-eval
   #:domain any
   
   
   (--> (in-hole E (S n++ ))      (in-hole E (S++~ n++)) S++)
   (--> (in-hole E (P n++ ))      (in-hole E (P++~ n++)) P++)
   (--> (in-hole E (zero? n++ ))  (in-hole E (zero?++~ n++)) zero?++)
   (--> (in-hole E (add n++_1 n++_2))           (in-hole E (add++~ n++_1 n++_2)) add++)
   
   ))

(define extended-list-lang-red
  (extend-reduction-relation list-lang-red
                             clock-numbers++-lang-eval))

(define extended-inequalities-lang-red
  (extend-reduction-relation inequalities-lang-red
                             clock-numbers++-lang-eval))

(define clock-numbers++-red
  (union-reduction-relations _clock-numbers++-red
                             extended-inequalities-lang-red
                             extended-list-lang-red))



#;(module+ test
  (traces clock-numbers++-red
          (term
           (zero? (S (cons 9 nil)))
           ))
  (traces clock-numbers++-red
          (term
           (if (zero? (cons 0 (cons 0 nil)))
               (S (cons 2 (cons 0 nil)))
               (> 3 2))
           )))



(module+ test
  (traces clock-numbers++-red
          (term (add (cons 5 (cons 0 nil))
                     (cons 0 (cons 1 nil)))))
  (traces clock-numbers++-red
          (term (zero? (cons 0 (cons 0 nil)))))

  (traces clock-numbers++-red
          (term (zero? (cons 0 (cons 1 nil)))))

  (traces clock-numbers++-red
          (term (S (P (cons 4 (cons 0 nil))))))
  (traces clock-numbers++-red
          (term (S (cons 9 (cons 0 nil)))))
  (traces clock-numbers++-red
          (term (P (cons 0 (cons 0 nil))))))






