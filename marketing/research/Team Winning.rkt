#lang racket
;Marlon, Ethan, Althea, Astha

(require plot)
(plot-new-window? #t)
(parameterize ([plot-x-tick-label-anchor 'top-right]
               [plot-x-tick-label-angle 30])
(plot (list (discrete-histogram
             '(#(Immortality .19) #(Lunarchitects 3) #(The-Island-Of-El-Dorado 2)
               #(Trogdor 7.5) #(Sword-and-Sorcery 7.5) #(Tiki 1.5) #(Apocalypse-Galactic-Arena 0.8)
               #(Bellum-of-Mutants-and-Men 0.8) #(Gloomhaven 3.8) #(MourneQuest 2.8) #(Galaxy-Defenders 4.0))
               #:skip 2 #:x-min 0
               #:label "$ Asked For")

             (discrete-histogram
              '(#(Immortality 3.0) #(Lunarchitects 4.0) #(The-Island-Of-El-Dorado 29.2)
               #(Trogdor 71.3) #(Sword-and-Sorcery 51.7) #(Tiki 3.8) #(Apocalypse-Galactic-Arena 1.1)
               #(Bellum-of-Mutants-and-Men 0.1) #(Gloomhaven 6.5) #(MourneQuest 3.0) #(Galaxy-Defenders 25.9))
               #:skip 2 #:x-min 1
               #:label "$ Received" #:color 2 #:line-color 2))
      #:x-label "Games" #:y-label "Money (in tens of thousands of dollars)"
        #:title "Board Games Funded Via Kickstarter"))