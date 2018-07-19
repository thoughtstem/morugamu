#lang racket

(require
  "../rule-systems/card-designs.rkt"
  "../rule-systems/rules.rkt"
  "../util/util.rkt"
  "./puzzle-util.rkt"
  "../print/printing-util.rkt"
  (prefix-in lst: "../rule-systems/list-algebra-cards.rkt")
  (prefix-in lst: "../themes/emoji-list-algebra.rkt")
  (prefix-in numb: "../rule-systems/clock-number-cards.rkt")  
  (prefix-in numb: "../themes/emoji-clock-arithmetic.rkt")
  (prefix-in bool: "../rule-systems/boolean-algebra-cards.rkt")
  (prefix-in bool: "../themes/emoji-boolean-algebra.rkt")
  2htdp/image
  (prefix-in ineq: "../rule-systems/inequality-cards.rkt")
  (prefix-in ineq: "../themes/emoji-inequality.rkt"))

(define clock-numbers
  (numb:render numb:theme))

(define boolean-algebra
  (bool:render bool:theme))

(define ineq-cards
  (ineq:render ineq:theme))

(define list-algebra
  (lst:render lst:theme))

;add puzzles for list algebra here, Alan
(provide dank dank-deck)

(define dank
  (list

   

   
   ))

(define dank-deck (map expression->puzzle-card dank))

(module+ test dank-deck)