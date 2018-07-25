#lang racket

(provide table
         id
         company-id
         game-id)

(define id first)
(define company-id second)
(define game-id third)

(define (table)
  (list '(1 Load-Board-Game Vanguard-of-War)))
