#lang racket

(require
  2htdp/image
  "../rule-systems/card-designs.rkt"
  "../rule-systems/rules.rkt"

  "./printing-util.rkt"
  
  (prefix-in bool: "../rule-systems/boolean-algebra-cards.rkt")
  (prefix-in bool: "../themes/emoji-boolean-algebra.rkt")
  
  (prefix-in numb: "../rule-systems/clock-number-cards.rkt")
  (prefix-in numb: "../themes/emoji-clock-arithmetic.rkt")

  (prefix-in ineq: "../rule-systems/inequality-cards.rkt")
  ;ineq has no theme yet.  TODO: refactor it to be like the others...

  (prefix-in list: "../rule-systems/list-algebra-cards.rkt")
  (prefix-in list: "../themes/emoji-list-algebra.rkt"))



(define cards
  (cards->pages
   (number-all (append (rest (bool:render bool:theme))
                       (rest (numb:render numb:theme))
                       (rest (list:render list:theme))
                       (rest (ineq:render #f))))))


(define tiles
  (list (first (bool:render bool:theme))
         (first (numb:render numb:theme))
         (first (list:render list:theme))
         (first (ineq:render #f))))

(append tiles cards)




