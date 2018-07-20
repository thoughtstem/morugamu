#lang racket

(require plot)
(plot-new-window? #t)

(plot (list (discrete-histogram
               '(#(Dark-Matter 2) #(HeartBeat-Pride-Dice 0.8) #(Bat-Cup 3.5)
                 #(Dragon-Realms 0.85) #(g5 0.8) #(g6 0.75)
                 #(g7 5) #(g8 1.5) #(g9 1)
                 #(g10 5.9))
               #:skip 2 #:x-min 0
               #:label "$ Asked For")
              (discrete-histogram
               '(#(Dark-Matter 1.3) #(HeartBeat-Pride-Dice 7.8) #(Bat-Cup 2.8)
                 #(Dragon-Realms 0.85) #(g5 0.8) #(g6 0.75)
                 #(g7 5) #(g8 1.5) #(g9 1)
                 #(g10 5.9))
               #:skip 2 #:x-min 1
               #:label "$ Received" #:color 2 #:line-color 2))
        #:x-label "Games" #:y-label "Money (in tens of thousands of dollars)"
        #:title "Board Games Funded Via Kickstarter")