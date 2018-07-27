#lang racket

(provide boolean-algebra-lang
         boolean-algebra-lang-red
         boolean-algebra-lang-eval)

(require redex)
(require "./rule-grabber.rkt")


   
(define-language if-lang
  (e if-e)
  (if-e (if any any any))
  )

(define-extended-language if-lang-eval if-lang
  (E hole
     (if E e e)))

(define-metafunction+ if-lang-eval
  if~ : any any any -> any
  [(if~ #t any_1 any_2) any_1]
  [(if~ #f any_1 any_2) any_2])


(define if-lang-red
  (reduction-relation
   if-lang-eval
   #:domain any
   (--> (in-hole E (if boolean any_1 any_2)) (in-hole E (if~ boolean any_1 any_2))  if)))






(define-language boolean-algebra-lang
  (e out-bool )
  (out-bool ba-e)
  (ba-e
      (and out-bool out-bool)
      (or out-bool out-bool)
      (not out-bool)
      boolean))


(define-extended-language _boolean-algebra-lang-eval boolean-algebra-lang
  (E hole
     (not E)
     (and out-bool E)
     (and E out-bool)
     (or out-bool E)
     (or E out-bool)))

(define-union-language boolean-algebra-lang-eval 
  _boolean-algebra-lang-eval
  if-lang-eval)


(define-metafunction+ boolean-algebra-lang-eval
  not~ : any -> any
  [(not~ #f) #t]
  [(not~ #t) #f])

(define-metafunction+ boolean-algebra-lang-eval
  and~ : any any -> any
  [(and~ #t #t) #t]
  [(and~ #t #f) #f]
  [(and~ #f #t) #f]
  [(and~ #f #f) #f])

(define-metafunction+ boolean-algebra-lang-eval
  or~ : any any -> any
  [(or~ #f #t) #t]
  [(or~ #t #f) #t]
  [(or~ #t #t) #t]
  [(or~ #f #f) #f])


(define extended-if-lang-red
  (extend-reduction-relation if-lang-red
                             boolean-algebra-lang-eval))


(define _boolean-algebra-lang-red
  (reduction-relation
   boolean-algebra-lang-eval
   #:domain any
   (--> (in-hole E (not boolean))        (in-hole E (not~ boolean)) not)
   (--> (in-hole E (and boolean_1 boolean_2)) (in-hole E (and~ boolean_1 boolean_2)) and)
   (--> (in-hole E (or  boolean_1 boolean_2)) (in-hole E (or~  boolean_1 boolean_2))  or)))

(define boolean-algebra-lang-red
  (union-reduction-relations
   _boolean-algebra-lang-red
   extended-if-lang-red))

  
(module+ test
 
  (traces boolean-algebra-lang-red
          (term (if (and #t #t) (or #f #t) (and #t #f))))
  (traces boolean-algebra-lang-red
          (term (and #t #f)))
  (traces boolean-algebra-lang-red
          (term (and (or #f #t) (and #t #f)))))


