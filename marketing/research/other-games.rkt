#lang racket

(require plot)
(plot-new-window? #t)

(plot (list (discrete-histogram
               '(#(Vanguard-of-War 20) #(Era-of-Kingdoms 8) #(Reign-Ed.2 35)
                 #(The-Game-of-Crimps 8.5) #(Game-to-Pick-a-Game 8) #(Crown-of-Aragon 7.5)
                 #(Game-7 4.5) #(Game-8 3) #(Game-9 2)
                 #(Game-10 2))
               #:skip 2 #:x-min 0
               #:label "$ Asked For")
              (discrete-histogram
               '(#(Vanguard-of-War 123) #(Era-of-Kingdoms 8.5) #(Reign-Ed.2 21)
                 #(The-Game-of-Crimps 2.8) #(Game-to-Pick-a-Game 17.7) #(Crown-of-Aragon 1.9)
                 #(Game-7 3) #(Game-8 4) #(Game-9 3)
                 #(Game-10 4))
               #:skip 2 #:x-min 1
               #:label "$ Received" #:color 2 #:line-color 2))
        #:x-label "Games" #:y-label "Money (in tens of thousands of dollars)"
        #:title "Board Games Funded Via Kickstarter")
