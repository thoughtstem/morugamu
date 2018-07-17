#lang racket

(require
  2htdp/image
  "./puzzle-difficulty.rkt"
  
  "../rule-systems/card-designs.rkt"
  "../rule-systems/rules.rkt"
  
  (prefix-in bool: "../rule-systems/boolean-algebra-cards.rkt")
  (prefix-in bool: "../themes/emoji-boolean-algebra.rkt")
  (prefix-in bool: "./boolean-algebra-puzzles.rkt")
  (prefix-in bool: "./ineq-puzzles.rkt")
  (prefix-in bool: "./clock-number-puzzles.rkt")
  )

(module+ test
  (make-graph bool:puzzle-expressions))

(module+ test
  (make-graph bool:puzzle-expressions1))

(module+ test
  (make-graph bool:puzzle-expressions2))

(define all-puzzles
  (list
   '(append bool: puzzle-deck)
   '(append bool: puzzle-deck1)
   '(append bool: puzzle-deck2)
  ;Add more puzzles here
  ))

all-puzzles