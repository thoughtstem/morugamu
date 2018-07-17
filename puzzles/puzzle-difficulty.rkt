#lang racket


(provide make-graph)
; Imports a required package for list functions. 
(require racket/list)

; Imports a required package called plot for the visual graph. 
(require plot)


; This creates a list of puzzles (boolean, clock, etc)
(define mylist (list '(and T(or F T(not T F))) 
                       '(or F(not T))
                       '(and(and F F)(or T (and T T)))
                       '(and(not (or T F))(and T (or F T)))
                       '(not(not(and F(and (or T T)F))))
                       '(not(not(not T)))
                       '(not(not(not T)))
                       '(and(or F(not F))(or T(not F)))
                       '(or(not F) (and(and T T)F))
                       '(or F(and F (or T T)))
                       '(not(not(and(or F F)T)))
                       '(or T(and T(or F T)))
                       '(and(not(and T T))(not (and F F)))
                       '(or(not T)((and(not F)(F))))
                       '(or(not(not(T)))(not (not (F))))
                       '(or (and T F)(and T T))
                       '(and(not T)(or ((not) T)(and T T)))
                       '(and(or (not T) T)(and T (not F)))
                       '(and(not(not F))(not (not T)))
                       '(not(and F(or F T)))
                       '(and(or F (and(or F T)F))T)
                       '(and T(or(and(not F) F)(not T)))
                       '(or(and T T)(not T))
                       '(not(or(and T F)(and F F)))
                       '(or(not(not F))(not F))
                       '(not(or(and(T)(or F T))(not F)))
                       '(not(and T (not(or F (and T T)))))
                       '(or(or T T)(or(or F F)T))
                       '(and F(and F(and T T)))
                       '(not(or(or F F)(and F F)))
                       '(not(and T(and T(or T F))))
                       '(or (not(not(not F)))(not(not(not T))))
                       '(or (not(not(not F)))(not(not(not T))))
                       '(or T(not (and T F)))
                       '(not(or(or F F))(and F(not F)))
                       '(and(not F)(not(or T F)))
                       '(not(or(or T F))(and T(not(and T T))))
                       '(or(or(and T F)(or T F))(and(or T F)(not T)))
                       '(and(not(or T)(and T F))(and(and T F)(or F)))
                       '(not(and(or(not T)(not F))(and(not F)(not F))))                   
                       '(not(or(and T F)(or T F))(and(not T F)(not T)))
                       '(and(not F)(not(or T F)))
                       '(or (and T F)(or (or (or T F))))
                       '(not(or(and T F)(or T F))(and(not T F)(not T)))
                       '(or(or(or F)(and F T))(and(and T F)(or F)))
                       '(and(not (or T F))(and T (or F T)))
                       '(not(not(and F(and (or T T)F))))
                       '(not(and(and T(and T (or F T)))))))

; This is a function that makes a graph given a list of puzzles, l.

(define (make-graph l)
  
; Define levels as an updated list without duplicates.
  
(define levels
  
; Map iterates through every element in a list, and does a single function to each element.  
(map (lambda (i) 
       
       ; This takes the length of each element. Flatten ignores parantheses to help determine length.
         (length (flatten i)))
     
       ; Removes any duplicate elements within the list.
       (remove-duplicates l))) 




 ;Defines intervals of diffficulty for the graph. This must be two numbers. 
(define breaks '((0 4) (5 8) (9 15))) 

(define (label l)
  ; This sets up the formatting for the intervals defined earlier.
  (format "~a-~a" (first l) (second l)))

  
 ; This defines and places the elements in the correct interval or "bucket".
(define (buckets l)
  
  (let ((sorted (sort l <)))

    (for/list ([b breaks])   
      
          (vector (label b)

           (count (lambda (x) (and 

                    (<= x ( second b))

                    (>= x ( first b))))

               levels)))))



; This plots the graph as a discrete histogram given buckets and levels lists.
(plot 

 (list

  (discrete-histogram 

  (buckets levels)))

; This allows us to add labels for each part of the graph. 

#:out-file "hist.png"

#:title "Plot of difficulty ratings and amount it occurs"

#:x-label "difficulty rating"

#:y-label "# of occurances"))


; This actually calls/runs the 'make-graph' function that we have made. 
(module+ test
(make-graph mylist))



