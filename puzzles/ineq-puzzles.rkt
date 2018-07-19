#lang racket

(require
  "../rule-systems/card-designs.rkt"
  "../rule-systems/rules.rkt"
  "./puzzle-util.rkt"
  (prefix-in bool: "../rule-systems/boolean-algebra-cards.rkt")
  (prefix-in bool: "../themes/emoji-boolean-algebra.rkt")
  (prefix-in numb: "../rule-systems/clock-number-cards.rkt")  
  (prefix-in numb: "../themes/emoji-clock-arithmetic.rkt")
  (prefix-in ineq: "../rule-systems/inequality-cards.rkt")
  (prefix-in ineq: "../themes/emoji-inequality.rkt"))

(define clock-numbers
  (numb:render numb:theme))

(define boolean-algebra
  (bool:render bool:theme))

(define ineq-cards
  (ineq:render ineq:theme))

(provide puzzle-expressions1
         puzzle-deck1)

(define puzzle-expressions1
  (list

   '(< (S (S 0)) (S 0)) 

   '(not(< 0 0)) 

   '(< (add 4 1) x)

   '(not (< (max 3 2) (sub 1 9)))

   '(< (max (add 3 4) (sub 1 9)) (S 8))

   '(= (5 5))

   '(= (add 3 4) (sub 1 8))

   '(= (min 9 1) (max 3 1))

   '(not (< (min 5 6) (min 7 9)))

   '(< (max 8 6) (S 9))

   '(not (< (max 3 1) (sub 8 7)))

   '(< 9 (max (sub 6 4) 1))

   '(> 3 (min (add 6 4) 9))

   '(not (< (S 9) (S 9)))

   '(= (S 7) (S 8))

   '(= (min 6 5) (S 8))

   '(> (S 7) (S 6))

   '(= (S 7) (S 8))

   '(not (< (S 3) (S 4)))

   '(= (S 8) (S 6))

   '(= (min 0 1) (S 9))

   '(> (S 9) (S 8))

   '(= (S 0) (S 0))

   '(not (< (min 2 3) 5))

   '(not (= (S 7) (S 5)))

   '(= (min 3 6) (S 8))

   '(<= (S 9) (S 9))

   '(>= (S 0) (S 0))

   '(= (3 3))

   '(= (8 7))

   '(= (add 8 1) (sub 9 1))

   '(< (add 5 1) (sub 8 1))

   '(< (max (add 2 2) (sub 2 3)) (3))

   '(< (add 5 1) (sub 3 5))

   '(= (7 7))

   '((< (max (add 4 4) (sub 2 3)) (6)) )

   '(= (7 9))

   '(= (add 3 2) (add 2 3))

   '(= 8 (add 4 (P 5)))

   '(< 8 (max 8 (P 0)))

   '(= (< 6 7) (= 4 (P 4)))

   '(not (= 2 2))

   '(= 4 (sub 1 7))

   '(< (min 4 (max 5 3)) (S 4))

   '(((not <) 2 1) T)

   '(not (and T (or T (not T))))
   
   '(and (not F) (< 8 (P 0)))

   '(> (add 4 0) (P 6))

   ))

(define puzzle-deck1 (map expression->puzzle-card puzzle-expressions1))

(module+ test puzzle-deck1)