#lang racket

(provide render)

(require "./card-designs.rkt"
         "./rules.rkt"

         2htdp/image)


(define (icon s)
  (text s 50 "black"))

(define (render theme)

  (define-tile len 'len
    (bitmap "./themes/emojis/length.png"))

  
  (list
   (symbol-page)

  
  (rule-card (rule '(len x y))
                   '?)))


