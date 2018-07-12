#lang racket

(provide number-all)

(require pair-with-index
         2htdp/image
         "./cards.rkt"
         "./card-designs.rkt"
         "./config.rkt"
         "./util.rkt")

(define (place-num couple)
  (place-image (text (number->string (cdr couple)) 30 "black")
               300 20
               (car couple))
)

(define (number-all pairs)
  (map place-num (pair-with-index pairs))
)
