#lang racket

(provide table
         id
         name
         members)

(define id first)
(define name second)
(define members third)

(define (table)
  (list '(Load-Board-Game "Load Board Game" 3) ;Are there 3 members?  I just made that up. ~Stephen
        ))
