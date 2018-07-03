#lang racket

(require
  "../card-designs.rkt"
  "../rules.rkt"
  (prefix-in numb: "../clock-number-cards.rkt")  
  (prefix-in numb: "../themes/emoji-clock-arithmetic.rkt"))

(define clock-numbers-algebra
  (numb:render numb:theme))

clock-numbers-algebra

;More puzzles here...

(puzzle-card (rule '(add 0 1)
                   '?))
(puzzle-card (rule '(add 1 2)
                   '?))
(puzzle-card (rule '(add 2 3)
                   '?))
(puzzle-card (rule ' (sub 0 4)
                   '?))
(puzzle-card (rule ' (sub 4 4)
                   '?))



;Hi, this is Sean's puzzle
(puzzle-card (rule ' (S (P 4))
                   '?))





;my new puzzle
#;(puzzle-card (rule (tail (cons T T))
              '?))

;Julia's new puzzles
(puzzle-card (rule '(add 0 0)
                   '?))
(puzzle-card (rule '(add 3 7)
                   '?))
(puzzle-card (rule '(add 9 3)
                   '?))
(puzzle-card (rule '(sub 4 8)
                   '?))
(puzzle-card (rule '(sub 2 7)
                   '?))
(puzzle-card (rule '(sub 1 1)
                   '?))
