#lang racket
   
(require redex)
   
(define-language boolean-algebra-lang
  (op not)
  (bop and or)
  (e  (bop e e) (op e) v)
  (v  T F))

(define boolean-algebra-lang-red
  (compatible-closure
   (reduction-relation
    boolean-algebra-lang
    (--> (and T T)
         T)

    (--> (and T F)
         F)
    
    (--> (and F T)
         F)

    (--> (and F F)
         F)

    (--> (or T T)
         T)

    (--> (or T F)
         F)
    
    (--> (or F T)
         F)

    (--> (or F F)
         F)

    (--> (not F)
         T)

    (--> (not T)
         F)
    )
   boolean-algebra-lang e))

#;(module+ main
  (traces boolean-algebra-lang-red (term (and T (and T F)))))


(define-extended-language clock-numbers-lang boolean-algebra-lang
  (op .... S P)
  (bop add sub)
  (v  .... 0 1 2 3 4 5 6 7 8 9))

(define clock-numbers-lang-red
  (compatible-closure
   (reduction-relation
    clock-numbers-lang

    (--> (S 0) 1)

    (--> (S 1) 2)
    )
   clock-numbers-lang e))

(module+ main
  (traces clock-numbers-lang-red (term (S (S 0)))))
