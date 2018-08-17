#lang racket

(provide ineq-lang
         ineq-lang-red
         ineq-lang-eval)

(require redex)
(require "./rule-grabber.rkt")

(require "./boolean-algebra.rkt"
         "./clock-numbers.rkt")








(define-union-language _inequalities-lang boolean-algebra-lang clock-numbers-lang )

(define-extended-language ineq-lang _inequalities-lang
  (e out-bool in-e)
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
  )

(define-extended-language _eval-inequalities-lang  ineq-lang
  (E hole
     (< in-e E) (< E in-e)
     (> in-e E) (> E in-e)
     (>= in-e E) (>= E in-e)
     (<= in-e E) (<= E in-e)
     (= in-e E) (= E in-e)))

(define-union-language ineq-lang-eval
  _eval-inequalities-lang
  clock-numbers-lang-eval
  boolean-algebra-lang-eval)

(define-metafunction+ ineq-lang-eval
  =~ : any any -> any
  [(=~ number_1 number_1) #t]
  [(=~ number_1 number_2) #f])

(define-metafunction+ ineq-lang-eval
  <~ : n n -> in-e
  [(<~ number_1 number_1) #f]
  [(<~ number_1 9) #t]
  [(<~ 9 number_1) #f]
  [(<~ number_1 8) #t]
  [(<~ 8 number_1) #f]
  [(<~ number_1 7) #t]
  [(<~ 7 number_1) #f]
  [(<~ number_1 6) #t]
  [(<~ 6 number_1) #f]
  [(<~ number_1 5) #t]
  [(<~ 5 number_1) #f]
  [(<~ number_1 4) #t]
  [(<~ 4 number_1) #f]
  [(<~ number_1 3) #t]
  [(<~ 3 number_1) #f]
  [(<~ number_1 2) #t]
  [(<~ 2 number_1) #f]
  [(<~ number_1 1) #t]
  [(<~ 1 number_1) #f]
  [(<~ number_1 0) #f])

(define-metafunction+ ineq-lang-eval
  <=~ : any any -> any
  [(<=~ number_1 number_2) (or (= number_1 number_2)
                               (< number_1 number_2))])

(define-metafunction+ ineq-lang-eval
  >~ : any any -> any
  [(>~ number_1 number_2) (< number_2 number_1)])

(define-metafunction+ ineq-lang-eval
  >=~ : any any -> any
  [(>=~ number_1 number_2) (or (= number_1 number_2)
                               (> number_1 number_2))])

(define-metafunction+ ineq-lang-eval
  max~ : any any -> any
  [(max~ number_1 number_2) (if (> number_1 number_2)
                                number_1
                                number_2)])

(define-metafunction+ ineq-lang-eval
  min~ : any any -> any
  [(min~ number_1 number_2) (if (> number_1 number_2)
                                number_2
                                number_1)])



(define _inequalities-lang-red
  (reduction-relation
   ineq-lang-eval
   #:domain any
   (--> (in-hole E (< n_1 n_2))  (in-hole E (<~ n_1 n_2)) <)
   (--> (in-hole E (> n_1 n_2))  (in-hole E (>~ n_1 n_2)) >)
   (--> (in-hole E (>= n_1 n_2)) (in-hole E (>=~ n_1 n_2)) >=)
   (--> (in-hole E (<= n_1 n_2)) (in-hole E (<=~ n_1 n_2)) <=)
   (--> (in-hole E (= n_1 n_2))  (in-hole E (=~ n_1 n_2)) =)

   (--> (in-hole E (max n_1 n_2))  (in-hole E (max~ n_1 n_2)) max)
   (--> (in-hole E (min n_1 n_2))  (in-hole E (min~ n_1 n_2)) min)
   ))


(define extended-boolean-algebra-lang-red
  (extend-reduction-relation boolean-algebra-lang-red
                             ineq-lang-eval))



(define extended-clock-numbers-lang-red
  (extend-reduction-relation clock-numbers-lang-red
                             ineq-lang-eval))



(define ineq-lang-red
  (union-reduction-relations _inequalities-lang-red
                             extended-boolean-algebra-lang-red
                             extended-clock-numbers-lang-red))

(module+ test
  (traces ineq-lang-red
          (term (if (> 4 3) (> 3 4) 4)))
  
  #;(traces inequalities-lang-red
            (term (if (< 5 4) (= 2 2) (add 2 3))))
  #;(traces inequalities-lang-red
            (term (max 3 4)))
  #;(traces inequalities-lang-red
            (term (if (< 2 3) 5 6))))

#;(module+ test
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








