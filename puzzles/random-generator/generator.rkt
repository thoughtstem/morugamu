#lang racket

(require "../../rule-systems/redex/boolean-algebra.rkt"
         "../../rule-systems/redex/clock-numbers.rkt"
         "../../rule-systems/redex/inequalities.rkt")

(require redex)


;This should get made into a function, provided, and documented...
(generate-term
   inequalities-lang
   in-e
   10)