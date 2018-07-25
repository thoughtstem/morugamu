#lang racket

(require
  plot
  "../../../util/util.rkt")

(provide data->histogram)

(define (data->histogram data-vector skip-num x-min label color line-color)
  (discrete-histogram
               data-vector
               #:skip skip-num
               #:x-min x-min
               #:label label
               #:color color
               #:line-color line-color))
