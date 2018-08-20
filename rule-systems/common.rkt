#lang racket

(provide make-simulator
         make-generator
         make-renderer
         require-lang
         require-lang-puzzles)

(require (for-syntax racket racket/syntax))

(require redex
         2htdp/image
         "../rule-systems/cards.rkt"
         "../rule-systems/card-designs.rkt"
         "../rule-systems/rules.rkt"
         "./redex/rule-grabber.rkt") 

(define-syntax-rule (make-simulator sim-name lang)
  (begin
    (provide sim-name)
    (define-syntax-rule (sim-name t)
      (traces lang
              (term t)
              #:pp
              (lambda (term port w txt)
                (write-special
                 (scale 0.2 (render-example term))
                 port))))))

(define-syntax-rule (make-generator gen-name lang exp)
  (begin
    (provide gen-name)
    (define (gen-name difficulty)
      (generate-term lang exp difficulty))))


(define (lame-theme symbols)
  (map make-icon symbols))

(define-syntax-rule (make-renderer rend-name
                                   (symbol ...))
  ;(define test 3)
  (begin
    (provide rend-name)
    (define (rend-name (theme (lame-theme '(symbol ...))))

      (let ([img (first theme)])
        (set! theme (rest theme))
        (define-tile temp ;Name doesn't matter.  Never use it...
          'symbol  img))
      ...

      (filter identity
              (flatten (list
                        (get-all-symbols)

                        (if (rules-for 'symbol)
                            (redex-to-rule-cards (rules-for 'symbol))
                            #f)
                        ...))))))

(define-for-syntax root-dir
  (string-append "/"
                 (string-join
                  (reverse
                   (memf (curry string=? "morugamu")
                         (reverse
                          (string-split
                           (path->string (current-directory))
                           "/"))))
                  "/")))


(define-syntax (require-lang stx)
  
  (define base (syntax->datum (second (syntax-e stx))))
  (define name: (format-symbol "~a:" base))
  (define name:render (format-symbol "~arender" name:))
  (define name:theme (format-symbol "~atheme" name:))
  (define card-path (format "~a/rule-systems/~a-cards.rkt" root-dir base))
  (define theme-path (format "~a/themes/emoji-~a.rkt" root-dir base))
  (datum->syntax stx `(begin
                        (require (prefix-in ,name: (file ,card-path)))
                        (require (prefix-in ,name: (file ,theme-path)))
                        (define ,name: (,name:render ,name:theme)))))


(define-syntax (require-lang-puzzles stx)
  (define base (syntax->datum (second (syntax-e stx))))
  (define name: (format-symbol "~a:" base))
  (define name:render (format-symbol "~arender" name:))
  (define name:theme (format-symbol "~atheme" name:))
  (define puzzle-path (format "~a/puzzles/~a-puzzles.rkt" root-dir base))
  (datum->syntax stx `(begin
                        (require (prefix-in ,name: (file ,puzzle-path)))
                        #;(define ,name: (,name:render ,name:theme)))))




