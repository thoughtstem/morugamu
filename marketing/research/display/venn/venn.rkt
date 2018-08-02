#lang racket
(require 2htdp/image)
(require htdp/gui)

; text1 : GUI-ITEM...i.e. the text field
(define text1
  (make-text "Please enter your name"))
 
; msg1 : GUI-ITEM
(define msg1
  (make-message (string-append "Hello, World" (make-string 33 #\space))))
 
; Event -> true
; draws the current contents of text1 into msg1, prepended with "Hello, "
(define (respond e)
  (draw-message msg1 (string-append "Hello, " (text-contents text1))))

 
; set up window with three "lines":
;    a text field, a message, and two buttons
; fill in text and click OKAY
(define w
  (create-window
   (list
    (list text1)
    (list msg1)
    (list (make-button "OKAY" respond)
          (make-button "QUIT" (lambda (e) (hide-window w)))))))