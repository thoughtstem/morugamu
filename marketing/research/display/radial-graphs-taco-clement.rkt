#lang racket
(require
  plot
  
    "../../../util/util.rkt"
  (prefix-in game: "../data/games/database.rkt")
  (prefix-in util:"../data/stephens-database-util.rkt")
  srfi/1
  )
(plot-new-window? #t)


;Name: stacked-bar-graph
;Description: Takes a list of game vectors and plots them all on a graph

;Type: (listof vector?) -> graph

;Example:

; (stacked-bar-graph (list (vector 'skyrim (list 10 5)))


(define (stacked-bar-graph game-list)
  (plot (stacked-histogram
         game-list
         #:invert? #t
         #:labels '("Red" #f "Blue"))
        #:legend-anchor 'top-right))
  
;Name: vector-asked

;Description: takes the table of games returns a listof the asked amount
;Type: table -> (listof vector?)
;example: its below. it's the same code in display.rkt 
(define vector-asked
  (map list->vector (elements->lst (game:table) 1 2)))
;Name: vector-received

;Description: takes the table of games returns a listof the received amount
;Type: table -> (listof vector?)
;example: its below. it's the same code in display.rkt 
(define vector-received
  (map list->vector (elements->lst (game:table) 1 3)))
;Name: vector-name

;Description: takes the table of games returns a listof the names of the games
;Type: table -> (listof vector?)
;example: (vector-name)
(define vector-name
  (map list->vector (elements->lst (game:table) 1 1)))
;Name:stacked-bar-graph
;Description:takes the listof vectors and creates the graph that contains the names, the received amount, and the amount
;asked
;Type: n/a
;Example: stacked-bar-graph
(stacked-bar-graph 
 (list
  (vector vector-name
          (list
            (vector-asked vector-received)
          )
  )))

;TO-DO:find a way to use the individual elements of the vector lists because at the moment it passes in the whole
;list as opposed to just the individual element