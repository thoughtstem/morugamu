#lang racket

(provide theme)

(require 2htdp/image
         "../rule-systems/inequality-cards.rkt")


(define theme
  (list
    (bitmap "./emojis/LessThan.png")
    (bitmap "./emojis/max.png")
    (bitmap "./emojis/ret.png")
    (bitmap "./emojis/equals.png")
    (bitmap "./emojis/min.png")
    (bitmap "./emojis/GreaterThan.png")))
