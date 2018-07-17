#lang racket

(require
  2htdp/image
  "../rule-systems/card-designs.rkt"
  "../rule-systems/rules.rkt"
  "./printing-util.rkt"
  
  (prefix-in bool: "../rule-systems/boolean-algebra-cards.rkt")
  (prefix-in bool: "../themes/emoji-boolean-algebra.rkt")
  (prefix-in bool: "../puzzles/boolean-algebra-puzzles.rkt")
  
  (prefix-in numb: "../rule-systems/clock-number-cards.rkt")
  (prefix-in numb: "../themes/emoji-clock-arithmetic.rkt")
  (prefix-in numb: "../puzzles/clock-number-puzzles.rkt")

  (prefix-in ineq: "../rule-systems/inequality-cards.rkt")
  (prefix-in ineq: "../themes/emoji-inequality.rkt")
  (prefix-in ineq: "../puzzles/ineq-puzzles.rkt")
  

  (prefix-in list: "../rule-systems/list-algebra-cards.rkt")
  (prefix-in list: "../themes/emoji-list-algebra.rkt")
  (prefix-in list: "../puzzles/list-algebra-puzzles.rkt")

  )


(define puzzles
 
  (list bool:puzzle-deck
        numb:puzzle-deck
        (rest (list:render list:theme))
        ineq:puzzle-deck1
  ;)
))

(define cards
  (cards->pages
   (list (number-all (append (rest (bool:render bool:theme))                 
                       (rest (numb:render numb:theme))
                       (rest (list:render list:theme))
                       )))))

                      

(define tiles
  (list (first (bool:render bool:theme))
         (first (numb:render numb:theme))
         (first (list:render list:theme))
         )) 

(append tiles cards puzzles)
