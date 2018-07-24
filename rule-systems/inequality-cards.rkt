#lang racket

(provide
 render
 generate)

(require "./card-designs.rkt"
         "./rules.rkt"
         "./redex/rule-grabber.rkt"
         "./redex/inequalities.rkt"
         
         2htdp/image
         redex)

(module+ test
  (require (prefix-in bool: "../themes/emoji-boolean-algebra.rkt"))
  (require (prefix-in bool: "./boolean-algebra-cards.rkt"))

  (require (prefix-in numb: "../themes/emoji-clock-arithmetic.rkt"))
  (require (prefix-in numb: "./clock-number-cards.rkt"))
  
  (require (prefix-in ineq: "../themes/emoji-inequality.rkt"))

  (bool:render bool:theme)
  (numb:render numb:theme)
  (render ineq:theme))


(define (generate difficulty)
  (generate-term inequalities-lang e difficulty))


(define (render theme)

  (define-tile < '< (first theme))
  (define-tile max 'max (second theme)) 
  (define-tile ret 'ret (third theme))
  (define-tile = '= (fourth theme)) 
  (define-tile min 'min (fifth theme)) 
  (define-tile > '> (sixth theme))
  (define-tile >= '>= (seventh theme))
  (define-tile <= '<= (eighth theme))
  
  ;Gross
  (define-tile if 'if (text "if" 24 'black))
 
  (flatten (list
            (get-all-symbols)

            (redex-to-rule-card (take (rules-for '<) 5))
            (redex-to-rule-card (take (drop (rules-for '<) 5) 5))
            (redex-to-rule-card (take (drop (rules-for '<) 10) 5))
            (redex-to-rule-card (take (drop (rules-for '<) 15) 5))

            (redex-to-rule-card (rules-for '>))
            (redex-to-rule-card (rules-for 'max))
            (redex-to-rule-card (rules-for '=)) 
            (redex-to-rule-card (rules-for 'min))
            (redex-to-rule-card (rules-for '<=))
            (redex-to-rule-card (rules-for '>=)))))
  
