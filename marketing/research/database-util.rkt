#lang racket

(define lst
(list '("a" 1) '("b" 1) '("c" 1) '("d" 1)))

(define (get-index game)
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

(get-index "d")