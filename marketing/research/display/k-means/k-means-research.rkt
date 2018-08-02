#lang racket

(require "k-means.rkt"
         plot

         "../display-util.rkt"
         "../../../../util/util.rkt"
         (prefix-in game: "../../data/games/database.rkt")
         (prefix-in util: "../../data/stephens-database-util.rkt")
         )

(plot-new-window? #t)

  
;finds the centroids
(define (make-3d-cluster)
  (map list
       (map third (util:success? (game:table))) ;asked for list
       (map fourth (util:success? (game:table))) ;recieved amount list

))

;defining the clusters here, feel free to add/subtract as many as needed/wanted
(define c1 (make-3d-cluster))
(define c2 (make-3d-cluster))
(define c3 (make-3d-cluster))
(define c4 (make-3d-cluster))
(define c5 (make-3d-cluster))

;remember to change the lines below to accomodate the amount of clusters
(define points1 (shuffle (append c1 c2 c3 c4 c5)))
(define-values (centers clusters) (cluster points1 5))

(printf "centroid locations: ~a\n"
        (map (curry map exact-round) centers))

;Defining vectors
(define vector-successful
  (map list->vector (elements->lst (util:success? (game:table)) 2 3))
  )


(define vector-centroids
  (map list->vector (map (curry map exact-round) centers)))
  

;plotting vectors
(plot (list (points vector-successful)
            (points vector-centroids
                    #:color "blue" #:line-width 6)))

;start of partitioning functions
;finding distances between centroids
(define (get-x p) (car p))
(define (get-y p) (car p))


(define (get-first-point pt-list)
        (get-x pt-list))

(define (get-rest-points pt-list)
        (get-y pt-list))
(define (distance a b)
  (let ((square (lambda (x)
                  (* x x))))
    (sqrt (+ (square (- (car a) (car b)))
             (square (- (cdr a) (cdr b)))))))

(define successes-points (map cons (map first (map vector->list vector-successful))
                                   (map second (map vector->list vector-successful)
                                        )))
(define centroids-points (map cons (map first (map vector->list vector-centroids))
                                   (map second (map vector->list vector-centroids))
          ))

(define points-colors '())



(for ([i (in-range 1 (length successes-points))])
  (define mindistance 10000000)

  (for ([j (in-range 1 (length centroids-points))])
    (if (>= mindistance (distance (list-ref successes-points i) (list-ref centroids-points j)))
        ((set! mindistance (distance (list-ref successes-points i) (list-ref centroids-points j)))
        (append points-colors j))
        '()
        )
    )
    )
 