#lang racket

(require
  "../rule-systems/common.rkt"
  "../rule-systems/card-designs.rkt"
  "../rule-systems/rules.rkt"
  "../util/util.rkt"
  "./puzzle-util.rkt"
  "../print/printing-util.rkt"
  2htdp/image)

(require-lang list)

(provide puzzle-expressions
         puzzle-deck)

(define puzzle-expressions
  (remove-duplicates
   (map list:generate
        '(1 1 1 1 1 1 1 1
            3 3 3 3 3 3 3 3
            5 5 5 5 5 5 5 5))))

(define puzzle-deck (map expression->puzzle-card puzzle-expressions))


(module+ test puzzle-deck)

