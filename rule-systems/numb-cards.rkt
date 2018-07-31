#lang racket

(require "./common.rkt")
(require "./redex/clock-numbers.rkt")

(make-generator generate clock-numbers-lang e)
(make-simulator simulate clock-numbers-red)
(make-renderer  render
                (S P
                 0 1 2 3 4 5 6 7 8 9
                 add sub))

;TODO:
;  Number identifiers are broken
#;(define (render theme)

  (define dot (third theme))

  (define-tile the-successor  'S   (first theme))


  (define-tile the-previous   'P   (second theme))

  (define-tile the-0          '0   (fourth theme))

  (define-tile the-1          '1    dot)

  (define-tile the-2 '2
    (beside dot dot))

  (define-tile the-3 '3
    (above dot (beside dot dot)))

  (define-tile the-4 '4
    (above (beside dot dot) (beside dot dot)))

  (define-tile the-5 '5
    (above (beside dot dot)
           dot
           (beside dot dot)))

  (define-tile the-6 '6
    (beside (above dot dot dot)
            (above dot dot dot)))

  (define-tile the-7 '7
    (beside (above dot dot dot)
            dot
            (above dot dot dot)))

  (define-tile the-8 '8
    (beside (above dot dot dot)
            (above dot dot)
            (above dot dot dot)))

  (define-tile the-9 '9
    (beside (above dot dot dot)
            (above dot dot dot)
            (above dot dot dot)))

  (define-tile the-prompt '?
    (text "?" 40 "black"))

  (define-tile the-add  'add
    (fifth theme))

  (define-tile the-sub  'sub
    (sixth theme))

  
  (flatten (list
            (get-all-symbols)

            (redex-to-rule-card (take (rules-for 'S) 5))
            (redex-to-rule-card (take (drop (rules-for 'S) 5) 5))
            (redex-to-rule-card (take (rules-for 'P) 5))
            (redex-to-rule-card (take (drop (rules-for 'P) 5) 5))
            (redex-to-rule-card (rules-for 'add))
            (redex-to-rule-card (rules-for 'sub)))))


