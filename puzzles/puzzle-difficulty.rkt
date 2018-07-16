#lang racket

(provide make-graph)

(require racket/list) ;needed library

(require plot) ;needed for any type of graph

(define mylist (list '(and T(or F T(not T F))) ;list of a list - mylist contains data set from other group. should be updated with more puzzles as they are created
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

(define (make-graph l)  ;defines the function to produce the entire graph with given list 'l'.

(define levels ;define levels as a list to save results of lambda function below

(map (lambda (i) ;map applies to all elements in the list, lambda is used to take in arguement and procedure  

         (length (flatten i))) ;flatten ignored syntax and takes number of words ie AND, OR, T, F etc. used to determine difficulty 

       (remove-duplicates l)));removes all duplicates i


; 11 is max difficulty of the puzzles encountered in the current dataset

(define out-of 11)

(define breaks '((0 4) (5 8) (9 15))) ;used as groupings in graph. must be 2 numbers ie 0-4, 5-8 etc. can have more groupings of two

(define (label l)

  (format "~a-~a" (first l) (second l))) ;correct version of formatting

(define (buckets l) ;procedure for creating graph

  (let ((sorted (sort l <)))

    (for/list ([b breaks])

          (vector (label b)

           (count (lambda (x) (and 

                    (<= x ( second b))

                    (>= x ( first b))))

               levels)))))

(plot ;actually plot the graph

 (list

  (discrete-histogram 

  (buckets levels)))

 #:out-file "hist.png" ;additional info, how to name title, x-axis, Y-axis, etc

#:title "Plot of difficulty ratings and amount it occurs"

#:x-label "difficulty rating"

#:y-label "# of occurances"))

(module+ test
  (make-graph mylist))