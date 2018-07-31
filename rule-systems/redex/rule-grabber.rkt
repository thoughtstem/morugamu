#lang racket

(require redex)

(provide define-metafunction+
         get-rule-data
         rules-for)

(define data (hash))
(define (set-data! d)
  (set! data d))
(define (get-rule-data) data)

(define (filter-rules l)
  (filter list? l))

(define (untilde s)
  (cond [(list? s) (map untilde s)]
        [(boolean? s) (untilde (if s 'T 'F))]
        [(number? s) s]
        [else
         (string->symbol
          (string-replace (symbol->string s) "~" ""))]))

(define (rules-for s)
  (hash-ref (get-rule-data) s #f))

(define-syntax-rule (define-metafunction+ lang id rules ...)
  (begin
    (define-metafunction lang id rules ...)
    (set-data! (hash-set data
                         (untilde 'id)
                         (filter-rules (list (untilde 'rules) ...))))))

