#lang racket

(provide render)

(require "./card-designs.rkt"
         "./rules.rkt"

         2htdp/image)

(module+ test
  (require (prefix-in numb: "../themes/emoji-functions-list-algebra.rkt"))

  (render numb:theme))

(define (icon s)
  (text s 50 "black"))

(define (render theme)

  (define-tile len 'len
    (bitmap "../themes/emojis/length.png"))
  (define-tile cons 'cons
    (bitmap "../themes/emojis/cons.png"))
  (define-tile nil 'nil
    (bitmap "../themes/emojis/nil.png"))

  (define dot (third theme))
  (define-tile the-1          '1    dot)
  (define-tile the-3 '3
    (above dot (beside dot dot)))
  (define-tile the-prompt '?
    (text "?" 40 "black"))


(flatten (list
   (get-rparen)
   (get-lparen)
   (get-all-symbols)

  
  (rule-card (rule '(len (cons x nil))
                   '1)
             (rule '(len (cons x (cons x nil)))
                         '3))

  (rule-card (rule '(len x y)
                   '?)))))



