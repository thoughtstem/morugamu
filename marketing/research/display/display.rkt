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


;start of receive/ask for ratio 
        ;asked for value for successful games
;        (map second (elements->lst (util:Success? game:$received game:$asked-for (game:table)) 1 2))
        
        ;received for value for successful games
 ;       (map second (elements->lst (util:Success? game:$received game:$asked-for (game:table)) 1 3))
        
        ;asked for value for unsuccessful games
  ;      (map second (elements->lst (util:Success? game:$asked-for game:$received (game:table)) 1 2))
        
        ;recieved value for unsuccessful games
   ;     (map second (elements->lst (util:Success? game:$asked-for game:$received (game:table)) 1 3))

(require srfi/1)

(define (merge l1 l2)
      (if (null? l1) l2
          (if (null? l2) l1
              (cons (car l1) (cons (car l2) (merge (cdr l1) (cdr l2)))))))

(define (string-upper-case? str)
  (cond
    [(string? str) (andmap string? (string->list str))]  
  ))

(define (splitter pred? lst)
  (if (empty? lst)
      empty
      (let-values ([(data tail) (break pred? (rest lst))])        
        (cons (cons (first lst) data)
              (splitter pred? tail)))))

(define vector-ratio
  (map list->vector (append
        ;receive/ask ratio for successful (r >1)
(splitter string?
(merge
 (map string-upcase (map first (elements->lst (util:Success? game:$received game:$asked-for (game:table)) 1 3)))
     (map /
     (map second (elements->lst (util:Success? game:$received game:$asked-for (game:table)) 1 3))
     (map second (elements->lst (util:Success? game:$received game:$asked-for (game:table)) 1 2)))  
     ))
     
     ;ratio for unsuccessful (r<1)
(splitter string?
(merge
 (map string-upcase (map first (elements->lst (util:Success? game:$asked-for game:$received (game:table)) 1 3)))
     (map /
     (map second (elements->lst (util:Success? game:$asked-for game:$received (game:table)) 1 3))
     (map second (elements->lst (util:Success? game:$asked-for game:$received (game:table)) 1 2))
     )))
)))

(parameterize ([plot-x-tick-label-anchor 'top-right]
               [plot-x-tick-label-angle 50])

(plot
 (list (data->histogram vector-ratio 3 0 "[Recieved/Asked For] Ratio" 2 2))
  #:x-label "Games"
  #:y-label "[Recieved/Asked For] Ratio"
  #:title "Board Games Funded Via Kickstarter"))

     
#|
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
        #:title "Board Games Funded Via Kickstarter and did not Succeed"))  |#