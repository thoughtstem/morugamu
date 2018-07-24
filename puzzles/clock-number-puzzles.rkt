#lang racket

(require
  "../rule-systems/card-designs.rkt"
  "../rule-systems/rules.rkt"
  "../util/util.rkt"
  "./puzzle-util.rkt"
  "../print/printing-util.rkt"
  (prefix-in numb: "../rule-systems/clock-number-cards.rkt")  
  (prefix-in numb: "../themes/emoji-clock-arithmetic.rkt"))

(define clock-numbers-algebra
  (numb:render numb:theme))


(provide puzzle-expressions
         puzzle-deck)


(define puzzle-expressions
  (remove-duplicates
   (map numb:generate
        '(1 1 1 1 1 1 1 1
            3 3 3 3 3 3 3 3
            5 5 5 5 5 5 5 5
            10 10 10 10 10 10))))


(define puzzle-deck (map expression->puzzle-card puzzle-expressions))

(module+ test
  puzzle-deck)
