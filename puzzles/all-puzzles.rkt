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
  )

(module+ test
  (make-graph bool:puzzle-expressions))

(define all-puzzles
  (append bool:puzzle-deck)
  ;Add more puzzles here
  )