#lang racket

(require
  "../rule-systems/card-designs.rkt"
  "../rule-systems/rules.rkt"
  "../util/util.rkt"
  "./puzzle-util.rkt"
  "../print/printing-util.rkt"
  (prefix-in numb: "../rule-systems/clock-number-cards.rkt")  
  (prefix-in numb: "../themes/emoji-clock-arithmetic.rkt"))

(define clock-numbers-algebra
  (numb:render numb:theme))


(provide puzzle-expressions2
         puzzle-deck2)


     
;clock-numbers-algebra

;More puzzles here...
#|
 '(add 0 1)
                   
 '(add 1 2)
                   
 '(add 2 3)
                   
 ' (sub 0 4)
                   
 ' (sub 4 4)
                   
|#




#|

;my new puzzle
#; (tail (cons T T))
              ;1


;7/3/18 more puzzles
 ' (sub 2 3)
                   

 ' (sub
                      (add 2 3)
                      (add 9 8))
                   
 ' (add
                      (sub 0 9)
                      (add 9 5))
                   
 ' (add
                      (sub 0 9)
                      (add
                          (sub 0 3)
                          (add 0 4)))
                   
 ' (sub
                      (sub 0 6)
                      (sub
                          (sub 8 3)
                          (sub 1 4)))
                   


 '(add 0 1)
                   
 '(add 1 2)
                   
 '(add 2 3)
                   
 ' (sub 0 4)
                   
 ' (sub 4 4)
                   



;Hi, this is Sean's puzzle
 ' (S (P 4))
                   

 ' (S (P 9))
                   

 ' (add (2 6))
                   

 '(sub (4 5))
                   

 ' (add
                      (sub 1 1)
                      (sub
                          (sub 0 1)
                          (sub 1 0)))
                   



;my new puzzle
#; (tail (cons T T))
              

;Julia's new puzzles
 '(add 0 0)
                   
 '(add 3 7)
                   
 '(add 9 3)
                   
 '(sub 4 8)
                   
 '(sub 2 7)
                   
 '(sub 1 1)
                   
 '(add
                     (sub 4 6)
                     (add 1 2))
                   
 '(sub
                     (add 2 (add 3 6))
                     (sub (sub 1 1) (add 3 6)))
                   
 '(add
                     (sub
                      (add 2 5)
                      4)
                     (add 2 5))
                   

;Kunal's Cards
 '(add 9
                         (sub 9 5))
                   

 '(add 1
                         (sub 3 4))
                   

 '(add 1
                         (sub 3
                              (add 1 3)))
                   

 '(add (add 2 (sub 6 1)) 4)
                   

 '(add (sub 4
                              (S 9)) 6)
                   

 '(add 1
                         (sub 2
                              (S 9)))
                   

 '(sub (add (S 2) 4) (sub 6 3))
                   

;Althea's Puzzles
 '(add
                     (sub
                      (S 5) 
                      2) 
                     (P 4))
                    ;7
                   
 '(add
                     (sub 8 6)
                     2)
                    ;4
                   
 '(sub 7 5)
                    ;2
                   
 '(sub
                     (P 0)
                     (add 2 2))
                    ;5
                   
 '(sub
                     (add 5
                          (sub 6 2))
                     3)
                    ;6
;Dhakshin's Cards
 '(sub(2 (add 4 2)))
                   
 '(add (sub(S (add 4 2)) (sub 4 1)))
                   
 '(sub (add 5 4) 8)
                   
 ' (add P 4) 
                   
 '(sub (add(S (add 7 4)) (sub 3 2)))
                   
;; Alondra's new puzzles

 ' (add (S 4) 2)
                   
 '(add (4 (P 2)))
                   
 '((sub (P (add 5 4))8))
                   
 ' (sub (S 2) (P 3)) 
                   
 '(sub (sub 2 1) (P 5))
                   

;Marlon's new puzzles
 '(add 1 1)  ;Easy 

 '(P (sub 2 4))
                    ;Easy 

 '(S
                     (P (add(add 4 4))
                     (sub 2 3)))  ;Medium 

 '(S
                         (P (add(sub 1 7)
                         (add 1 0))))  ;Medium 
 '(sub
                     (add 2 (sub 3 4))
                     (add (sub 8 9) (add 1 2)))
                    ;Hard 

 '(S (P (add (sub 3
                        (P 7))
                        (S 1))))  ;Hard |#
                        
; EXAMPLE


(define puzzle-expressions2
  (list

   


;7/3/18 more puzzles
 ' (sub 2 3)
                   

 ' (sub
                      (add 2 3)
                      (add 9 8))
                   
 ' (add
                      (sub 0 9)
                      (add 9 5))
                   
 ' (add
                      (sub 0 9)
                      (add
                          (sub 0 3)
                          (add 0 4)))
                   
 ' (sub
                      (sub 0 6)
                      (sub
                          (sub 8 3)
                          (sub 1 4)))
                   


 '(add 0 1)
                   
 '(add 1 2)
                   
 '(add 2 3)
                   
 ' (sub 0 4)
                   
 ' (sub 4 4)
                   



;Hi, this is Sean's puzzle
 ' (S (P 4))
                   

 ' (S (P 9))
                   

 ' (add (2 6))
                   

 '(sub (4 5))
                   

 ' (add
                      (sub 1 1)
                      (sub
                          (sub 0 1)
                          (sub 1 0)))
                   



;my new puzzle
#; (tail (cons T T))
              

;Julia's new puzzles
 '(add 0 0)
                   
 '(add 3 7)
                   
 '(add 9 3)
                   
 '(sub 4 8)
                   
 '(sub 2 7)
                   
 '(sub 1 1)
                   
 '(add
                     (sub 4 6)
                     (add 1 2))
                   
 '(sub
                     (add 2 (add 3 6))
                     (sub (sub 1 1) (add 3 6)))
                   
 '(add
                     (sub
                      (add 2 5)
                      4)
                     (add 2 5))
                   

;Kunal's Cards
 '(add 9
                         (sub 9 5))
                   

 '(add 1
                         (sub 3 4))
                   

 '(add 1
                         (sub 3
                              (add 1 3)))
                   

 '(add (add 2 (sub 6 1)) 4)
                   

 '(add (sub 4
                              (S 9)) 6)
                   

 '(add 1
                         (sub 2
                              (S 9)))
                   

 '(sub (add (S 2) 4) (sub 6 3))
                   

;Althea's Puzzles
 '(add
                     (sub
                      (S 5) 
                      2) 
                     (P 4))
                    ;7
                   
 '(add
                     (sub 8 6)
                     2)
                    ;4
                   
 '(sub 7 5)
                    ;2
                   
 '(sub
                     (P 0)
                     (add 2 2))
                    ;5
                   
 '(sub
                     (add 5
                          (sub 6 2))
                     3)
                    ;6
;Dhakshin's Cards
 '(sub(2 (add 4 2)))
                   
 '(add (sub(S (add 4 2)) (sub 4 1)))
                   
 '(sub (add 5 4) 8)
                   
 ' (add P 4) 
                   
 '(sub (add(S (add 7 4)) (sub 3 2)))
                   
;; Alondra's new puzzles

 ' (add (S 4) 2)
                   
 '(add (4 (P 2)))
                   
 '((sub (P (add 5 4))8))
                   
 ' (sub (S 2) (P 3)) 
                   
 '(sub (sub 2 1) (P 5))
                   

;Marlon's new puzzles
 '(add 1 1)  ;Easy 

 '(P (sub 2 4))
                    ;Easy 

 '(S
                     (P (add(add 4 4))
                     (sub 2 3)))  ;Medium 

 '(S
                         (P (add(sub 1 7)
                         (add 1 0))))  ;Medium 
 '(sub
                     (add 2 (sub 3 4))
                     (add (sub 8 9) (add 1 2)))
                   ;Hard 

 '(S (P (add (sub 3
                        (P 7))
                        (S 1))))
))



 (define puzzle-deck2 (map expression->puzzle-card puzzle-expressions2))



(module+ test
  puzzle-deck2)

;Hard


;(number-all puzzle-deck)

; CODE FOR NEW CARDS
;(define cards
; (list
;  INSERT PUZZLE CARDS HERE
; )
;(number-all cards)
