#lang racket

(provide render)

(require "../rule-systems/card-designs.rkt"
         "../rule-systems/rules.rkt"
         2htdp/image)

(module+ test
  (require (prefix-in bool: "../themes/emoji-boolean-algebra.rkt"))

  (render bool:theme))

(define (icon s)
  (text s 50 "black"))

(define (render theme)
  
  (define-tile the-and   'and   (first theme))
  (define-tile the-or    'or    (second theme))
  (define-tile the-not   'not   (third theme))
  (define-tile the-true  'T     (fourth theme))
  (define-tile the-false 'F     (fifth theme))
  
  (define-tile the-prompt  '?
    (text "?" 40 "black"))

  (define-tile if 'if
    #;(bitmap "./themes/emojis/add.png")
    (text "if" 50 "black"))

  (rule-card (rule '(if T x y)
                   'x)
             (rule '(if F x y)
                   'y))

(flatten
  (list
   (get-rparen)
   (get-lparen)
   (get-all-symbols)


   ;Transformation rules

   (rule-card (rule '(and T T)
                    'T)

              (rule '(and T F)
                    'F)

              (rule '(and F T)
                    'F)

              (rule '(and F F)
                    'F))


   (rule-card (rule '(or T T)
                    'T)

              (rule '(or T F)
                    'T)

              (rule '(or F T)
                    'T)

              (rule '(or F F)
                    'F))

   (rule-card (rule '(not T)
                    'F)

              (rule '(not F)
                    'T))

   

)))