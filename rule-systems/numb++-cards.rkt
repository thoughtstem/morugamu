#lang racket


(require "./common.rkt")

(require "./redex/clock-numbers++.rkt")

(module+ test
  (require-lang list)
  (require-lang numb)

  (render numb:theme))

(make-generator generate clock-numbers++-lang cn++-e)
(make-simulator simulate clock-numbers++-red)
(make-renderer  render
                (S++ P++))

