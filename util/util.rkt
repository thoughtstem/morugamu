#lang racket

(provide pair-with-index)
(provide split-by)
(provide safe-1)
(provide elements->lst)

(define (safe-1 f)
  (lambda (x . xs)
    (if (empty? xs)
        x
        (apply f (cons x xs)))))

; Takes in list of card images
; Returns list of pairs: (card, index #)

(define (pair-with-index images)
  (map list images (range (length images)))(define (helper pointer num)
    (if (null? pointer)
        '()
        (cons (cons (car pointer) num) (helper (cdr pointer) (add1 num)))
    )
  )
  (helper images 1)
)

;Parameters: List lst, Number n
;Output: List of lists
;Splits lst into n number of equal parts
;Note that this function only works if the length of lst is a multiple of n
(define (split-by lst n)
  (if (<= (length lst) n)
      (list lst)
      (cons (take lst n) (split-by (drop lst n) n))))

(define (elements->lst lst num1 num2)
  (map (curryr get-elements num1 num2) lst))

(define (get-elements lst num1 num2)
  (define elem1 (list-ref lst num1))
  (define elem2 (list-ref lst num2))
  (list elem1 elem2))

