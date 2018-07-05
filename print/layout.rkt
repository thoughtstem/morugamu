#lang racket

(require
  2htdp/image
  "../card-designs.rkt"
  "../rules.rkt"
  (prefix-in bool: "../boolean-algebra-cards.rkt")
  (prefix-in bool: "../themes/emoji-boolean-algebra.rkt"))

(define boolean-algebra
  (bool:render bool:theme))

(above (beside (second boolean-algebra)
               (third boolean-algebra))
       (rotate 90 (fourth boolean-algebra)))