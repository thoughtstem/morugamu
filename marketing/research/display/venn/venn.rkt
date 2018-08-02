#lang racket
(require plot)

;PARAMETERS: title...title of the new veen-diagram
;            lst...list of labels to put in the venn diagram
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


;use the length of a list of points to determine the y-coordinate of a new point that's added
;PARAMETERS: cur-list...list of the points currently on the graph
;            label......label of new point to be added
;            success?...needs to be either "y","n","b" ("yes", "no", "both")
;DESCRIPTION: uses the length of cur-list to determine where to place a new point with the specified label
;RETURNS: cur-list with one more vector added (so like a list)
(define (add-point label cur-list #|success?|#)
  (cons (point-label (vector 1 (+ (* (length cur-list) .1) .1)) label) cur-list)
  )


;testing add-point
(make-venn-diagram "please work" (add-point "a" (add-point "b" (add-point "c" (add-point "d" (list))))))


;TO-DO: implement success? parameter in add-point function so points can be placed in the right spot in the diagram



;--------------------------------------------------------------------
;repeat code for later
(define (repeat f n l)
  (if (= n 0)
      l
      (repeat f
              (- n 1)
              (f l))
      ))