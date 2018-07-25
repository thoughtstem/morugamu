#lang racket

(require
  plot
  "display-util.rkt"
  "../../../util/util.rkt"
  "../data/games/database.rkt")

;Plotting Games Database
(define vector-asked
  (map list->vector (elements->lst (table) 1 2)))

(define vector-received
  (map list->vector (elements->lst (table) 1 3)))

(plot-new-window? #t)

(parameterize ([plot-x-tick-label-anchor 'top-right]
               [plot-x-tick-label-angle 50])

(plot
 (list (data->histogram vector-asked 3 0 "$ Asked For" 0 0)
       (data->histogram vector-received 3 1 "$ Received" 2 2))
        #:x-label "Games" #:y-label "Money (in tens of thousands of dollars)"
        #:title "Board Games Funded Via Kickstarter"))