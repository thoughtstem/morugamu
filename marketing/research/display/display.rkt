#lang racket

(require
  plot
  "display-util.rkt"
  "../../../util/util.rkt"
  (prefix-in game: "../data/games/database.rkt")
  (prefix-in util:"../data/stephens-database-util.rkt")
   )

;Plotting Games Database
(define vector-asked
  (map list->vector (elements->lst (game:table) 1 2)))

(define vector-received
  (map list->vector (elements->lst (game:table) 1 3)))

(plot-new-window? #t)

;plotting successful games
(define vector-success-asked
  (map list->vector (elements->lst (util:Success? game:$received game:$asked-for (game:table)) 1 2)
  ))

(define vector-success-received
  (map list->vector (elements->lst (util:Success? game:$received game:$asked-for (game:table)) 1 3)
  ))

;plotting unsuccessful games
(define vector-unsuccess-asked
  (map list->vector (elements->lst (util:Success? game:$asked-for game:$received (game:table)) 1 2)
  ))

(define vector-unsuccess-received
  (map list->vector (elements->lst (util:Success? game:$asked-for game:$received (game:table)) 1 3)
  ))

(parameterize ([plot-x-tick-label-anchor 'top-right]
               [plot-x-tick-label-angle 50])

(plot
 (list (data->histogram vector-asked 3 0 "$ Asked For" 0 0)
       (data->histogram vector-received 3 1 "$ Received" 2 2))
        #:x-label "Games" #:y-label "Money (in tens of thousands of dollars)"
        #:title "Board Games Funded Via Kickstarter"))

(parameterize ([plot-x-tick-label-anchor 'top-right]
               [plot-x-tick-label-angle 50])

(plot
 (list (data->histogram vector-success-asked 3 0 "$ Asked For" 0 0)
       (data->histogram vector-success-received 3 1 "$ Received" 2 2))
        #:x-label "Games" #:y-label "Money (in tens of thousands of dollars)"
        #:title "Board Games Funded Via Kickstarter and Succeeded"))


(parameterize ([plot-x-tick-label-anchor 'top-right]
               [plot-x-tick-label-angle 50])

(plot
 (list (data->histogram vector-unsuccess-asked 3 0 "$ Asked For" 0 0)
       (data->histogram vector-unsuccess-received 3 1 "$ Received" 2 2))
        #:x-label "Games" #:y-label "Money (in tens of thousands of dollars)"
        #:title "Board Games Funded Via Kickstarter and did not Succeeded"))