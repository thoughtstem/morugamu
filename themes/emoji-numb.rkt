#lang racket

(provide theme)

(require 2htdp/image)

(define dot (bitmap "./emojis/dot.png"))

(define 1-pic  dot)

(define 2-pic
  (beside dot dot))

(define 3-pic
  (above dot (beside dot dot)))

(define 4-pic
  (above (beside dot dot) (beside dot dot)))

(define 5-pic
  (above (beside dot dot)
         dot
         (beside dot dot)))

(define 6-pic
  (beside (above dot dot dot)
          (above dot dot dot)))

(define 7-pic
  (beside (above dot dot dot)
          dot
          (above dot dot dot)))

(define 8-pic
  (beside (above dot dot dot)
          (above dot dot)
          (above dot dot dot)))

(define 9-pic
  (beside (above dot dot dot)
          (above dot dot dot)
          (above dot dot dot)))

(define theme
  (list
   (bitmap "./emojis/Next.png")
   (bitmap "./emojis/Previous.png")
   (bitmap "./emojis/0.png")
   1-pic
   2-pic
   3-pic
   4-pic
   5-pic
   6-pic
   7-pic
   8-pic
   9-pic
   (bitmap "./emojis/add.png")
   (bitmap "./emojis/sub.png")))


