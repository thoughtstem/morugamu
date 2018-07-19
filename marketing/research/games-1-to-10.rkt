#lang racket

(require plot)
(plot-new-window? #t)

(plot (list (discrete-histogram
               '(#(Vanguard-of-War 2) #(Era-of-Kingdoms 0.8) #(Reign-Ed.2 3.5)
                 #(The-Game-of-Crimps 0.85) #(Game-to-Pick-a-Game 0.8) #(Crown-of-Aragon 0.75)
                 #(Darkness-Incarnate 5) #(Absolutism 1.5) #(STARTROPOLIS 1)
                 #(Miremarsh 5.9))
               #:skip 2 #:x-min 0
               #:label "$ Asked For")
              (discrete-histogram
               '(#(Vanguard-of-War 12.3) #(Era-of-Kingdoms .85) #(Reign-Ed.2 2.1)
                 #(The-Game-of-Crimps .28) #(Game-to-Pick-a-Game 1.8) #(Crown-of-Aragon .19)
                 #(Darkness-Incarnate 0) #(Absolutism .39) #(STARTROPOLIS 3.69)
                 #(Miremarsh 9.9))
               #:skip 2 #:x-min 1
               #:label "$ Received" #:color 2 #:line-color 2))
        #:x-label "Games" #:y-label "Money (in tens of thousands of dollars)"
        #:title "Board Games Funded Via Kickstarter")

;Note about the "Absolutism" game: full name is Absolutism: Surviving Dictatorship
