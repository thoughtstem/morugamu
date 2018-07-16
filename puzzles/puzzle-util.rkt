#lang racket

(provide expression->puzzle-card)

(require
  "../rule-systems/card-designs.rkt"
  "../rule-systems/rules.rkt")


(define (expression->puzzle-card exp)
  (puzzle-card (rule exp '?)))
