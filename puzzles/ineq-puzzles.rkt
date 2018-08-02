#lang racket

(require
  "../rule-systems/common.rkt"
  "./puzzle-util.rkt")

(require-lang bool)
(require-lang numb)
(require-lang list)
(require-lang ineq)

(provide puzzle-expressions
         puzzle-deck)

(define puzzle-expressions
  (remove-duplicates
   (map ineq:generate
        '(1 1 1 1 1 1 1 1
            3 3 3 3 3 3 3 3
            5 5 5 5 5 5 5 5))))

(define puzzle-deck (map expression->puzzle-card puzzle-expressions))

(module+ test puzzle-deck)