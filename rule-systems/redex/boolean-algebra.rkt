#lang racket

(require (prefix-in bool: "../boolean-algebra-cards.rkt")
         (prefix-in bool: "../../themes/emoji-boolean-algebra.rkt")
         (prefix-in numb: "../clock-number-cards.rkt")
         (prefix-in numb: "../../themes/emoji-clock-arithmetic.rkt")
         "../cards.rkt")

;(bool:render bool:theme)
;(numb:render numb:theme)



(require 2htdp/image)

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

    (--> (= any_1 any_1) T)
    )
   boolean-algebra-lang e))


(module+ main
  (traces boolean-algebra-lang-red (term (and T (and T F)))
          ;#:pp
          #;(λ (term port w txt)
            (write-special
             (scale 0.25 (render-example term))
             port))))



#;(define-extended-language clock-numbers-lang boolean-algebra-lang
  (op .... S P)
  (bop add sub)
  (v  .... 0 1 2 3 4 5 6 7 8 9))




(module+ test (require rackunit))

(define-language clock-numbers-lang
  (compatible-closure
   (reduction-relation
    clock-numbers-lang

    (--> (S 0) 1)
    (--> (S 1) 2)
    (--> (S 2) 3)
    (--> (S 3) 4)
    (--> (S 4) 5)
    (--> (S 5) 6)
    (--> (S 6) 7)
    (--> (S 7) 8)
    (--> (S 8) 9)
    (--> (S 9) 0)
    
    (--> (P 0) 9)
    (--> (P 1) 0)
    (--> (P 2) 1)
    (--> (P 3) 2)
    (--> (P 4) 3)
    (--> (P 5) 4)
    (--> (P 6) 5)
    (--> (P 7) 6)
    (--> (P 8) 7)
    (--> (P 9) 8)

    (--> (add number_1 0)
         number_1)
    (--> (add number_1 number_2)
         (add (S number_1) (P number_2))))
   clock-numbers-lang e)
  (e   ::=

       (bop e e)
       (op e)
       n)
  (n   ::=

       0 1 2 3 4 5 6 7 8 9)
  (op  ::=
       S P)
  (bop ::=
       add sub))

(define-extended-language eval-clock-numbers-lang  clock-numbers-lang
  (E hole (S E) (P E) (add n E) (add E e) (sub n E) (sub E e)))

(define clock-numbers-lang-red
  (reduction-relation
   eval-clock-numbers-lang
   #:domain e
   (--> (in-hole E (S n)) (in-hole E (mod+n n)) S)
   (--> (in-hole E (P n)) (in-hole E (mod-n n)) P)

   (--> (in-hole E (add 0 n_1))   (in-hole E n_1) B)
   (--> (in-hole E (add n n_1)) (in-hole E (add (P n) (S n_1))) (side-condition (> (term n) 0)) R)))

;; modulo-10 successor of n
(module+ test
  (check-equal? (term (mod+n 9)) (term 0)))
(define-metafunction eval-clock-numbers-lang
  mod+n : n -> n
  [(mod+n n) ,(modulo (+ (term n) 1) 10)])

;; modulo-10 predecessor of n
(module+ test
  (check-equal? (term (mod-n 0)) (term 9)))
(define-metafunction eval-clock-numbers-lang
  mod-n : n -> n
  [(mod-n n) ,(modulo (- (term n) 1) 10)])


(module+ main
  (traces clock-numbers-lang-red
          (term (add 2 1))))

(define x (random 2))

(cond
  [(= x 1) (generate-term clock-numbers-lang e 2)]
  [(= x 0) (generate-term boolean-algebra-lang e 2)]
  )