#lang racket

(require plot)
(plot-new-window? #t)
(parameterize ([plot-x-tick-label-anchor 'top-right]
               [plot-x-tick-label-angle 30])

(plot (list (discrete-histogram
               '(#(MYTH 4) #(Dinosaur-Island 2.3) #(Trogdor 7.5)
                 #(Jetpack-Joyride .8) #(Shady-Agents 16.58) #(Wreck-Raiders .76)
                 #(Over-the-Edge 5) #(Rurik-Dawn-of-Kiev 5) #(SPQF 1)
                 #(Demon-City 2.3))
               #:skip 3 #:x-min 0
               #:label "$ Asked For")
            
              (discrete-histogram
               '(#(MYTH 92.6) #(Dinosaur-Island 204.5) #(Trogdor 46.2)
                 #(Jetpack-Joyride 8.19) #(Shady-Agents 17.7) #(Wreck-Raiders 4.5)
                 #(Over-the-Edge 8) #(Rurik-Dawn-of-Kiev 7.14) #(SPQF 2)
                 #(Demon-City 3.45))
               #:skip 3 #:x-min 1
               #:label "$ Received" #:color 2 #:line-color 2))
        #:x-label "Games" #:y-label "Money (in tens of thousands of dollars)"
        #:title "Board Games Funded Via Kickstarter"))
