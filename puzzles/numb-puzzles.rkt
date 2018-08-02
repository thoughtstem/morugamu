#lang racket

(require
  "../rule-systems/common.rkt"
  "./puzzle-util.rkt")

(require-lang numb)

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
