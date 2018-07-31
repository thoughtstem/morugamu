#lang racket

(require
  "../rule-systems/card-designs.rkt"
  "../rule-systems/rules.rkt"
  "./puzzle-util.rkt"

  (prefix-in numb: "../rule-systems/clock-number-cards.rkt")  
  (prefix-in numb: "../themes/emoji-clock-arithmetic.rkt")
  (prefix-in list: "../rule-systems/list-algebra-cards.rkt")
  (prefix-in list: "../themes/emoji-list-algebra.rkt")
  (prefix-in numb++: "../rule-systems/clock-number++-cards.rkt")
  )

(define clock-numbers
  (numb:render numb:theme))

(define list-cards
  (list:render list:theme))

(define clock-numbers++
  (numb++:render numb:theme))

(provide puzzle-expressions
         puzzle-deck)

(define puzzle-expressions
  (remove-duplicates
   (map numb++:generate
        '(1 1 1 1 1 1 1 1
          3 3 3 3 3 3 3 3
          5 5 5 5 5 5 5 5))))

(define puzzle-deck (map expression->puzzle-card puzzle-expressions))

(module+ test puzzle-deck)