#lang racket

(require
  "./puzzle-util.rkt"
  "../rule-systems/common.rkt")

(require-lang bool)

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
