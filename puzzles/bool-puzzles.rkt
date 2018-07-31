#lang racket

(require
  "./puzzle-util.rkt"
  (prefix-in bool: "../rule-systems/bool-cards.rkt")
  (prefix-in bool: "../themes/emoji-bool.rkt"))

(define boolean-algebra
  (bool:render bool:theme))

(provide puzzle-expressions
         puzzle-deck)

(define puzzle-expressions
  (remove-duplicates
   (map bool:generate
       '(1 1 1 1 1 1 1 1
         3 3 3 3 3 3 3 3
         5 5 5 5 5 5 5 5
         10 10 10 10 10 10))))


(define puzzle-deck (map expression->puzzle-card puzzle-expressions))
