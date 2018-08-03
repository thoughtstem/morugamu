#lang racket

(require (prefix-in game: "../../data/games/database.rkt"))
(require (prefix-in data: "../../data/stephens-database-util.rkt"))
(require plot)

(plot-new-window? #t)

;Better names for our various data types
(define row? list?)
(define table? (listof list?))
(define column? procedure?)
(define id? symbol?)

(module+ test
  (require rackunit))

(define xs (flatten (data:keep-columns (list game:$asked-for) (game:table))))
(define ys (flatten (data:keep-columns (list game:$received) (game:table))))

;TODO: fix y-axis on one graph so it matches the other
;TODO: overlay trendline graph over scatterplot

; NAME: draw-scatter
; 
; DESCRIPTION: Plots points for the amount of money asked for vs received on a game by game basis.
; 
; EXAMPLE: (draw-scatter)


(define (draw-scatter)
  (parameterize ([plot-x-label  "$ Asked For"]
                 [plot-y-label  "$ Received"])
    (plot (points (map vector xs ys)
                        #:x-min 0 #:x-max 55
                        #:y-min 0 #:y-max 450))
    (plot-file (points (map vector xs ys)
                       #:x-min 0 #:x-max 55
                       #:y-min 0 #:y-max 450)
               "scatterplot.png")))

(define (multiply-lists a b)
  (if (empty? a)
      empty
      (cons (* (car a) (car b))
            (multiply-lists (cdr a) (cdr b)))))

(define (sum-elements-in-list L)
  (apply + L))

(define (square-elements-in-list xs)
  (map (lambda (x) (* x x)) xs))

(define (get-slope)
  (/ (- (* (length xs) (sum-elements-in-list (multiply-lists xs ys))) (* (sum-elements-in-list xs) (sum-elements-in-list ys))) (- (* (length xs) (sum-elements-in-list (square-elements-in-list xs))) (expt (sum-elements-in-list xs) 2))))

(define (offset)
  (/ (- (sum-elements-in-list ys) (* (get-slope) (sum-elements-in-list xs))) (length ys)))

; NAME: draw-trend
; 
; DESCRIPTION: Draws the trend line for the correlation between money asked for and money received
; 
; EXAMPLE: (draw-trend)

(define (draw-trend)
  (parameterize ([plot-x-label  "$ Asked For"]
                 [plot-y-label  "$ Received"])
  (plot (list (axes)
              (function (λ (x) (+ (* (get-slope) x) (offset))) 0 55)))
  (plot-file (list (axes)
              (function (λ (x) (+ (* (get-slope) x) (offset))) 0 55))
             "trend_line.png")))

(draw-scatter)
(draw-trend)