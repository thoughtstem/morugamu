#lang racket

(provide render)

(require "./card-designs.rkt"
         "./rules.rkt"

         2htdp/image)


(define (icon s)
  (text s 50 "black"))

(define (render theme)

  (define-tile the-cons 'cons (first theme))
  (define-tile the-nil  'nil  (second theme))
  (define-tile the-head 'head (third theme))
  (define-tile the-tail 'tail (fourth theme))
  
  (list
   (symbol-page)


   (rule-card (rule 'x
                    '(cons x nil)))

   (rule-card (rule '(head (cons x y))
                    'x)

              (rule '(tail (cons x y))
                    'y))))


