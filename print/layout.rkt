#lang racket

(require
  2htdp/image
  "../card-designs.rkt"
  "../rules.rkt"
  (prefix-in bool: "../boolean-algebra-cards.rkt")
  (prefix-in bool: "../themes/emoji-boolean-algebra.rkt")
  (prefix-in numb: "../clock-number-cards.rkt")
  (prefix-in numb: "../themes/emoji-clock-arithmetic.rkt"))

(define boolean-algebra
  (bool:render bool:theme))

(define clock-numbers
  (numb:render numb:theme))

(define all-rule-cards
  (append (rest boolean-algebra)
          (rest clock-numbers)))

; list that will have formatted (easy to print) images
(define return_list '())

; only works with rule cards
; assumes width of paper fits at most 3 cards
; doesn't take into account number of rows vs length of paper
(define (print_rules list_of_cards)

  (cond
    ; try to take first 3 cards
    [(>= (length list_of_cards) 3)
     ; check if return_list already has an image
     (if (empty? return_list)
         ; if no, put the first 3 cards beside each other and add it to return_list
         (set! return_list (append return_list (list (apply beside (take list_of_cards 3)))))
         ; if yes, put the first 3 cards beside each other and below what is in return_list
         (set! return_list (list-set return_list 0 (above (first return_list)
                                                   (apply beside (take list_of_cards 3))))))
     ; recursive call, remove first 3 images from list_of_cards
     (print_rules (list-tail list_of_cards 3))]
    ; list_of_cards only has 2 cards
    [(= (length list_of_cards) 2)
     (if (empty? return_list)
         (set! return_list (append return_list (list (apply beside (take list_of_cards 2)))))
         (set! return_list (list-set return_list 0 (above/align "left" (first return_list)
                                                                       (apply beside (take list_of_cards 2))))))]
    ; list of cards only has 1 card
    [(= (length list_of_cards) 1)
     (if (empty? return_list)
         (set! return_list (append return_list (list (first list_of_cards))))
         (set! return_list (list-set return_list 0 (above/align "left" (first return_list)
                                                                       (first list_of_cards)))))]))

(print_rules all-rule-cards)
(display return_list)