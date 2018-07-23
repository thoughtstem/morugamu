#lang racket

(require plot)
(plot-new-window? #t)
(parameterize ([plot-x-tick-label-anchor 'top-right]
               [plot-x-tick-label-angle 40])
(plot (list (discrete-histogram
               '(#(Rise-of-the-Necromancers 4.2) #(Paradox 2.6) #(Exile-Sun 1.8)
                 #(Monster-Derby 1) #(Cosmic-Balance 3) #(Guilds-of-Cadwallon 0.5)
                 #(Rivet-Wars 2.5) #(4-the-Birds 1.1) #(Fireteam-Zero 3)
                 #(Evolution:CLIMATE 2))
               #:skip 3 #:x-min 0
               #:label "$ Asked For")
              (discrete-histogram
               '(#(Rise-of-the-Necromancers 6.6) #(Paradox 4.6) #(Exile-Sun 2.3)
                 #(Monster-Derby 1) #(Cosmic-Balance 3.5) #(Guilds-of-Cadwallon 11.7)
                 #(Rivet-Wars 58.2) #(4-the-Birds 1.7) #(Fireteam-Zero 20.7)
                 #(Evolution:CLIMATE 33.7))
               #:skip 3 #:x-min 1
               #:label "$ Received" #:color 2 #:line-color 2))
        #:x-label "Games" #:y-label "Money (in tens of thousands of dollars)"
        #:title "Board Games Funded Via Kickstarter"))

;Note:4 the Birds was a Kickstarter staff pick