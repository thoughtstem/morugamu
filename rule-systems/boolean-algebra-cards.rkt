#lang racket

(provide render
         generate)

(require "./card-designs.rkt"
         "./rules.rkt"
         "./redex/boolean-algebra.rkt"
         "./redex/rule-grabber.rkt"
         2htdp/image
         redex)

(module+ test
  (require (prefix-in bool: "../themes/emoji-boolean-algebra.rkt"))

  (render bool:theme))

(define (generate difficulty)
  (generate-term boolean-algebra-lang e difficulty))

(define (render theme)
  
  (define-tile the-and   'and   (first theme))
  (define-tile the-or    'or    (second theme))
  (define-tile the-not   'not   (third theme))
  (define-tile the-true  'T     (fourth theme))
  (define-tile the-false 'F     (fifth theme))
  
  (define-tile the-prompt  '?
    (text "?" 40 "black"))

(flatten
  (list
   (get-all-symbols)

   (redex-to-rule-card (rules-for 'and))
   (redex-to-rule-card (rules-for 'or))
   (redex-to-rule-card (rules-for 'not)))))


