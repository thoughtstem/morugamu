#lang racket

(provide render
         generate)

(require "./card-designs.rkt"
         "./rules.rkt"
         "./redex/list-algebra.rkt"
         "./redex/rule-grabber.rkt"
         2htdp/image
         redex)

(module+ test
  (require (prefix-in list: "../themes/emoji-list.rkt"))

  (render list:theme))

(define (generate difficulty)
  (generate-term list-lang e difficulty))

(define (render theme)

  (define-tile the-cons 'cons (first theme))
  (define-tile the-nil  'nil  (second theme))
  (define-tile the-head 'head (third theme))
  (define-tile the-tail 'tail (fourth theme))

  (flatten (list
            (get-all-symbols)

            (redex-to-rule-card (rules-for 'head))
            (redex-to-rule-card (rules-for 'tail)))))






