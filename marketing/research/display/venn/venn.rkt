#lang racket
(require plot)

(plot-new-window? #t)
(plot (list (isoline (λ (x y) (sqrt (+ (sqr (- x 1)) (sqr y)))) 1.5
                     -2 2 -2 2 #:label "z")
            (isoline (λ (x y) (sqrt (+ (sqr (+ x 1)) (sqr y)))) 1.5
                     -2 2 -2 2 #:label "z")
            (point-label (vector 1 1) "hi")))

;to-do: add data points to graph with point-label function