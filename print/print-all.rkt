#lang racket

(require
  2htdp/image
  "../rule-systems/common.rkt"
  "../rule-systems/card-designs.rkt"
  "../rule-systems/rules.rkt"
  "./printing-util.rkt"
  
  (prefix-in bool: "../puzzles/bool-puzzles.rkt")
  (prefix-in numb: "../puzzles/numb-puzzles.rkt")
  (prefix-in ineq: "../puzzles/ineq-puzzles.rkt")
  (prefix-in list: "../puzzles/list-puzzles.rkt"))


;TODO: Gotta fix this.  Relative paths are wrong...
;TODO: Also include the puzzles with the lang?
(require-lang bool)
(require-lang numb)
(require-lang ineq)
(require-lang list)



;Some helper functions to filter out the symbols from the rule cards
(define (is-symbol? i)
  (< (image-width i) 200))

(define (keep-symbols l)
  (filter is-symbol? l))

(define (keep-rules l)
  (filter (not/c is-symbol?) l))


;Collect all the puzzles together
(define puzzles
  (append bool:puzzle-deck
          numb:puzzle-deck
          ineq:puzzle-deck
          list:puzzle-deck))


;Collect all the rules+symbols together
(define rules-and-symbols
  (append (bool:render bool:theme)
          (numb:render numb:theme)
          (ineq:render ineq:theme)
          (list:render list:theme)))

;Filter the symbols from the rules
(define symbols
  (append (list (get-rparen) (get-lparen))
          (keep-symbols rules-and-symbols)))

(define rules
  (keep-rules rules-and-symbols))


;It's easy to make a bunch of rules into a bunch of pages.
(define rule-pages
  (cards->pages rules))


;Puzzle cards are oriented differently from rule cards,
;  We can turn them into pages if we rotate them.
(define puzzle-pages
  (cards->pages puzzles))


;Symbols are the trickiest.  If we (ab)use card->pages twice,
;  and then rotate it...
;  it kind of works.  But this is a bit messy....
(define symbol-pages
  (cards->pages
        (cards->pages symbols #:rows 2 #:col 3)))

(define pages
  (append
   rule-pages
   puzzle-pages
   symbol-pages))


