#lang racket

(provide base-lang)

(require redex)

(define-language base-lang
  (e   ::=
       (bop e e)
       (op e))
  (bop ::=
       bnoop  )
  (op  :=
       noop))

