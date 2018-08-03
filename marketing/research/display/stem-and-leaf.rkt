#lang racket

(require (prefix-in game: "../../data/games/database.rkt"))
(require (prefix-in company: "../../data/companies/database.rkt"))
(require (prefix-in companies<->games: "../../data/join-games-companies/database.rkt"))
(require 2htdp/image)
(require "../../../../util/util.rkt")

;Below is the design for a stem and leaf plot.




;This function returns an integer in a number.
(define (digit d n)
  (string->number
   (substring
    (number->string n)
    d (+ d 1))))

(define (integers value)
  (beside
(text value 24 'black)
 (square 24 'solid 'transparent)))

;$asked-for was manually entered. Functions to make the proccess more efficient are in progress at the bottom.
(beside
 ;colum 1
 (beside
 (above
  (text "Money Asked For" 24 'black)
   ;thousands
   (beside
    (integers "8")
    (integers "8.5")
    (integers "8")
    (integers "7.5")
    (integers "8")
    (integers "7.6")
    (integers "78")
    (integers "4")
    (integers "13")
    (integers "1")
    (integers "5")
    (integers "6")
    (integers "1")
    (integers "7")
    (integers "9")
    (integers "6")
    (integers "1.9")
    (integers "8")
    (integers "8"))
  ;ten thousands
 (beside
 (integers "0")
 (integers "7")
 (integers "2.8")
 (integers "4")
 (integers "3")
 (integers "2")
 (integers "7.5")
 (integers "7.5")
 (integers "1.5")
 (integers "1.7")
 (integers "2.6")
 (integers "3")
 (integers "1.2")
 (integers "1")
 (integers "1.9")
 (integers "5")
 (integers "1.5")
 (integers "1.5")
 (integers "1")
 (integers "5.9")
 (integers "4")
 (integers "2.3")
 (integers "7.5")
 (integers "5")
 (integers "5")
 (integers "1")
 (integers "2.3")
 (integers "2.5")
 (integers "3")
 (integers "1.9")
 (integers "5.3")
 (integers "5")
 (integers "1")
 (integers "4.2")
 (integers "2.6")
 (integers "1.8")
 (integers "1")
 (integers "3")
 (integers "2.5")
 (integers "1.9")
 (integers "3")
  (integers "2")
  (integers "3")
  (integers "1")
  (integers "2")
  (integers "1.1")
  (integers "2")
  (integers "3")
  (integers "2.9"))
 ;hundred thousands
 (beside
  (integers "1.658")
  (integers "1.31")
  (integers "5")
(integers "1.25")
(integers "1.5"))
 ;millions
  (square 24 'solid 'transparent)
  ;ten millions
   (square 24 'solid 'transparent)
   ;hundred millions
   (square 24 'solid 'transparent))
 (square 24 'solid 'transparent))
 ;column 2
 (beside
 (above
  (text "Value (in thousands)" 24 'black)
  (text "1" 24 'black)
  (text "10" 24 'black)
  (text "100" 24 'black)
  (text "1,000" 24 'black)
  (text "10,000" 24 'black)
  (text "100,000" 24 'black))
  (square 24 'solid 'transparent))
 ;column 3
 (above
  (text "Money Received" 24 'black)
  ;thousands
  (beside
   (integers "1")
   (integers "2"))
  ;ten thousands
   (beside
  (integers "3")
  (integers "4"))
   ;hundred thousands
  (beside
  (integers "5")
  (integers "6"))
  ;millions
   (beside
  (integers "7")
  (integers "8"))
   ;ten millions
   (beside
    (integers "7")
    (integers "8"))
   ;hundred millions
   (integers "9")
   ))

;(define (tens)

;Function to find the numbers with the tens thousands values
;Type: row? -> boolean?
(define (asked-for-tens? row)
  (and (< ((list-ref (row) (- (length (row) 1)) 10))) (>= ((list-ref (row) (- (length (row)) 1)) 1))))

(filter (asked-for-tens? game:$asked-for) (game:table))
   
 
