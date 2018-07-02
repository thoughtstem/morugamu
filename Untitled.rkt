#lang racket

(require pict/code
         pict
         )



(define the-code
  (list
   (code
    (define CAMPERS "You know who you are"))

   (code
    (define COUNSELORS
      (or
       "Team leaders in green ThoughtSTEM Shirts"
       "Lead instructor in black ThoughtSTEM polo"
       )))
   
   (code
    (define RULES
     (list
      (listen-to COUNSELORS)
      (be-positive)
      (be-independent)
      (code:comment "COUNSELORS may add rules here")
      code:blank
      code:blank
      code:blank
      code:blank)))

   (code
    (obey CAMPERS RULES))))


(define the-taxes
  (list
   (code
    (define TAXES
      (list 
        (running            -5)
        (sassy              -5)
        (cheating           -7)
        (out-of-bounds     -10)
        (computer-violation -5)
        (negativity         -5)
        (code:comment "COUNSELORS may add taxes here")
      code:blank
      code:blank
      code:blank
      code:blank)))))

(pict->bitmap (vl-append

 (scale (code (define THOUGHTSTEM-CAMP-CODE)) 3)

 (ghost (rectangle 50 50))

 (apply vl-append 50
        (map (curryr scale 2) the-code))

 (ghost (rectangle 50 50))

 (apply vl-append 50
        (map (curryr scale 2) the-taxes))))