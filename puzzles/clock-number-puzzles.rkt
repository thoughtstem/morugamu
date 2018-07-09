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
#|
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
|#






;my new puzzle
#;(puzzle-card (rule (tail (cons T T))
              '?))



;7/3/18 more puzzles
(puzzle-card (rule ' (sub 2 3)
                   '?))
(puzzle-card (rule ' (sub
                      (add 2 3)
                      (add 9 8))
                   '?))
(puzzle-card (rule ' (add
                      (sub 0 9)
                      (add 9 5))
                   '?))
(puzzle-card (rule ' (add
                      (sub 0 9)
                      (add
                          (sub 0 3)
                          (add 0 4)))
                   '?))
(puzzle-card (rule ' (sub
                      (sub 0 6)
                      (sub
                          (sub 8 3)
                          (sub 1 4)))
                   '?))


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

(puzzle-card (rule ' (S (P 9))
                   '?))

(puzzle-card (rule ' (add (2 6))
                   '?))

(puzzle-card (rule '(sub (4 5))
                   '?))

(puzzle-card (rule ' (add
                      (sub 1 1)
                      (sub
                          (sub 0 1)
                          (sub 1 0)))
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
(puzzle-card (rule '(add
                     (sub 4 6)
                     (add 1 2))
                   '?))
(puzzle-card (rule '(sub
                     (add 2 (add 3 6))
                     (sub (sub 1 1) (add 3 6)))
                   '?))
(puzzle-card (rule '(add
                     (sub
                      (add 2 5)
                      4)
                     (add 2 5))
                   '?))

;Kunal's Cards
(puzzle-card (rule '(add 9
                         (sub 9 5))
                   '?))

(puzzle-card (rule '(add 1
                         (sub 3 4))
                   '?))

(puzzle-card (rule '(add 1
                         (sub 3
                              (add 1 3)))
                   '?))

(puzzle-card (rule '(add (add 2 (sub 6 1)) 4)
                   '?))

(puzzle-card (rule '(add (sub 4
                              (S 9)) 6)
                   '?))

(puzzle-card (rule '(add 1
                         (sub 2
                              (S 9)))
                   '?))

(puzzle-card (rule '(sub (add (S 2) 4) (sub 6 3))
                   '?))
