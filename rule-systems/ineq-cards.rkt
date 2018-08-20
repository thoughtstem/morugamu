#lang racket

(require "./common.rkt"
         "./redex/ineq.rkt")

(module+ test
  (require-lang bool)
  (require-lang numb)
  
  (require (prefix-in ineq: "../themes/emoji-ineq.rkt"))

  (render ineq:theme))

(make-generator generate ineq-lang e)
(make-simulator simulate ineq-lang)

(make-renderer render
               (< max ret = min > >= <=))

