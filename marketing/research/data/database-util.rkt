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
  (first
   (memf (title-is title)
         (game:table))))

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

; Query Function #2: received >= $1,000,000
; @param data = database list
(define (greater-than-million data)
	(cond
          [(null? data) '()]
          [else (define elem1 (first data))
                (if (>= (game:$received elem1) 100)  ; units are in tens of thousands
                    (cons elem1 (greater-than-million (rest data)))
                    (greater-than-million (rest data)))]))



; Test lines
(module+ test
  (title->index "Vanguard of War")
  (greater-than-million (game:table)))

