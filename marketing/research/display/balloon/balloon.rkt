#lang racket
(require 2htdp/image lang/posn)
(require "../../data/games/database.rkt")


(module+ test
  (scale 0.5
         (balloon-race (table))))

(define (zip l1 l2)
  (map list l1 l2))

;Takes a table, produces a balloon race image
(define (balloon-race table)
  (define balloons (map row->balloon table))
  (define balloons-and-rows (zip table balloons))

  (apply (curry beside/align "top")
         (map (curry apply row->placed-image table)
              balloons-and-rows)))

(define (successful? row)
  (>= ($received row)
      ($asked-for row)))

(define (row->balloon row)
  (above
   
   
   (circle ($received row)
           "solid" 
           (if (successful? row) "blue" "red"))

   (text (title row) 18 "black")))

(define (row->placed-image table row i)
  (define max-balloon-width
    (* 2
       (apply max (map $received table))))
  
  (define max-height
    (* 10 (apply max (map $asked-for table))))

  (place-image i
               (/ (image-width i) 2)
               (- max-height
                  (* 10 ($asked-for row)))
               (rectangle
                (image-width i)
                (+ 300 max-height)
                'outline
                'transparent)))


