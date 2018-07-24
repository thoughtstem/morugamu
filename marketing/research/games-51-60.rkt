#lang racket

(require plot)
(plot-new-window? #t)
(parameterize ([plot-x-tick-label-anchor 'top-right]
               [plot-x-tick-label-angle 40])
(plot (list (discrete-histogram
               '(#(BatmanTM-Gotham-City-Chronicles 500) #(Zombicide:-Black-Plague 125) #(Shadows-of-Brimstone 30)
                 #(Tudor 10) #(Kitchen-Rush:-Piece-of-Cake 20) #(Eclipse:-Second-Dawn-for-the-Galaxy 150)
                 #(Space:-1889 22) #(THE-FANTASY-TRIP 20) #(Snag-the-Flag 6)
                 #(Unicorns-and-Zombies 12))
               #:skip 3 #:x-min 0
               #:label "$ Asked For")
              (discrete-histogram
               '(#(BatmanTM-Gotham-City-Chronicles 4403) #(Zombicide:-Black-Plague 4079) #(Shadows-of-Brimstone 1341)
                 #(Tudor 108) #(Kitchen-Rush:-Piece-of-Cake 82) #(Eclipse:-Second-Dawn-for-the-Galaxy 597)
                 #(Space:-1889 108) #(THE-FANTASY-TRIP 43) #(Snag-the-Flag 3)
                 #(Unicorns-and-Zombies 4))
               #:skip 3 #:x-min 1
               #:label "$ Received" #:color 2 #:line-color 2))
        #:x-label "Games" #:y-label "Money (in tens of thousands of dollars)"
        #:title "Board Games Funded Via Kickstarter"))


