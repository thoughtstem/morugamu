#lang racket

(require
  "../card-designs.rkt"
  "../rules.rkt"

  (prefix-in bool: "../clock-number-cards.rkt")
  (prefix-in bool: "../themes/emoji-clock-arithmetic.rkt"))

(define clock-numbers-algebra
  (numb:render numb:theme))

clock-numbers-algebra

;More puzzles here...

(puzzle-card (rule '(add 0 1)
                   '?))