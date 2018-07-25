#lang racket

(provide render)

(require "./card-designs.rkt"
         "./rules.rkt"
         "./redex/list-algebra.rkt"
         "./redex/rule-grabber.rkt"
         2htdp/image)

(module+ test
  (require (prefix-in list: "../themes/emoji-list-algebra.rkt"))

  (render list:theme))

(define (icon s)
  (text s 50 "black"))

(define (render theme)

  (define-tile the-cons 'cons (first theme))
  (define-tile the-nil  'nil  (second theme))
  (define-tile the-head 'head (third theme))
  (define-tile the-tail 'tail (fourth theme))

  (flatten (list
            (get-all-symbols)

            (redex-to-rule-card (rules-for 'head))
            (redex-to-rule-card (rules-for 'tail)))))






