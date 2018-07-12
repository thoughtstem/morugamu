#lang racket

(provide render)

(require "./card-designs.rkt"
         "./rules.rkt"

         2htdp/image)


(define (icon s)
  (text s 50 "black"))

(define (render theme)

  (define-tile the-len 'len (first theme))
  
  (list
   (symbol-page)

 ))


