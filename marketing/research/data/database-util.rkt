#lang racket

;(provide get-index)
(require (prefix-in game: "./games/database.rkt"))
(require (prefix-in company: "./companies/database.rkt"))
(require (prefix-in companies<->games: "./join-games-companies/database.rkt"))


; TODO: Make function to query (companies<->games:table)



; Function to get index of any game in the list. Returns -1 if not found.

; Converts a string title into an index by looking in the game:table
; and finding the row whose title matches the given title
(define (title->index title)
  (game:id (first
   (memf (title-is title)
         (game:table)))))

(define (title-is title)
  (λ(g)
    (displayln (game:title g))
    (string=?
     title
     (game:title g))))


; Query Function #1: received >= asked
; @param data = database list
(define (received-more data)
	(cond
          [(null? data) '()]
          [else (define elem1 (first data))
                (if (>= (game:$received elem1) (game:$asked-for elem1))
                    (cons elem1 (received-more (rest data)))
                    (received-more (rest data))
                )]))

; Query Function #2: received >= input $ amount
; @param amount = integer
; @param data = database list
(define (received-greater-than amount data)
	(cond
          [(null? data) '()]
          [else (define elem1 (first data))
                (if (>= (game:$received elem1) (/ amount 10000))  ; units are in tens of thousands
                    (cons elem1 (received-greater-than amount (rest data)))
                    (received-greater-than amount (rest data)))]))

; Query Function #2: received < input $ amount
; @param amount = integer
; @param data = database list
(define (received-less-than amount data)
	(cond
          [(null? data) '()]
          [else (define elem1 (first data))
                (if (< (game:$received elem1) (/ amount 10000))  ; units are in tens of thousands
                    (cons elem1 (received-less-than amount (rest data)))
                    (received-less-than amount (rest data)))]))

; Query Function #4: returns entire row from given ID
; @param id = String
; @param data = database list
(define (row-from-id id data) 
  (cond
    [(null? data) -1]
    [else (define elem1 (first data))
          (if (equal? (string->symbol id) (game:id elem1))
              elem1
              (row-from-id id (rest data)))]))


; Test lines
(module+ test
  (title->index "Vanguard of War")
  (received-greater-than 1000000 (game:table))
  (row-from-id "Dinosaur-Island" (game:table)))


