#lang racket

(provide expression->puzzle-card)

(require
  "../rule-systems/card-designs.rkt"
  "../rule-systems/rules.rkt")


(define (expression->puzzle-card exp)
  (puzzle-card (rule exp '?)))

;(module+ test
  ;(require "../rule-systems/boolean-algebra-cards.rkt")
  ;(require "../themes/emoji-boolean-algebra.rkt")
  ;(render theme)
  
  ;(expression->puzzle-card '(and (not T) F))
  ;)