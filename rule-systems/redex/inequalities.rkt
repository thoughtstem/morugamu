#lang racket

(provide inequalities-lang
         inequalities-lang-red
         eval-inequalities-lang)

(require redex)
(require "./rule-grabber.rkt")

(require "./boolean-algebra.rkt"
         "./clock-numbers.rkt")

;IFS

;Need to extract this.  COuldn't figure out how...
#;(
   
(define-language if-lang
  (e if-e bv)
  (if-e (if e e e))
  (bv T F))

(define-extended-language if-lang-eval if-lang
  (E hole
     (if E e e)))

(define-metafunction+ if-lang-eval
  if~ : e e e -> e
  [(if~ T any_1 any_2) any_1]
  [(if~ F any_1 any_2) any_2])


(define if-lang-red
  (reduction-relation
   if-lang-eval
   #:domain e
   (--> (in-hole E (if bv_1 any_1 any_2)) (in-hole E (if~ bv_1 any_1 any_2))  if)))

#;(module+ test
  (traces if-lang-red
          (term (if (if T F F) F T))))


)

;END IFS




(define-union-language _inequalities-lang boolean-algebra-lang clock-numbers-lang #;if-lang)

(define-extended-language inequalities-lang _inequalities-lang
  (e out-bool in-e if-e)
  (out-bool basic-in-e)
  (basic-in-e 
   (< out-num out-num)
   (> out-num out-num)
   (<= out-num out-num)
   (>= out-num out-num)
   (= out-num out-num))
  (min-max-in-e
   (min out-num out-num)
   (max out-num out-num))
  (in-e cn-e
        ba-e
        basic-in-e
        min-max-in-e)

  ;Gross

  (if-e (if out-bool e e)))

(define-extended-language _eval-inequalities-lang  inequalities-lang
  (E hole
     (< in-e E) (< E in-e)
     (> in-e E) (> E in-e)
     (>= in-e E) (>= E in-e)
     (<= in-e E) (<= E in-e)
     (= in-e E) (= E in-e)))

(define-union-language eval-inequalities-lang
  _eval-inequalities-lang
  clock-numbers-lang-eval
  boolean-algebra-lang-eval
  #;if-lang-eval)

(define-metafunction+ eval-inequalities-lang
  =~ : n n -> in-e
  [(=~ number_1 number_1) T]
  [(=~ number_1 number_2) F])

(define-metafunction+ eval-inequalities-lang
  <~ : n n -> in-e
  [(<~ number_1 number_1) F]
  [(<~ number_1 9) T]
  [(<~ 9 number_1) F]
  [(<~ number_1 8) T]
  [(<~ 8 number_1) F]
  [(<~ number_1 7) T]
  [(<~ 7 number_1) F]
  [(<~ number_1 6) T]
  [(<~ 6 number_1) F]
  [(<~ number_1 5) T]
  [(<~ 5 number_1) F]
  [(<~ number_1 4) T]
  [(<~ 4 number_1) F]
  [(<~ number_1 3) T]
  [(<~ 3 number_1) F]
  [(<~ number_1 2) T]
  [(<~ 2 number_1) F]
  [(<~ number_1 1) T]
  [(<~ 1 number_1) F]
  [(<~ number_1 0) F])

(define-metafunction+ eval-inequalities-lang
  <=~ : any any -> any
  [(<=~ number_1 number_2) (or (= number_1 number_2)
                               (< number_1 number_2))])

(define-metafunction+ eval-inequalities-lang
  >~ : any any -> any
  [(>~ number_1 number_2) (< number_2 number_1)])

(define-metafunction+ eval-inequalities-lang
  >=~ : any any -> any
  [(>=~ number_1 number_2) (or (= number_1 number_2)
                               (> number_1 number_2))])

(define-metafunction+ eval-inequalities-lang
  max~ : any any -> any
  [(max~ number_1 number_2) (if (> number_1 number_2)
                                number_1
                                number_2)])

(define-metafunction+ eval-inequalities-lang
  min~ : any any -> any
  [(min~ number_1 number_2) (if (> number_1 number_2)
                                number_2
                                number_1)])

(define-metafunction+ eval-inequalities-lang
  if~ : any any any -> any
  [(if~ T any_1 any_2) any_1]
  [(if~ F any_1 any_2) any_2])


(define _inequalities-lang-red
  (reduction-relation
   eval-inequalities-lang
   #:domain e 
   (--> (in-hole E (< n_1 n_2))  (in-hole E (<~ n_1 n_2)) <)
   (--> (in-hole E (> n_1 n_2))  (in-hole E (>~ n_1 n_2)) >)
   (--> (in-hole E (>= n_1 n_2)) (in-hole E (>=~ n_1 n_2)) >=)
   (--> (in-hole E (<= n_1 n_2)) (in-hole E (<=~ n_1 n_2)) <=)
   (--> (in-hole E (= n_1 n_2))  (in-hole E (=~ n_1 n_2)) =)

   (--> (in-hole E (max n_1 n_2))  (in-hole E (max~ n_1 n_2)) max)
   (--> (in-hole E (min n_1 n_2))  (in-hole E (min~ n_1 n_2)) min)
   
   ;Gross
   (--> (in-hole E (if bv_1 any_1 any_2)) (in-hole E (if~ bv_1 any_1 any_2))  if)))


(define extended-boolean-algebra-lang-red
  (extend-reduction-relation boolean-algebra-lang-red
                             eval-inequalities-lang))



(define extended-clock-numbers-lang-red
  (extend-reduction-relation clock-numbers-lang-red
                             eval-inequalities-lang))

#;(define extended-if-lang-red
  (extend-reduction-relation if-lang-red
                             eval-inequalities-lang))

(define inequalities-lang-red
  (union-reduction-relations _inequalities-lang-red
                             extended-boolean-algebra-lang-red
                             extended-clock-numbers-lang-red
                             #;extended-if-lang-red))

#;(module+ test
  #;(traces inequalities-lang-red
          (term (if (> 3 4) 3 4)))
  #;(traces inequalities-lang-red
          (term (if (< 5 4) (= 2 2) (add 2 3))))
  (traces inequalities-lang-red
          (term (max 3 4)))
  #;(traces inequalities-lang-red
            (term (if (< 2 3) 5 6))))

(module+ test
  
  (traces inequalities-lang-red
          (term (< 2 4)))
  (traces inequalities-lang-red
          (term (< 2 (add 1 2))))
  (traces inequalities-lang-red
          (term (> 5 (add 1 2))))
  (traces inequalities-lang-red
          (term (<= 2 (add 1 2))))
  (traces inequalities-lang-red
          (term (>= 5 (add 1 2))))
  (traces inequalities-lang-red
          (term (= 3 (add 1 2)))))








