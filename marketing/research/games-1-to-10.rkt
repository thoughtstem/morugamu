#lang racket

(require plot)
(plot-new-window? #t)

(plot (list (discrete-histogram
               '(#(Vanguard-of-War 20) #(Era-of-Kingdoms 8) #(Reign-Ed.2 35)
                 #(The-Game-of-Crimps 8.5) #(Game-to-Pick-a-Game 8) #(Crown-of-Aragon 7.5)
                 #(Darkness-Incarnate 50) #(Absolutism 15) #(STARTROPOLIS 10)
                 #(Miremarsh 58.8))
               #:skip 2 #:x-min 0
               #:label "$ Asked For")
              (discrete-histogram
               '(#(Vanguard-of-War 123) #(Era-of-Kingdoms 8.5) #(Reign-Ed.2 21)
                 #(The-Game-of-Crimps 2.8) #(Game-to-Pick-a-Game 17.7) #(Crown-of-Aragon 1.9)
                 #(Darkness-Incarnate 0) #(Absolutism 3.9) #(STARTROPOLIS 36.9)
                 #(Miremarsh 98.5))
               #:skip 2 #:x-min 1
               #:label "$ Received" #:color 2 #:line-color 2))
        #:x-label "Games" #:y-label "Money (in tens of thousands of dollars)"
        #:title "Board Games Funded Via Kickstarter")

;Note about the "Absolutism" game: full name is Absolutism: Surviving Dictatorship
