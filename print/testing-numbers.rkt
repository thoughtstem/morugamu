#lang racket



(require 2htdp/image)

;Called by the number-all function...takes in a pair (image, number) and then puts the number on the image

(define rwidth 500)
(define rheight 350)


(overlay/offset (text "12" 30 "black")
                (+ (-(/ (image-width (rectangle rwidth rheight "solid" "red")) 2)) 25) ;x-offset
                (- (/ (image-height (rectangle rwidth rheight "solid" "red")) 2) 20) ;y-offset
                (rectangle rwidth rheight "solid" "red")
)



;(place-num (list (rectangle 400 500 "solid" "red") 12))

;(define (number-all pairs)
  ;(map place-num (pair-with-index pairs)))