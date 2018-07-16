#lang racket

(provide render)

(require "../rule-systems/card-designs.rkt"
         "../rule-systems/rules.rkt"
         2htdp/image)

(module+ test
  (require (prefix-in numb: "../themes/emoji-clock-arithmetic.rkt"))

  (render numb:theme))

(define (icon s)
  (text s 50 "black"))

(define (render theme)


  (define dot (third theme))


  (define-tile the-successor  'S
    (first theme))

  (define-tile the-previous  'P
    (second theme))

  (define-tile the-0 '0
    (fourth theme))

  (define-tile the-1 '1
    dot)

  (define-tile the-2 '2
    (beside dot dot))

  (define-tile the-3 '3
    (above dot (beside dot dot)))

  (define-tile the-4 '4
    (above (beside dot dot) (beside dot dot)))

  (define-tile the-5 '5
    (above (beside dot dot)
           dot
           (beside dot dot)))

  (define-tile the-6 '6
    (beside (above dot dot dot)
            (above dot dot dot)))

  (define-tile the-7 '7
    (beside (above dot dot dot)
            dot
            (above dot dot dot))
    #;(text "7" 40 "black"))

  (define-tile the-8 '8
    (beside (above dot dot dot)
            (above dot dot)
            (above dot dot dot)))

  (define-tile the-9 '9
    (beside (above dot dot dot)
            (above dot dot dot)
            (above dot dot dot)))


  (define-tile the-prompt '?
    (text "?" 40 "black"))


  (define-tile the-add  'add
    (fifth theme))

  (define-tile the-sub  'sub
    (sixth theme))

  (define-tile < '<
  #;(bitmap "./themes/emojis/add.png")
  (text "<" 50 "black"))



  
  (list
   (symbol-page)




   ;Transformation rules

   (rule-card (rule '(S 0) '1)
              (rule '(S 1) '2)
              (rule '(S 2) '3)
              (rule '(S 3) '4)
              (rule '(S 4) '5))

   (rule-card (rule '(S 5) '6)
              (rule '(S 6) '7)
              (rule '(S 7) '8)
              (rule '(S 8) '9)
              (rule '(S 9) '0))

   (rule-card (rule '(P 0) '9)
              (rule '(P 1) '0)
              (rule '(P 2) '1)
              (rule '(P 3) '2)
              (rule '(P 4) '3))

   (rule-card (rule '(P 5) '4)
              (rule '(P 6) '5)
              (rule '(P 7) '6)
              (rule '(P 8) '7)
              (rule '(P 9) '8))


   (rule-card (rule '(add x 0)
                    'x)
              (rule '(add x y)
                    '(add (S x) (P y))))


   (rule-card (rule '(sub x 0)
                    'x)
              (rule '(sub x y)
                    '(sub (P x) (P y))))
   ))





