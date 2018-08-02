#lang racket

(require 2htdp/image)
(require (prefix-in game: "./games/database.rkt"))
(require (prefix-in company: "./companies/database.rkt"))
(require (prefix-in companies<->games: "./join-games-companies/database.rkt"))
(require plot)

(plot
    (points (for/list ([i (in-range 1000)])
              (list 0 0))
            #:alpha 0.4
            #:x-jitter 1
            #:y-jitter 1
            #:sym 'fullcircle1
            #:color "blue")
    #:x-min -2 #:x-max 2 #:y-min -2 #:y-max 2)