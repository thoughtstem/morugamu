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
  (prefix-in listalg: "../themes/emoji-list-algebra.rkt"))

(define clock-numbers
  (numb:render numb:theme))

(define boolean-algebra
  (bool:render bool:theme))

(define ineq-cards
  (numb:render numb:theme))

(define list-algebra-cards
  (listalg:render listalg:theme))


clock-numbers
boolean-algebra
ineq-cards
list-algebra-cards