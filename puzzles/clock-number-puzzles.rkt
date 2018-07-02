#lang racket

(require
  "../card-designs.rkt"
  "../rules.rkt"
  (prefix-in list: "../list-algebra-cards.rkt")
  (prefix-in list: "../themes/emoji-list-algebra.rkt")
  (prefix-in bool: "../boolean-algebra-cards.rkt")
  (prefix-in bool: "../themes/emoji-boolean-algebra.rkt"))

(define boolean-algebra
  (bool:render bool:theme))

(define list-algebra
  (list:render list:theme))

list-algebra

;More puzzles here...

(puzzle-card (rule '(tail (head (cons (cons T nil) nil)))
                   '?))

;my new puzzle
(puzzle-card (rule (tail (cons T T))
              '?))