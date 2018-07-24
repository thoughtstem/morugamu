#lang racket

(require
  "./puzzle-util.rkt"
  (prefix-in bool: "../rule-systems/boolean-algebra-cards.rkt")
  (prefix-in bool: "../themes/emoji-boolean-algebra.rkt"))

(define boolean-algebra
  (bool:render bool:theme))

(provide puzzle-expressions
         puzzle-deck)

(define puzzle-expressions
  (list

   '(and T
         (or F T(not T F)))

   '(or F
        (not T))

   '(and
     (and F F)
     (or T (and T T)))


   '(and
     (not (or T F))
     (and T (or F T)))

   '(not
     (not
      (and F
           (and (or T T)
                F))))

   '(or F T)

   '(and T
         (or F F))

   '(or T
        (not F))

   '(not
     (or T
         (not T)))

   '(or
     (not
      (and T F))
     (or F
         (and F T)))

   '(not
     (not
      (not T)))

   '(and
     (or F
         (not F))
     (or T
         (not F)))

   '(or
     (not F) 
     (and
      (and T T)
      F))

   '(not
     (or
      (and T
           (and F F))
      T))

   '(or F
        (and F (or T T)))

   '(not
     (not
      (and
       (or F F)
       T)))

   '(or T
        (and T
             (or F T)))

   '(and
     (not
      (and T T))
     (not (and F F)))

   '(or
     (not T)
     (and
      (not F)
      F))

   '(or
     (not (not T))
     (not (not F)))

   '(or (and T F)
        (and T T))

   '(and
     (not T)
     (or (not T)
         (and T T)))
   
   '(and
     (or (not T) T)
     (and T (not F)))
   
   '(and
     (not
      (not F))
     (not (not T)))
   
   '(not
     (and F
          (or F T)))

   
   '(and
     (or F (and
            (or F T) F)))
   
   '(and T
         (or
          (and
           (not F) F)
          (not T)))
   
  '(or
    (and T T)
    (not T))
                      
  '(not
    (or
     (and T F)
     (and F F)))
                      
  '(or
    (not
     (not F))
    (not F))
                      
  '(not
    (or
     (and
      T
      (or F T))
     (not F)))
                      
  '(not
    (and T (not
            (or F (and T T)))))
                      

  ;1
  '(or
    (or T T)
    (or
     (or F F)
     T))
                      

  ;2
  '(and F
        (and F
             (and T T)))
                      

  ;3
  '(not
    (or
     (or F F)
     (and F F)))
                      

  ;4
  ' (not
     (and T
          (and T
               (or T F))))
                      

  ;5
  '
  (or (not
       (not
        (not F)))
      (not
       (not
        (not T))))
                      

  '(or T
       (not 
        (and T F)))
                      

  '(not
    (or
     (or F F))
    (and F
         (not F)))
                      

  ' (and
     (not F)
     (not
      (or T F)))
                      

  ' (not
     (or
      (or T F))
     (and T
          (not
           (and T T))))
                      

  ' (or
     (or
      (and T F)
      (or T F))
     (and
      (or T F)
      (not T)))
                      



  ' (and
     (not
      (or T)
      (and T F))
     (and
      (and T F)
      (or F)))
                      


  ' (not
     (and
      (or
       (not T)
       (not F))
      (and
       (not F)
       (not F))))



  ' (not
     (or
      (and T F)
      (or T F))
     (and
      (not T F)
      (not T)))


  ' (and
     (not F)
     (not
      (or T F)))

                   
  ' (or 
     (and T F)
     (or 
      (or 

       (or T F))))
                      

  ' (not
     (or
      (and T F)
      (or T F))
     (and
      (not T F)
      (not T)))

  ' (or
     (or
      (or F)
      (and F T))
     (and
      (and T F)
      (or F)))
                      


  ;Puzzles

  '(and
    (not (or T F))
    (and T (or F T)))
                      

  '(not
    (not
     (and F
          (and (or T T)
               F))))
                      

  '(not
    (and
     (and T
          (and T (or F T)))))
                      

  '(and
    (and
     (or T F)
     (and T F))
    (or
     (and T F)
     (not F)))
  ))


(define puzzle-deck (map expression->puzzle-card puzzle-expressions))
