#lang racket

(provide render)

(require "./card-designs.rkt"
         "./rules.rkt"
         2htdp/image)

;Basic symbols

(define (icon s)
  (text s 50 "black"))

(define (render theme)

  (define-tile < '< (first theme))
    ;(bitmap "../themes/emojis/LessThan.png"))
    

  (define-tile max 'max (second theme))
    ;(bitmap "../themes/emojis/max.png"))
    ;(text "max" 50 "black"))
  
  (define-tile ret 'ret (third theme))
    ;(bitmap "../themes/emojis/ret.png"))

  (define-tile = '= (fourth theme))
    ;(bitmap "../themes/emojis/equals.png"))
  
  (define-tile min 'min (fifth theme))
    ;(bitmap "../themes/emojis/min.png"))
  
  (define-tile > '> (sixth theme))
    ;(bitmap "../themes/emojis/GreaterThan.png"))

  (define-tile >= '>= (seventh theme))
  (define-tile <= '<= (eighth theme))
  
  (list
   (symbol-page)


;less than
   (rule-card (rule '(< x x) 'F)
           
              (rule '(< x 9) 'T)
              (rule '(< 9 x) 'F)
           
              (rule '(< x 8) 'T)
              (rule '(< 8 x) 'F)
              )
   
   (rule-card (rule '(< x 7) 'T)
              (rule '(< 7 x) 'F)

              (rule '(< x 6) 'T)
              (rule '(< 6 x) 'F)

              (rule '(< x 5) 'T)
              )

   (rule-card (rule '(< 5 x) 'F)

              (rule '(< x 4) 'T)
              (rule '(< 4 x) 'F)

              (rule '(< x 3) 'T)
              (rule '(< 3 x) 'F)

              )


   (rule-card (rule '(< x 2) 'T)
              (rule '(< 2 x) 'F)

              (rule '(< x 1) 'T)
              (rule '(< 1 x) 'F)

              (rule '(< 0 0) 'F)) 

;greater than
   
 (rule-card (rule '(> y x) '(< x y)))
;max
   (rule-card (rule '(max x y)
                    '(if (< x y)
                         (ret y)
                         (ret x)))
              (rule '(ret x)
                    'x)
              (rule '(ret y)
                    'y)
              )
;equals
   (rule-card (rule '(= x x) 'T)
              (rule '(= x y) 'F))
   
;min   
(rule-card (rule '(min x y)
                    '(if (< x y)
                         (ret x)
                         (ret y)))
              (rule '(ret x)
                    'x)
              (rule '(ret y)
                    'y)
              )


  )
  )





