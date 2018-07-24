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

; Query Function #1: received >= asked
(define (received-more data)
	(cond
          [(null? data) '()]
          [else (define elem1 (first data))
                (if (>= (list-ref elem1 2) (list-ref elem1 1))
                    (cons elem1 (received-more (rest data)))
                    (received-more (rest data))
                )]
         )
)

; Query Function #2: received >= $1,000,000
(define (greater-than-million data)
	(cond
          [(null? data) '()]
          [else (define elem1 (first data))
                (if (>= (list-ref elem1 2) 100)  ; units are in tens of thousands
                    (cons elem1 (greater-than-million (rest data)))
                    (greater-than-million (rest data))
                )]
         )
)

(get-index "Dinosaur Island" board-game-list)
