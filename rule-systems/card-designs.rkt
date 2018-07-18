#lang racket

(provide render-symbol
;<<<<<<< HEAD
         symbol-page
         lparen
         rparen
         get-lparen
         get-rparen
;=======
        ; symbol-page
         lparen
         rparen
         get-rparen
         get-lparen
;>>>>>>> ;b281fde6f6053f5766f035b77a5ed3eb1eb49908
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

;<<<<<<< HEAD
;=======
;start of accessor functions
(define (get-rparen)
  rparen)

(define (get-lparen)
  lparen)

(define (get-all-symbols)
  (all-symbols))
;end of accessor functions

;>>>>>>> b281fde6f6053f5766f035b77a5ed3eb1eb49908

(define (symbol-page)
  (apply above
         (append
          (list 
           (row lparen 6)
           (row rparen 6))
;<<<<<<< HEAD
          (map (curryr row 6) (all-symbols)))))
;=======
          (map (curryr row 6) (all-symbols)) 
;>>>>>>> b281fde6f6053f5766f035b77a5ed3eb1eb49908

(define-tile the-x  'x
  (square 50 "solid" "green"))

(define-tile the-y  'y
  (square 50 "solid" "red"))

(define-tile the-a  'a
  (square 50 "solid" "blue"))

(define-tile the-b  'b
  (square 50 "solid" "yellow"))

;start of accessor functions
(define (get-rparen1)
  rparen)

(define (get-lparen2)
  lparen)

(define (get-all-symbols1)
  (all-symbols))
;end of accessor functions
