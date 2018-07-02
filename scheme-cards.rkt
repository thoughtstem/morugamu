#lang racket

(require "./card-designs.rkt"
         "./rules.rkt"
         (prefix-in list: "./list-algebra-cards.rkt")
         (prefix-in bool: "./boolean-algebra-cards.rkt")
         (prefix-in numb: "./clock-number-cards.rkt")

         (prefix-in list: "./themes/emoji-list-algebra.rkt")
         (prefix-in numb: "./themes/emoji-clock-arithmetic.rkt")
         (prefix-in bool: "./themes/emoji-boolean-algebra.rkt")
         2htdp/image)


;Get this working.  I want to prototype some rules/puzzles
;  that combine various other languages together...
;  Multi-variadics?  Lists to other "domains".  Etc...
;  More complex "games"
;  (repeat x f i), repeats x times (f (f ... (f i)))

(define list-stuff (list:render list:theme))
(define bool-stuff (bool:render bool:theme))
(define numb-stuff (numb:render numb:theme))

;numb-stuff

;Adding multi-digit numbers...

(define-tile list-S* 'S*
  (bitmap "./themes/emojis/S.png")
  #;(text "S*" 50 "black"))

(define-tile list-add* 'add*
  (bitmap "./themes/emojis/add.png")
  #;(text "S*" 50 "black"))

(define-tile carry 'carry
  #;(bitmap "./themes/emojis/add.png")
  (text "carry" 50 "black"))



(define-tile = '=
  #;(bitmap "./themes/emojis/add.png")
  (text "=" 50 "black"))

(define-tile max 'max
  #;(bitmap "./themes/emojis/add.png")
  (text "max" 50 "black"))

(define-tile if 'if
  #;(bitmap "./themes/emojis/add.png")
  (text "if" 50 "black"))

(define-tile identity 'identity
  #;(bitmap "./themes/emojis/add.png")
  (text "id" 50 "black"))

;This is a hack to get around a bug in how
;  racket-bricks renders things when there
;  are two open-parens in a row.
;  (call (f) x) works, but ((f) x) doesn't...
;Hacky hacky...
(define-meta-tile call 'call
  #;(bitmap "./themes/emojis/add.png")
  (text "" 50 "black"))

(define-tile apply 'apply
  #;(bitmap "./themes/emojis/add.png")
  (text "apply" 50 "black"))


(rule-card (rule '(= x x)
                 'T)
           (rule '(= x y)
                 'F))

(rule-card (rule '(identity x)
                 'x))



(rule-card (rule '(if T x y)
                 'x)
           (rule '(if F x y)
                 'y))






(rule-card (rule '(S* nil)
                 'nil)
           (rule '(S* (cons 9 x))
                 '(cons 0 (S* x)))
           (rule '(S* (cons x y))
                 '(cons (S x) y)))


;If carry is local, it needs to be designated
;  that way...
(rule-card (rule '(add* nil) 'nil)
           
           (rule '(add* (cons x y)
                        (cons a b))
                 '(cons (add x a)
                        (call
                         (carry x a)
                         (add* y b))))

           (rule '(carry x y)
                 '(if (< (add x y)
                         (max x y))
                      S
                      identity)))

;Makes a binary operator work on a larger list.
;  (apply + (list 1 2 3))
(rule-card (rule '(apply x (cons y (cons a nil)))
                 '(x y a))
           
           (rule '(apply x (cons y a))
                 '(x y (apply x a))))
           

;How to define l-add?
;Does this (or any of the recent rule sets)
;  lead to fun puzzles?







