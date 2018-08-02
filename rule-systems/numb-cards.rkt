#lang racket

(require "./common.rkt")
(require "./redex/clock-numbers.rkt")

(make-generator generate clock-numbers-lang e)
(make-simulator simulate clock-numbers-red)
(make-renderer  render
                (S P
                 0 1 2 3 4 5 6 7 8 9
                 add sub)) 

(module+ test
  (require "../themes/emoji-numb.rkt")
  (render theme))
