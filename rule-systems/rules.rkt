#lang racket

(provide rule-card
         puzzle-card
         rule
         rule-from
         rule-to
         redex-to-rule-card
         redex-to-rule-cards)

(require 2htdp/image
         "./cards.rkt"
         "./card-designs.rkt"
         "../util/config.rkt"
         "../util/util.rkt")

(define (scale-to s i)
  (define m (max (image-width i)
                 (image-height i)))
  (scale (/ s m ) i))

(define (make-safe f)
  (lambda (arg . args)
    (if (empty? args)
        arg
        (apply f (cons arg args)))))

(struct rule (from to) #:transparent)

(define (render-rule r)
  (beside
   (render-example (rule-from r))
   (text "⟶" 100  "black")
   (render-example (rule-to r))))

(define space
  (square 50 "solid" "transparent"))

(define spacer
  (above
         space
         (rectangle 1000 20 "solid" "black")
         space))

(define (rule-card #:width (width BIG-CARD-WIDTH)
                   #:height (height BIG-CARD-HEIGHT)
                   #:caption (caption (text "Rules" 30 "black"))
                   #:icon (icon #t)
                   . rules )
  (define inner
    (scale 0.25
         (apply (make-safe above)
                (add-between (map render-rule rules) spacer))))

  (define first-rule-from (rule-from (first rules)))
  (define symbol (if (list? first-rule-from)
                         (first first-rule-from)
                         first-rule-from))

  (place-image
   (beside (if icon
               (scale 0.25 (render-symbol symbol))
               empty-image)
           caption)
   60 20
   (overlay (scale-to (- width 20) inner)
           (rectangle width
                      height
                      "outline"
                      (pen "black" 10 "solid" "round" "bevel")))))

(define (puzzle-card . rules)
  (apply
   (curry rule-card
          #:width  BIG-CARD-HEIGHT
          #:height BIG-CARD-WIDTH
          #:caption (text "                                        Puzzle" 30 "black")
          #:icon #f)
   rules)
)


(define (redex-to-rule-line d)
  (rule (first d) (second d)))

(define (redex-to-rule-card d)
  (apply rule-card (map redex-to-rule-line d)))


(define (redex-to-rule-cards d)
  (map redex-to-rule-card
       (split-by d 5)))