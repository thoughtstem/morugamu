#lang racket

(require
  "../card-designs.rkt"
  "../rules.rkt"
  (prefix-in bool: "../boolean-algebra-cards.rkt")
  (prefix-in bool: "../themes/emoji-boolean-algebra.rkt")
  (prefix-in numb: "../clock-number-cards.rkt")  
  (prefix-in numb: "../themes/emoji-clock-arithmetic.rkt")
  (prefix-in ineq: "../inequality-cards.rkt")
  (prefix-in listalg:"../list-algebra-cards.rkt")
  (prefix-in listalg: "../themes/emoji-list-algebra.rkt")
  (prefix-in functionlist:"../functions-list-algebra-cards.rkt")
  (prefix-in functionlist: "../themes/emoji-functions-list-algebra.rkt"))

(define clock-numbers
  (numb:render numb:theme))

(define boolean-algebra
  (bool:render bool:theme))

(define ineq-cards
  (numb:render numb:theme))

(define list-algebra-cards
  (listalg:render listalg:theme))

(define function-list-cards
  (functionlist:render functionlist:theme))


clock-numbers
boolean-algebra
ineq-cards
list-algebra-cards
function-list-cards


