#lang racket

(require
  "../rule-systems/card-designs.rkt"
  "../rule-systems/rules.rkt"
  (prefix-in numb: "../rule-systems/clock-number-cards.rkt")  
  (prefix-in numb: "../themes/emoji-clock-arithmetic.rkt"))

(define clock-numbers-algebra
  (numb:render numb:theme))

clock-numbers-algebra

;Defining the two-input operators as lists
(define two-op-bool (list 'and 'or))
(define two-op-clock '(add sub))


;Function rand-element
;randomly returns one item from the specified list (list-in)
(define (rand-element list-in) 
  (first (shuffle list-in) )
  )

;Generate either an 'and or an 'or and put that in the variable output
;Simon random number generator: ,(+ 0 (random 10))

;puzzle structurs #0
(puzzle-card (rule `(,(rand-element two-op-clock)
                     ,(+ 0 (random 10))
                     ,(+ 0 (random 10)))'?))

;puzzle structure #1
(puzzle-card (rule `(,(rand-element two-op-clock)
                     (,(rand-element two-op-clock) ,(+ 0 (random 10)) ,(+ 0 (random 10)))
                     (,(rand-element two-op-clock) ,(+ 0 (random 10)) ,(+ 0 (random 10))))
                   '?))

;puzzle structure #2
(puzzle-card (rule `(,(rand-element two-op-clock)
                     (,(rand-element two-op-clock) ,(+ 0 (random 10)) (,(rand-element two-op-clock) ,(+ 0 (random 10)) ,(+ 0 (random 10))))
                     (,(rand-element two-op-clock) (,(rand-element two-op-clock) ,(+ 0 (random 10)) ,(+ 0 (random 10))) ,(+ 0 (random 10)))
                     )'?))

;puzzle structure #3
(puzzle-card (rule `(,(rand-element two-op-clock) ,(+ 0 (random 10))
                                                  (,(rand-element two-op-clock) ,(+ 0 (random 10)) ,(+ 0 (random 10))))
                   '?))

;NEW CODE TEST

;define a new list and add one puzzle to it
(define puzzle-list '())
(set! puzzle-list (cons '(add 3 2) puzzle-list))

;Try printing out the first value in that list
(puzzle-card (rule
              (first puzzle-list)
              '?))


;gonna try to populate the list with a random puzzle now (from the 4 structures listed above)...
(define num (+ 0 (random 4)))   ;generate a random number from 0-3

(if (eq? num 0)
    (set! puzzle-list (cons `(,(rand-element two-op-clock)
                              ,(+ 0 (random 10))
                              ,(+ 0 (random 10))) puzzle-list))
    (if (eq? num 1)
        (set! puzzle-list (cons  `(,(rand-element two-op-clock)
                                   (,(rand-element two-op-clock) ,(+ 0 (random 10)) ,(+ 0 (random 10)))
                                   (,(rand-element two-op-clock) ,(+ 0 (random 10)) ,(+ 0 (random 10)))) puzzle-list))

        (if (eq? num 2)
            (set! puzzle-list (cons `(,(rand-element two-op-clock)
                                      (,(rand-element two-op-clock) ,(+ 0 (random 10)) (,(rand-element two-op-clock) ,(+ 0 (random 10)) ,(+ 0 (random 10))))
                                      (,(rand-element two-op-clock) (,(rand-element two-op-clock) ,(+ 0 (random 10)) ,(+ 0 (random 10))) ,(+ 0 (random 10)))
                                      ) puzzle-list))

            ;else
            (set! puzzle-list (cons `(,(rand-element two-op-clock) ,(+ 0 (random 10))
                                                                   (,(rand-element two-op-clock) ,(+ 0 (random 10)) ,(+ 0 (random 10)))) puzzle-list))
            )))

(puzzle-card (rule
              (first puzzle-list)
              '?))


;-------------------------------------------------------------------------------------

;NEW FUNCTION BELOW
;define new function that adds one puzzle to a list
(define (add-puzzle list-in)

  (define num (+ 0 (random 4)))   ;generate a random number from 0-3

  (cons
   (cond [(eq? num 0)
          `(,(rand-element two-op-clock)
            ,(+ 0 (random 10))
            ,(+ 0 (random 10)))]
         [ (eq? num 1)
           `(,(rand-element two-op-clock)
             (,(rand-element two-op-clock) ,(+ 0 (random 10)) ,(+ 0 (random 10)))
             (,(rand-element two-op-clock) ,(+ 0 (random 10)) ,(+ 0 (random 10))))]

         [(eq? num 2)
          `(,(rand-element two-op-clock)
            (,(rand-element two-op-clock) ,(+ 0 (random 10)) (,(rand-element two-op-clock) ,(+ 0 (random 10)) ,(+ 0 (random 10))))
            (,(rand-element two-op-clock) (,(rand-element two-op-clock) ,(+ 0 (random 10)) ,(+ 0 (random 10))) ,(+ 0 (random 10)))
            )]
         [else `(,(rand-element two-op-clock) ,(+ 0 (random 10))
                                              (,(rand-element two-op-clock) ,(+ 0 (random 10)) ,(+ 0 (random 10))))
               ])
   list-in)
  
  )

(define (expression->puzzle-card e)
  (puzzle-card (rule
              e
              '?)))

(define (repeat f n l)
  (if (= n 0)
      l
      (repeat f
              (- n 1)
              (f l))
      ))

(define random-puzzle-expressions
  (repeat add-puzzle 3 '()))






(map expression->puzzle-card
     random-puzzle-expressions)

