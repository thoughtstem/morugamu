#lang racket
(require plot)

(define (make-venn-diagram str)
(plot-new-window? #t)
(plot (list (isoline (λ (x y) (sqrt (+ (sqr (- x 1)) (sqr y)))) 1.5
                     -2 2 -2 2 #:label "Unsuccessful Qualities" #:color "red")
            (isoline (λ (x y) (sqrt (+ (sqr (+ x 1)) (sqr y)))) 1.5
                     -2 2 -2 2 #:label "Successful Qualities" #:color "blue")
            (point-label (vector 1 1) "hi")) #:x-label #f #:y-label #f #:title str))

(make-venn-diagram "apple")

;to-do: add data points to graph with point-label function