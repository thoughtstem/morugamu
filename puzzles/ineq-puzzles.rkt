#lang racket

(require
  "../rule-systems/card-designs.rkt"
  "../rule-systems/rules.rkt"
  "./puzzle-util.rkt"
  (prefix-in bool: "../rule-systems/boolean-algebra-cards.rkt")
  (prefix-in bool: "../themes/emoji-boolean-algebra.rkt")
  (prefix-in numb: "../rule-systems/clock-number-cards.rkt")  
  (prefix-in numb: "../themes/emoji-clock-arithmetic.rkt")
  (prefix-in ineq: "../rule-systems/inequality-cards.rkt"))

(define clock-numbers
  (numb:render numb:theme))

(define boolean-algebra
  (bool:render bool:theme))

(define ineq-cards
  (ineq:render #f))

(provide puzzle-expressions
         puzzle-deck)

(define puzzle-expressions
  (list

   '((< (S (S 0)) (S 0)) F)

   '((not(< 0 0)) T)

   '((< (add 4 1) x) F)

   '((not (< (max 3 2) (sub 1 9))) F)

   '((< (max (add 3 4) (sub 1 9)) (S 8)) T)

   '((= (5 5)) T)

   '((= (add 3 4) (sub 1 8)) T)

   '((= (min 9 1) (max 3 1)) T)

   '((not (< (min 5 6) (min 7 9))) F)

   '((< (max 8 6) (S 9)) F)

   '((not (< (max 3 1) (sub 8 7))) T)

   '((< 9 (max (sub 6 4) 1)) F)

   '((> 3 (min (add 6 4) 9)) F)

   '((not (< (S 9) (S 9))) T)

   '((= (S 7) (S 8)) T)

   '((= (min 6 5) (S 8)) F)

   '((> (S 7) (S 6)) T)

   '((= (S 7) (S 8)) F)

   '((not (< (S 3) (S 4))) F)

   '((= (S 8) (S 6)) F)

   '((= (min 0 1) (S 9)) T)

   '((> (S 9) (S 8)) F)

   '((= (S 0) (S 0)) T)

   '((not (< (min 2 3) 5)) F)

   '((not (= (S 7) (S 5))) T)

   '((= (min 3 6) (S 8)) F)

   '((< = (S 9) (S 9)) T)

   '((> = (S 0) (S 0)) T)

   '((= (3 3)) T)

   '((= (8 7)) F)

   '((= (add 8 1) (sub 9 1)) T)

   '((< (add 5 1) (sub 8 1)) T)

   '((< (max (add 2 2) (sub 2 3)) (3)) F)

   '((< (add 5 1) (sub 3 5)) F)

   '((= (7 7)) T)

   '((< (max (add 4 4) (sub 2 3)) (6)) F)

   '((= (7 9)) F)

   '((= (add 3 2) (add 2 3)) T)

   '((= 8 (add 4 (P 5))) T)

   '((< 8 (max 8 (P 0))) T)

   '((= (< 6 7) (= 4 (P 4))) F)

   '((not (= 2 2)) F)

   '((= 4 (sub 1 7)) T)

   '((< (min 4 (max 5 3)) (S 4)) T)

   '(((not <) 2 1) T)

   '((not (and T (or T (not T)))) F)

   '((and (not F) (< 8 (P 0))) T)

   '((> (add 4 0) (P 6)) F)

   ))

(define puzzle-deck (map expression->puzzle-card puzzle-expressions))


