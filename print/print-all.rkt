#lang racket

(require
  2htdp/image
  "../rule-systems/card-designs.rkt"
  "../rule-systems/rules.rkt"
<<<<<<< HEAD

  ;"./printing-util.rkt"
=======
  "./printing-util.rkt"
>>>>>>> 834794f01e8a7e1132f487e231a3ac2a12681442
  
  ;(prefix-in bool: "../rule-systems/boolean-algebra-cards.rkt")
  ;(prefix-in bool: "../themes/emoji-boolean-algebra.rkt")
  ;(prefix-in bool: "../puzzles/boolean-algebra-puzzles.rkt")
  
  ;(prefix-in numb: "../rule-systems/clock-number-cards.rkt")
  ;(prefix-in numb: "../themes/emoji-clock-arithmetic.rkt")
  ;(prefix-in numb: "../puzzles/clock-number-puzzles.rkt")

<<<<<<< HEAD
  ;(prefix-in ineq: "../rule-systems/inequality-cards.rkt")
  ;(prefix-in ineq: "../puzzles/ineq-puzzles.rkt")
  ;ineq has no theme yet.  TODO: refactor it to be like the others...

  ;(prefix-in list: "../rule-systems/list-algebra-cards.rkt")
  ;(prefix-in list: "../themes/emoji-list-algebra.rkt")

  (prefix-in bool: "../puzzles/all-puzzles.rkt")
  "../puzzles/puzzle-util.rkt")

;(define puzzles
  ;(cards->pages ;BROKEN???
  ;(list bool:puzzle-deck
   ;     numb:puzzle-deck
    ;    (rest (list:render list:theme))
     ;   ineq:puzzle-deck1
=======
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
>>>>>>> 834794f01e8a7e1132f487e231a3ac2a12681442
  ;)
 ;  (
;)))

<<<<<<< HEAD
;(define cards
  ;(cards->pages ;BROKEN???
 ;  (number-all (append (rest (bool:render bool:theme))
  ;                     (rest (numb:render numb:theme))
   ;                    (rest (list:render list:theme))
                       ;(rest (ineq:render #f)))) ineq has no themes so it throws an error for now -Taco
  ;)
;)))


;(define tiles
 ; (list (first (bool:render bool:theme))
  ;       (first (numb:render numb:theme))
   ;      (first (list:render list:theme))
    ;     ineq:render ))

;(append tiles cards puzzles)


(define print-all-puzzles
  (append
   bool:all-puzzles))

 (define print-all-puzzles-deck (map expression->puzzle-card print-all-puzzles))

print-all-puzzles-deck
   
=======
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
>>>>>>> 834794f01e8a7e1132f487e231a3ac2a12681442
