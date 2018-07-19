#lang racket

(require plot)
(plot-new-window? #t)

(plot (list (discrete-histogram
               '(#(Game-1 1.5) #(Game-2 2.5) #(Game-3 3.5)
                 #(Game-4 1) #(Game-5 3) #(Game-6 5)
                 #(Game-7 4.5) #(Game-8 3) #(Game-9 2)
                 #(Game-10 2))
               #:skip 2 #:x-min 0
               #:label "$ Asked For")
              (discrete-histogram
               '(#(Game-1 1.4) #(Game-2 2.3) #(Game-3 3.1)
                 #(Game-4 2) #(Game-5 3.2) #(Game-6 2.1)
                 #(Game-7 3) #(Game-8 4) #(Game-9 3)
                 #(Game-10 4))
               #:skip 2 #:x-min 1
               #:label "$ Received" #:color 2 #:line-color 2))
        #:x-label "Games" #:y-label "Money (in tens of thousands of dollars)"
        #:title "Board Games Funded Via Kickstarter")
