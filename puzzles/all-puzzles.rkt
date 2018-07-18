#lang racket

(require
  racket/list
  2htdp/image
  "./puzzle-difficulty.rkt"
  
  "../rule-systems/card-designs.rkt"
  "../rule-systems/rules.rkt"

  "./puzzle-util.rkt"
  
  (prefix-in bool: "../themes/emoji-boolean-algebra.rkt")
  (prefix-in numb: "../themes/emoji-clock-arithmetic.rkt")
  (prefix-in ineq: "../themes/emoji-inequality.rkt")
  
  (prefix-in bool: "./boolean-algebra-puzzles.rkt")
  (prefix-in ineq: "./ineq-puzzles.rkt")
  (prefix-in numb: "./clock-number-puzzles.rkt")

  (prefix-in numb: "../rule-systems/clock-number-cards.rkt")
  (prefix-in ineq: "../rule-systems/inequality-cards.rkt")
  (prefix-in bool: "../rule-systems/boolean-algebra-cards.rkt")
  )

(module+ test
  (make-graph bool:puzzle-expressions))

(module+ test
  (make-graph ineq:puzzle-expressions1))

(module+ test
  (make-graph numb:puzzle-expressions2))

(define clock-numbers
  (numb:render numb:theme))

(define boolean-algebra
  (bool:render bool:theme))

(define ineq-cards
  (ineq:render ineq:theme))

(provide all-puzzles
         all-puzzles-deck)

(define all-puzzles
   (append
    bool:puzzle-expressions
    ineq:puzzle-expressions1
    numb:puzzle-expressions2
  ;Add more puzzles here
  ))


(define all-puzzles-deck (map expression->puzzle-card all-puzzles))

