#lang racket


(require redex)

(require "./boolean-algebra.rkt"
         "./clock-numbers.rkt")

(define-union-language _inequalities-lang boolean-algebra-lang clock-numbers-lang)

(define-extended-language inequalities-lang _inequalities-lang
  (in-e cn-e
        ba-e
        (< cn-e cn-e)
       ))

(define-extended-language _eval-inequalities-lang  inequalities-lang
  (E hole
     (< in-e E) (< E in-e)))

(define-union-language eval-inequalities-lang
  _eval-inequalities-lang
  clock-numbers-lang-eval
  boolean-algebra-lang-eval)

(define-metafunction eval-inequalities-lang
  <~ : n n -> bv
  [(<~ number_1 number_1) F]
  [(<~ number_1 9) T]
  [(<~ 9 number_1) F]
  [(<~ number_1 8) T]
  [(<~ 8 number_1) F]
  [(<~ number_1 7) T]
  [(<~ 7 number_1) F]
  [(<~ number_1 6) T]
  [(<~ 6 number_1) F]
  [(<~ number_1 5) T]
  [(<~ 5 number_1) F]
  [(<~ number_1 4) T]
  [(<~ 4 number_1) F]
  [(<~ number_1 3) T]
  [(<~ 3 number_1) F]
  [(<~ number_1 2) T]
  [(<~ 2 number_1) F]
  [(<~ number_1 1) T]
  [(<~ 1 number_1) F]
  [(<~ number_1 0) F])

;Copy-pasted the code for '<' and then just reversed the Ts and Fs
(define-metafunction eval-inequalities-lang
  >~ : n n -> bv
  [(>~ number_1 number_1) F]
  [(>~ number_1 9) F]
  [(>~ 9 number_1) T]
  [(>~ number_1 8) F]
  [(>~ 8 number_1) T]
  [(>~ number_1 7) F]
  [(>~ 7 number_1) T]
  [(>~ number_1 6) F]
  [(>~ 6 number_1) T]
  [(>~ number_1 5) F]
  [(>~ 5 number_1) T]
  [(>~ number_1 4) F]
  [(>~ 4 number_1) T]
  [(>~ number_1 3) F]
  [(>~ 3 number_1) T]
  [(>~ number_1 2) F]
  [(>~ 2 number_1) T]
  [(>~ number_1 1) F]
  [(>~ 1 number_1) T]
  [(>~ number_1 0) T])


(define _inequalities-lang-red
  (reduction-relation
   eval-inequalities-lang
   #:domain in-e
   (--> (in-hole E (< n_1 n_2)) (in-hole E (<~ n_1 n_2)) <)))


(define extended-boolean-algebra-lang-red
  (extend-reduction-relation boolean-algebra-lang-red
                             eval-inequalities-lang))



(define extended-clock-numbers-lang-red
  (extend-reduction-relation clock-numbers-lang-red
                             eval-inequalities-lang))

(define inequalities-lang-red
  (union-reduction-relations _inequalities-lang-red
                             extended-boolean-algebra-lang-red
                             extended-clock-numbers-lang-red))

(module+ test
  (traces inequalities-lang-red
          (term (< 2 (add 1 2))))
  #|(traces inequalities-lang-red
          (term (> 2 (add 1 2))))|#)



