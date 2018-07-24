#lang racket

(define (get-index game lst)
  (define (recSearch n query)
    (if (> n (length lst))
    -1
      '())
    (if (string=? (string-downcase query) (string-downcase (list-ref (list-ref lst n) 0)))
    n
    (recSearch (+ n 1) query))
    )
  (recSearch 0 game)
)

(get-index "Dinosaur Island" board-game-list)
