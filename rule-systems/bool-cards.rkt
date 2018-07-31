#lang racket

(provide render
         generate)

(require "./common.rkt"
         "./redex/boolean-algebra.rkt")

(module+ test
  (require (prefix-in bool: "../themes/emoji-bool.rkt"))

  (render bool:theme))

(make-generator generate boolean-algebra-lang e)
(make-simulator simulate boolean-algebra-lang)
(make-renderer  render
                (and or not T F if))




