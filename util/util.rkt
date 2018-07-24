#lang racket

(provide pair-with-index)
(provide split-by)
(provide safe-1)
(provide element0&1->lst)
(provide element0&2->lst)

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

(define (element0&1->lst lst)
  (map get-elements0&1 lst))

(define (get-elements0&1 lst)
  (define elem1 (list-ref lst 0))
  (define elem2 (list-ref lst 1))
  (list elem1 elem2))

(define (element0&2->lst lst)
  (map get-elements0&2 lst))

(define (get-elements0&2 lst)
  (define elem1 (list-ref lst 0))
  (define elem2 (list-ref lst 2))
  (list elem1 elem2))
  