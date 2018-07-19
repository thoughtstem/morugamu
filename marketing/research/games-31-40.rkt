#lang racket

(require plot)
(plot-new-window? #t)

(plot (list (discrete-histogram
               '(#(g1 2) #(g2 0.8) #(g3 3.5)
                 #(g4 0.85) #(g5 0.8) #(g6 0.75)
                 #(g7 5) #(g8 1.5) #(g9 1)
                 #(g10 5.9))
               #:skip 2 #:x-min 0
               #:label "$ Asked For")
              (discrete-histogram
               '(#(g1 2) #(g2 0.8) #(g3 3.5)
                 #(g4 0.85) #(g5 0.8) #(g6 0.75)
                 #(g7 5) #(g8 1.5) #(g9 1)
                 #(g10 5.9))
               #:skip 2 #:x-min 1
               #:label "$ Received" #:color 2 #:line-color 2))
        #:x-label "Games" #:y-label "Money (in tens of thousands of dollars)"
        #:title "Board Games Funded Via Kickstarter")