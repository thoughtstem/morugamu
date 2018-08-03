#lang racket
;NOTE: INSTALL UNSTABLE.PKG BEFORE RUNNING

(require (only-in unstable/list group-by))
(provide cluster)

;; splits a list ls into k non-empty & disjoint sublists
(define (split-into ls k)
  (define size (quotient (length ls) k))
  (let R ([ls ls] [k k])
    (if (= k 1)
      (list ls)
      (let-values ([(soon later) (split-at ls size)])
        (cons soon (R later (sub1 k)))))))

;; calculates the mean point in a list of points
(define (point-mean points)
  (define length@points (length points))
  (map (λ (ls) (/ (apply + ls) length@points))
       (apply map list points)))
         ;(zip points)))

;; squared euclidean distance
(define (distance p1 p2)
  (for/sum ([x1 (in-list p1)]
            [x2 (in-list p2)])
    (expt (- x2 x1) 2)))

;; the closest center to point in centers
(define (closest centers point)
  (argmin (curry distance point) centers))

;; returns the value x such that (f x) = x
(define (fixed-point f start [same? equal?])
  (let R ([x start])
    (let ([f@x (f x)])
      (if (same? x f@x)
        x
        (R f@x)))))

;; given a list of points and centers,
;; assign each point to the nearest center,
;; then return, for each center, the mean of the points closest to it
(define (make-next-centers points centers)
  (map point-mean (group-by (curry closest centers) points)))

;; divides the set S of points into k cluster
(define (cluster points k)
  (define first-centers (map point-mean (split-into points k)))
  (define final-centers
    (fixed-point (λ (centers) (make-next-centers points centers))
                 first-centers))
  (values final-centers (group-by (curry closest final-centers) points)))