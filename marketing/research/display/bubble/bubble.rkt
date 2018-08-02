#lang racket

(require (prefix-in game: "../../data/games/database.rkt"))
(require (prefix-in company: "../../data/companies/database.rkt"))
(require (prefix-in companies<->games: "../../data/join-games-companies/database.rkt"))
(require plot)
(require "../../../../util/util.rkt")

(plot-new-window? #t)

(define vector-games
  (map list->vector (elements->lst (game:table) 2 3)))

(plot (points vector-games))





