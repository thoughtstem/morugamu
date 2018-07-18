#lang racket

(require 2htdp/image)

(provide theme)

(define theme
  (list
   (bitmap "./emojis/cons.png")
   (bitmap "./emojis/nil.png")
   (bitmap "./emojis/head.png")
   (bitmap "./emojis/tail.png")))