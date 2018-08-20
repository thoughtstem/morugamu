#lang racket

(require "./common.rkt"
         "./redex/list.rkt")

(module+ test
  (require (prefix-in list: "../themes/emoji-list.rkt"))

  (render list:theme))

(make-generator generate list-lang e)
(make-simulator simulate list-lang)

(make-renderer render
               (cons nil head tail))
