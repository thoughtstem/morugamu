#lang racket

(provide render-symbol
         ;symbol-page
         lparen
         rparen
         get-rparen
         get-lparen
         get-all-symbols
         define-tile
         define-meta-tile
         set-symbol-map!)

(require 2htdp/image)
(require "../util/config.rkt")

(define (scale-to s i)
  (define m (max (image-width i)
                 (image-height i)))
  (scale (/ s m ) i))

(define (card i)
  (overlay
   (scale-to (- CARD-SIZE 20) i)
   (square CARD-SIZE "outline"
           (pen "black" 10 "solid" "round" "bevel"))
   (square (add1 TOTAL-CARD-SIZE) "outline" "white")))

(define lparen (card (text "(" 70 "black")))
(define rparen (card (text ")" 70 "black")))

;Abstract symbols...
(define symbol-map (hash ))

(define (set-symbol-map! k v)
  (set! symbol-map (hash-set symbol-map k v)))

(define-syntax-rule (define-tile name symbol image)
  (begin
    (define name
      (card image))
    (set-symbol-map! symbol name)))

(define-syntax-rule (define-meta-tile name symbol image)
  (begin
    (define name image)
    (set-symbol-map! symbol name)))


(define (render-symbol s)
  (hash-ref symbol-map s))


(define (all-symbols)
  (hash-values symbol-map))

(define (row i n)
  (apply beside (map (thunk* i) (range n))))

;start of accessor functions
(define (get-rparen)
  rparen)

(define (get-lparen)
  lparen)

(define (get-all-symbols)
  all-symbols)
;end of accessor functions

#|
(define (symbol-page)
  (apply above
         (append
          (list 
           (row lparen 6)
           (row rparen 6))
          (map (curryr row 6) (all-symbols))))) |#

(define-tile the-x  'x
  (square 50 "solid" "green"))

(define-tile the-y  'y
  (square 50 "solid" "red"))

(define-tile the-a  'a
  (square 50 "solid" "blue"))

(define-tile the-b  'b
  (square 50 "solid" "yellow"))
