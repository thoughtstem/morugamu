#lang racket

(require
  plot
  "../../util/util.rkt"
  "./database.rkt")

(define vector-asked
  (map list->vector (elements->lst board-game-list 0 1)))

(define vector-received
  (map list->vector (elements->lst board-game-list 0 2)))

(plot-new-window? #t)

(parameterize ([plot-x-tick-label-anchor 'top-right]
               [plot-x-tick-label-angle 50])

(plot (list (discrete-histogram
               vector-asked
               #:skip 3 #:x-min 0
               #:label "$ Asked For")
              (discrete-histogram
               vector-received
               #:skip 3 #:x-min 1
               #:label "$ Received" #:color 2 #:line-color 2))
        #:x-label "Games" #:y-label "Money (in tens of thousands of dollars)"
        #:title "Board Games Funded Via Kickstarter"))