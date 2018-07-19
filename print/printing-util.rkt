#lang racket

(provide number-all)
(provide save-sheets)
(provide cards->pages)

(require 
         2htdp/image
         "../rule-systems/cards.rkt"
         "../rule-systems/card-designs.rkt"
         "../util/config.rkt"
         "../util/util.rkt")

;Called by the number-all function...takes in a pair (image, number) and then puts the number on the image
(define (place-num couple)
  (overlay/offset (text (number->string (cdr couple)) 30 "black")
                  (+ (-(/ (image-width (car couple)) 2)) 25) ;x-offset
                  (- (/ (image-height (car couple)) 2) 20) ;y-offset
                  (car couple)))

;Takes in a list of (images?), numbers each, and then places the number on the image
(define (number-all pairs)
  (map place-num (pair-with-index pairs)))

;Parameters: List lst, Number num
;Output: void
;Uses a list of sheet images and saves them recursively
(define (save-sheets lst num)
  (if(< num (length lst))
     (cons
       (my-save-image (list-ref lst num) num)
       (save-sheets lst (+ num 1)))
      '()))

;Parameters: Image img, Number num
;Output: void
;Saved the image as a .png in the same folder as this file
(define (my-save-image img num)
  (save-image img (string-append "sheet" (number->string num) ".png" ) (image-width img) (image-height img)))

;Turns a list of length-9-or-less images into a list of "pages", each with 9 images tiled onto it...  
(define (cards->pages list_of_cards  #:rows (rows 3) #:col (cols 3))
  (map (curryr 9images->page cols) (split-by list_of_cards (* rows cols))))

;Turns a list of 9 images into a page
(define (9images->page list_of_images (cols 3))
  (define grouped-by-n (split-by list_of_images cols))
  (define rows (map (curry apply (safe-1 beside)) grouped-by-n))
  (apply (safe-1 above) rows))

