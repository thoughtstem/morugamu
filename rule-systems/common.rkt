#lang racket

(provide make-simulator
         make-generator
         make-renderer
         require-lang)

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
  (begin
    (provide rend-name)
    (define (rend-name (theme (lame-theme '(symbol ...))))

      (let ([img (first theme)])
        (set! theme (rest theme))
        (define-tile symbol  'symbol  img))
      ...

      (flatten (list
                (get-all-symbols)

                (redex-to-rule-card (rules-for 'symbol))
                ...)))))




;WORKING, but need to fix paths....
(define-syntax (require-lang stx)
  (define base (syntax->datum (second (syntax-e stx))))
  (define name: (format-symbol "~a:" base))
  (define name:render (format-symbol "~arender" name:))
  (define name:theme (format-symbol "~atheme" name:))
  (define card-path (format "./~a-cards.rkt" base))
  (define theme-path (format "../themes/emoji-~a.rkt" base))
  (datum->syntax stx `(begin
                        (require (prefix-in ,name: ,card-path))
                        (require (prefix-in ,name: ,theme-path))
                        (define ,name: (,name:render ,name:theme)))))

