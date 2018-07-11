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


;Kunal Puzzles
(puzzle-card (rule '(not(< (S 9)
                        (S 9)))
                   'T))

(puzzle-card (rule '(= (S 7)
                       (S 8))
                   'T))

(puzzle-card (rule '(= (min 6 5)
                       (S 8))
                   'F))

(puzzle-card (rule '(> (S 7)
                       (S 6))
                   'T))

(puzzle-card (rule '(= (S 7)
                       (S 8))
                   'F))

(puzzle-card (rule '(not(< (S 3)
                        (S 4)))
                   'F))

(puzzle-card (rule '(= (S 8)
                       (S 6))
                   'F))

(puzzle-card (rule '(= (min 0 1)
                       (S 9))
                   'T))

(puzzle-card (rule '(> (S 9)
                       (S 8))
                   'F))

(puzzle-card (rule '(= (S 0)
                       (S 0))
                   'T))

(puzzle-card (rule '(not(< (min 2 3)
                        5))
                   'F))

(puzzle-card (rule '(not(= (S 7)
                       (S 5)))
                   'T))

(puzzle-card (rule '(= (min 3 6)
                       (S 8))
                   'F))

(puzzle-card (rule '(< = (S 9)
                       (S 9))
                   'T))

(puzzle-card (rule '(> = (S 0)
                       (S 0))
                   'T))

;Monica puzzle
(puzzle-card (rule '(= (3 3))
                   'T))

(puzzle-card (rule '(= (8 7))
             'F))

(puzzle-card (rule '(= (add 8 1)
                       (sub 9 1))
                   'T))

(puzzle-card (rule '(< (add 5 1)
                       (sub 8 1))
                   'T))

(puzzle-card (rule '(< (max (add 2 2)
                         (sub 2 3))(3))
                   'F))

(puzzle-card (rule '(< (add 5 1)
                       (sub 3 5))
                   'F))

(puzzle-card (rule '(= (7 7))
                   'T))

(puzzle-card (rule '(< (max (add 4 4)
                         (sub 2 3))(6))
                   'F))

(puzzle-card (rule '(= (7 9))
                   'F))

(puzzle-card (rule '(= (add 3 2) (add 2 3))
                   'T))


;ethan puzzles
(puzzle-card (rule '(= 8 (add 4 (P 5)))'T))


(puzzle-card (rule '(< 8 (max 8 (P 0)))'T))

 
(puzzle-card (rule '(= (< 6 7) (= 4 (P 4)))'F))


(puzzle-card (rule '(not (= 2 2))'F))


(puzzle-card (rule '(= 4 (sub 1 7))'T))


(puzzle-card (rule '(< (min 4 (max 5 3)) (S 4))'T))


(puzzle-card (rule '((not <) 2 1)'T))


(puzzle-card (rule '(not (and T (or T (not T))))'F))


(puzzle-card (rule '(and (not F) (< 8 (P 0)))'T))


(puzzle-card (rule '(> (add 4 0) (P 6))'F))

