#lang racket

(require "./common.rkt"
         "./redex/inequalities.rkt")

(module+ test
  (require-lang bool)
  (require-lang numb)
  
  (require (prefix-in ineq: "../themes/emoji-ineq.rkt"))

  (render ineq:theme))

(make-generator generate inequalities-lang e)
(make-simulator simulate inequalities-lang)

(make-renderer render
               (< max ret = min > >= <=))

