#lang racket

(require
  "../card-designs.rkt"
  "../rules.rkt"
  "../util.rkt"
  "../printing-util.rkt"
  (prefix-in numb: "../clock-number-cards.rkt")  
  (prefix-in numb: "../themes/emoji-clock-arithmetic.rkt"))

(define clock-numbers-algebra
  (numb:render numb:theme))

clock-numbers-algebra

;More puzzles here...
#|
(puzzle-card (rule '(add 0 1)
                   '?))
(puzzle-card (rule '(add 1 2)
                   '?))
(puzzle-card (rule '(add 2 3)
                   '?))
(puzzle-card (rule ' (sub 0 4)
                   '?))
(puzzle-card (rule ' (sub 4 4)
                   '?))
|#






;my new puzzle
#;(puzzle-card (rule (tail (cons T T))
              '?));1


;7/3/18 more puzzles
(puzzle-card (rule ' (sub 2 3)
                   '?))

(puzzle-card (rule ' (sub
                      (add 2 3)
                      (add 9 8))
                   '?))
(puzzle-card (rule ' (add
                      (sub 0 9)
                      (add 9 5))
                   '?))
(puzzle-card (rule ' (add
                      (sub 0 9)
                      (add
                          (sub 0 3)
                          (add 0 4)))
                   '?))
(puzzle-card (rule ' (sub
                      (sub 0 6)
                      (sub
                          (sub 8 3)
                          (sub 1 4)))
                   '?))


(puzzle-card (rule '(add 0 1)
                   '?))
(puzzle-card (rule '(add 1 2)
                   '?))
(puzzle-card (rule '(add 2 3)
                   '?))
(puzzle-card (rule ' (sub 0 4)
                   '?))
(puzzle-card (rule ' (sub 4 4)
                   '?))



;Hi, this is Sean's puzzle
(puzzle-card (rule ' (S (P 4))
                   '?))

(puzzle-card (rule ' (S (P 9))
                   '?))

(puzzle-card (rule ' (add (2 6))
                   '?))

(puzzle-card (rule '(sub (4 5))
                   '?))

(puzzle-card (rule ' (add
                      (sub 1 1)
                      (sub
                          (sub 0 1)
                          (sub 1 0)))
                   '?))



;my new puzzle
#;(puzzle-card (rule (tail (cons T T))
              '?))

;Julia's new puzzles
(puzzle-card (rule '(add 0 0)
                   '?))
(puzzle-card (rule '(add 3 7)
                   '?))
(puzzle-card (rule '(add 9 3)
                   '?))
(puzzle-card (rule '(sub 4 8)
                   '?))
(puzzle-card (rule '(sub 2 7)
                   '?))
(puzzle-card (rule '(sub 1 1)
                   '?))
(puzzle-card (rule '(add
                     (sub 4 6)
                     (add 1 2))
                   '?))
(puzzle-card (rule '(sub
                     (add 2 (add 3 6))
                     (sub (sub 1 1) (add 3 6)))
                   '?))
(puzzle-card (rule '(add
                     (sub
                      (add 2 5)
                      4)
                     (add 2 5))
                   '?))

;Kunal's Cards
(puzzle-card (rule '(add 9
                         (sub 9 5))
                   '?))

(puzzle-card (rule '(add 1
                         (sub 3 4))
                   '?))

(puzzle-card (rule '(add 1
                         (sub 3
                              (add 1 3)))
                   '?))

(puzzle-card (rule '(add (add 2 (sub 6 1)) 4)
                   '?))

(puzzle-card (rule '(add (sub 4
                              (S 9)) 6)
                   '?))

(puzzle-card (rule '(add 1
                         (sub 2
                              (S 9)))
                   '?))

(puzzle-card (rule '(sub (add (S 2) 4) (sub 6 3))
                   '?))

;Althea's Puzzles
(puzzle-card (rule '(add
                     (sub
                      (S 5) 
                      2) 
                     (P 4))
                   '?)) ;7
                   
(puzzle-card (rule '(add
                     (sub 8 6)
                     2)
                   '?)) ;4
                   
(puzzle-card (rule '(sub 7 5)
                   '?)) ;2
                   
(puzzle-card (rule '(sub
                     (P 0)
                     (add 2 2))
                   '?)) ;5
                   
(puzzle-card (rule '(sub
                     (add 5
                          (sub 6 2))
                     3)
                   '?)) ;6
;Dhakshin's Cards
(puzzle-card (rule '(sub(2 (add 4 2)))
                   '?))
(puzzle-card (rule '(add (sub(S (add 4 2)) (sub 4 1)))
                   '?))
(puzzle-card (rule '(sub (add 5 4) 8)
                   '?))
(puzzle-card (rule ' (add P 4) 
                   '?))
(puzzle-card (rule '(sub (add(S (add 7 4)) (sub 3 2)))
                   '?))
;; Alondra's new puzzles

(puzzle-card (rule ' (add (S 4) 2)
                   '?))
(puzzle-card (rule '(add (4 (P 2)))
                   '?))
(puzzle-card (rule '((sub (P (add 5 4))8))
                   '?))
(puzzle-card (rule ' (sub (S 2) (P 3)) 
                   '?))
(puzzle-card (rule '(sub (sub 2 1) (P 5))
                   '?))

;Marlon's new puzzles
(puzzle-card (rule '(add 1 1) '?)) ;Easy 

(puzzle-card (rule '(P (sub 2 4))
                   '?)) ;Easy 

(puzzle-card (rule '(S
                     (P (add(add 4 4))
                     (sub 2 3))) '?)) ;Medium 

(puzzle-card (rule '(S
                         (P (add(sub 1 7)
                         (add 1 0)))) '?)) ;Medium 
(puzzle-card (rule '(sub
                     (add 2 (sub 3 4))
                     (add (sub 8 9) (add 1 2)))
                   '?)) ;Hard 

(puzzle-card (rule '(S (P (add (sub 3
                        (P 7))
                        (S 1)))) '?)) ;Hard 
                        
; EXAMPLE
(define alondras-cards 
   (list 
    (puzzle-card (rule '(add (4 (P 2)))
                       '?))
                       (puzzle-card (rule '((sub (P (add 5 4))8))
                       '?))
                       (puzzle-card (rule '(sub (S 2) (P 3)) 
                       '?))
                       (puzzle-card (rule '(sub (sub 2 1) (P 5))
                       '?))))

(number-all alondras-cards)

; CODE FOR NEW CARDS
;(define cards
; (list
;  INSERT PUZZLE CARDS HERE
; )
;(number-all cards)
