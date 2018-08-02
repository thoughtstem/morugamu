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
        
(define vector-successful
  (map list->vector (elements->lst (util:success? (game:table)) 2 3))
  )


(define vector-centroids
  (map list->vector (map (curry map exact-round) centers)))
  

(plot (list (points vector-successful)
            (points vector-centroids
                    #:color "blue" #:line-width 6)))