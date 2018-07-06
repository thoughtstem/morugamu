#lang racket

(provide render)

(require "./card-designs.rkt"
         "./rules.rkt"
         2htdp/image)

;Basic symbols

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



   (rule-card (rule '(add x 0)
                    'x)
              (rule '(add x (S y))
                    '(add (S x) y)))


   (rule-card (rule '(P x)
                    '(add x 9)))


   (rule-card (rule '(sub x 0)
                    'x)
              (rule '(sub x (S y))
                    '(sub (P x) y)))



   ))





