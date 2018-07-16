#lang racket

(require
  "../rule-systems/card-designs.rkt"
  "../rule-systems/rules.rkt"
  (prefix-in bool: "../rule-systems/boolean-algebra-cards.rkt")
  (prefix-in bool: "../themes/emoji-boolean-algebra.rkt")
  (prefix-in numb: "../rule-systems/clock-number-cards.rkt")  
  (prefix-in numb: "../themes/emoji-clock-arithmetic.rkt")
  (prefix-in ineq: "../rule-systems/inequality-cards.rkt")
  (prefix-in listalg: "../rule-systems/list-algebra-cards.rkt")
  (prefix-in listalg: "../themes/emoji-list-algebra.rkt")
  (prefix-in flist: "../rule-systems/functions-list-algebra-cards.rkt")
  (prefix-in flist: "../themes/emoji-functions-list-algebra.rkt"))

(define clock-numbers
  (numb:render numb:theme))

(define boolean-algebra
  (bool:render bool:theme))

(define ineq-cards
  (ineq:render #f))

(define list-algebra-cards
  (listalg:render listalg:theme))

(define function-list-cards
  (flist:render flist:theme ))


;clock-numbers
;boolean-algebra
;ineq-cards
;list-algebra-cards
function-list-cards


