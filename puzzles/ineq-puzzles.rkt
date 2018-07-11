#lang racket

(require
  "../card-designs.rkt"
  "../rules.rkt"
  (prefix-in bool: "../boolean-algebra-cards.rkt")
  (prefix-in bool: "../themes/emoji-boolean-algebra.rkt")
  (prefix-in numb: "../clock-number-cards.rkt")  
  (prefix-in numb: "../themes/emoji-clock-arithmetic.rkt")
  (prefix-in ineq: "../inequality-cards.rkt"))

(define clock-numbers
  (numb:render numb:theme))

(define boolean-algebra
  (bool:render bool:theme))

(define ineq-cards
  (ineq:render #f))

clock-numbers
boolean-algebra
ineq-cards

;More puzzles here...

(puzzle-card (rule '(< (S (S 0)) (S 0))
                   'F))

;Marlon's puzzles
(puzzle-card (rule '(not (< 0 0))
             'T))

;dhakshin puzzle
(puzzle-card (rule '(< (max 8 6) (S 9))
                   'T))
;dhakshin puzzle
(puzzle-card (rule '(not (< (max 3 1) (sub (add 5 3) 7)))
                   'T))