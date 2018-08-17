#lang racket

(provide clock-numbers++-lang
         clock-numbers++-red
         clock-numbers++-lang-eval)

(require (except-in redex test-->))

(require "./rule-grabber.rkt")

(require "./ineq.rkt"
         "./list.rkt")


(language
  ;Defines these.  Could generate defs, but would have to
  ;  circumvent hygene
  clock-numbers++-lang
  clock-numbers++-lang-eval
  clock-numbers++-red

  
  (extends ineq list)

  
  (grammar
   (e cn++-e)
   (cn++-e n++ (op cn++-e) (bop cn++-e cn++-e))
   (n++ (cons n n++) nil)
   (op S P zero? unpad pad nines? safe-pad num-digits)
   (bop add sub div mod mult cons)
   (n 0 1 2 3 4 5 6 7 8 9))

  
  (functions n++ ;Don't specify here?  Have function types??
 
   (S nil)                  nil
   (S (cons 9 any_1))       (cons 0 (S any_1))
   (S (cons any_1 any_2))   (cons (S any_1) any_2)
 
   (P nil)                  nil
   (P (cons 0 any_1))       (cons 9 (P any_1))
   (P (cons any_1 any_2))   (cons (P any_1) any_2)

   (zero? nil)                      #t
   (zero? (cons 0 nil))             #t
   (zero? (cons 0 any_1))           (zero? any_1)
   (zero? (cons number_1 any_1))    #f

   (pad nil)                 (cons 0 nil)
   (pad (cons any_1 any_2))  (cons any_1 (pad any_2))


   (nines? nil)                      #f
   (nines? (cons 9 nil))             #t
   (nines? (cons 9 any_1))           (nines? any_1)
   (nines? (cons number_1 any_1))    #f

   (safe-pad any_1)    (if (nines? any_1)
                           (pad any_1)
                           any_1)

   (unpad nil)                   nil
   (unpad (cons any_1 any_2))    (if (zero? any_2)
                                     (cons any_1 nil)
                                     (cons any_1 (unpad any_2)))

   (add any_1 any_2)        (if (zero? any_2)
                                any_1
                                (add (S any_1) (P any_2)))

   (mult any_1 any_2)        (if (zero? any_2)
                                 (cons 0 nil)
                                 (add any_1 (mult any_1 (P any_2))))

   (sub any_1 any_2)        (if (zero? any_2)
                                any_1
                                (sub (P any_1) (P any_2)))

   (mod any_1 any_2)        (if (< any_2 any_1)
                                any_2
                                (mod (sub any_1 any_2)
                                     any_2))

   (< any_1 any_2)    (or (longer-num any_1 any_2)
                          ())

   (num-digits nil)                (cons 0 nil)
   (num-digits (cons any_1 any_2)) (S (safe-pad
                                       (num-digits any_2))))


  )




(module+ test

  (displayln "Test S")
  (test-->> clock-numbers++-red
            (term
             (S (cons 0 nil)))
            (term (cons 1 nil)))

  
  (displayln "Test nines?")
  (test-->> clock-numbers++-red
            (term
             (nines? (cons 9 (cons 8 nil))))
            (term #f))


  (displayln "Test safe-pad")
  (test-->> clock-numbers++-red
            (term
             (safe-pad (cons 9 (cons 8 nil))))
            (term
             (cons 9 (cons 8 nil))))


  (displayln "Test unpad")
  (test-->>
   clock-numbers++-red
   (term
    (unpad (cons 2 (cons 2 (cons 0 (cons 0 (cons 0 nil)))))))
   (term
    (cons 2 (cons 2 nil))))


  (displayln "Test num-digits")
  (test-->> clock-numbers++-red
            (term
             (num-digits (cons 2 (cons 2 nil))))
            (term
             (cons 2 nil)))


  (displayln "Test mult")
  (test-->> clock-numbers++-red
            (term
             (mult (cons 2 (cons 0 nil))
                   (cons 2 (cons 0 nil))))
            (term
             (cons 4 (cons 0 nil))))


  (displayln "Test sub")
  (test-->> clock-numbers++-red
            (term
             (sub (cons 5 nil)
                  (cons 2 nil)))
            (term
             (cons 3 nil)))

  #;(displayln "Test mod")
  #;(test-->> clock-numbers++-red
            (term
             (mod (cons 9 nil)
                  (cons 2 nil)))
            (term
             (cons 1 nil)))


  #;(displayln "Test <")
  #;(test-->> clock-numbers++-red
            (term
             (< (cons 2 (cons 1))                 ;12 vs
                (cons 5 (cons 2 (cons 0 nil)))    ;025 (zero padded 25)
                ))
            (term
             #t))


  (displayln "Test add")
  (test-->> clock-numbers++-red
            (term (add (cons 9 (cons 0 nil))
                       (cons 1 (cons 0 nil))))
            (term (cons 0 (cons 1 nil))))

  (displayln "Test zero?")
  (test-->> clock-numbers++-red
            (term (zero? (cons 0 (cons 0 nil))))
            (term #t))

  (displayln "Test zero?")
  (test-->> clock-numbers++-red
            (term (zero? (cons 0 (cons 1 nil))))
            (term #f))

  (displayln "Test (S (P x))")
  (test-->> clock-numbers++-red
            (term (S (P (cons 4 (cons 0 nil)))))
            (term (cons 4 (cons 0 nil))))

  (displayln "Test S")
  (test-->> clock-numbers++-red
            (term (S (cons 9 (cons 0 nil))))
            (term (cons 0 (cons 1 nil))))

  (displayln "Test P")
  (test-->> clock-numbers++-red
            (term (P (cons 0 (cons 0 nil))))
            (term (cons 9 (cons 9 nil)))))






