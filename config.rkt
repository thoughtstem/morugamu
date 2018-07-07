#lang racket

(provide CARD-SIZE
         BORDER-SIZE
         TOTAL-CARD-SIZE
         BIG-CARD-WIDTH
         BIG-CARD-HEIGHT)

(define CARD-SIZE 100)
(define BORDER-SIZE 10)
(define BIG-CARD-WIDTH (* 1 240))
(define BIG-CARD-HEIGHT (* 1 336))

(define TOTAL-CARD-SIZE (+ CARD-SIZE BORDER-SIZE))


