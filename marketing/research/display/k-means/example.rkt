#lang racket
;; Luke Miles, June 2015
(require "k-means.rkt")
(require (only-in math/distributions normal-dist sample))

;; makes a list triplets with a mean of (m1 m2 m3)
(define (make-3d-cluster m1 m2 m3)
  (map list
       (sample (normal-dist m1 1) 20)
       (sample (normal-dist m2 1) 20)
       (sample (normal-dist m3 1) 20)))

;; defined seperately here so you can compare
;; the results after it's evaluated
(define c1 (make-3d-cluster 0 0 0))
(define c2 (make-3d-cluster 7 -10 4))
(define c3 (make-3d-cluster -6 5 5))
(define c4 (make-3d-cluster -12 -10 -8))
(define c5 (make-3d-cluster 22 11 15))

(define points (shuffle (append c1 c2 c3 c4 c5)))

(define-values (centers clusters) (cluster points 5))

(printf "centers are about: ~a\n" (map (curry map exact-round) centers))
