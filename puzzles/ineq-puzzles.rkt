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

             'T)) ;easy

(puzzle-card (rule '(< (add 4 1)
                       x)
                       'F))

(puzzle-card (rule '(not (< (max 3 2)
                         (sub 1 9)))
                   'F))

(puzzle-card (rule '(< (max (add 3 4)
                         (sub 1 9))
                       (S 8))
                   'T))

(puzzle-card (rule '(= (5 5))
                   'T))

(puzzle-card (rule '(= (add 3 4)
                       (sub 1 8))
                   'T))

(puzzle-card (rule '(= (min 9 1)
                       (max 3 1))
                   'T))

(puzzle-card (rule '(not (< (min 5 6)
                            (min 7 9)))
                   'F))
                 

;dhakshin puzzle
(puzzle-card (rule '(< (max 8 6) (S 9))
                   'F))

(puzzle-card (rule '(not (< (max 3 1) (sub 8 7)))
                   'T))

(puzzle-card (rule '(< 9 (max (sub 6 4) 1))'F))

(puzzle-card (rule '(> 3 (min (add 6 4) 9))'F))




