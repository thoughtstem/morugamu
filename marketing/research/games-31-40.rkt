#lang racket

(require plot)
(plot-new-window? #t)
(parameterize ([plot-x-tick-label-anchor 'top-right]
               [plot-x-tick-label-angle 30])

(plot (list (discrete-histogram
               '(#(Dark-Matter 2.5) #(HeartBeat-Pride-Dice 3) #(Bat-Cup 1.9)
                 #(Dragon-Realms 0.78) #(Nunami 5.27) #(The-Acts-Board-Game 0.4)
                 #(The-Villagers 0.13) #(Infinity-D4 1) #(Thug-Life 5)
                 #(John-Silence 1))
               #:skip 2 #:x-min 0
               #:label "$ Asked For")
              (discrete-histogram
               '(#(Dark-Matter 1.3) #(HeartBeat-Pride-Dice 7.8) #(Bat-Cup 2.8)
                 #(Dragon-Realms 0.72) #(Nunami 1.16) #(The-Acts-Board-Game 0.27)
                 #(The-Villagers 1) #(Infinity-D4 0.9) #(Thug-Life 0.97)
                 #(John-Silence 0.39))
               #:skip 2 #:x-min 1
               #:label "$ Received" #:color 2 #:line-color 2))
        #:x-label "Games" #:y-label "Money (in tens of thousands of dollars)"
        #:title "Board Games Funded Via Kickstarter"))