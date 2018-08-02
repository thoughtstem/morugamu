#lang racket
(require plot)

(define (make-venn-diagram title lst)
  (plot-new-window? #t)
  (plot (flatten (list (isoline (λ (x y) (sqrt (+ (sqr (- x 1)) (sqr y)))) 1.5
                                -2 2 -2 2 #:label "Unsuccessful Qualities" #:color "red")
                       (isoline (λ (x y) (sqrt (+ (sqr (+ x 1)) (sqr y)))) 1.5
                                -2 2 -2 2 #:label "Successful Qualities" #:color "blue")
                       ;(point-label (vector 1 1) "hi")
                       lst)) #:x-label #f #:y-label #f #:title title))

;making a test venn-diagram
(make-venn-diagram "apple" '())

;to-do: write a function that will add data points to graph with point-label function
;NAME: add-points
;PARAMETERS: list of labels
(define (repeat f n l)
  (if (= n 0)
      l
      (repeat f
              (- n 1)
              (f l))
      ))

;use the length of a list of points to determine the y-coordinate of a new point that's added
;PARAMETERS: cur-list...list of the points currently on the graph
;            label......label of new point to be added
;            success?...needs to be either "y","n","b" ("yes", "no", "both")
;DESCRIPTION: uses the length of cur-list to determine where to place a new point with the specified label
;RETURNS: cur-list with one more vector added (so like a list)
(define (add-point label cur-list #|success?|#)
  (cons (point-label (vector 1 (+ (* (length cur-list) .1) .4)) label) cur-list)
  )

(define l (list (point-label (vector 1 1) "a")
            (point-label (vector 1 .90) "b")
            (point-label (vector 1 .8) "c")))

(make-venn-diagram "please work" (add-point "d" l))