#lang slideshow

(require pict/code
         "../../rules.rkt"
         "../../art/logo.rkt"
         (prefix-in bool: "../../boolean-algebra-cards.rkt")
         (prefix-in bool: "../../themes/emoji-boolean-algebra.rkt"))

(define ba-cards (bool:render bool:theme))


(slide
 (t "Who am I?")
 (vc-append
  (scale
   (hc-append
    (scale (bitmap "./images/stephen-little.jpg") .75)
    (bitmap "./images/stephen-adult.jpg"))
   1/2)
  (t "Stephen Foster, Ph.D.")))

(slide
 (t "I want to make the world a better place"))

(slide
 (t "I want to teach everyone in the world to code")
 (colorize (t "(I believe this will make the world a better place)") "gray"))

(slide
 (vl-append
  (t "Summer is my favorite time!  Because of you:")
  (t "")
  (colorize (t "1) Industry experience.  Large team.  Big project.") "black")
  (colorize (t "2) Advanced programming languages.") "black")
  (colorize (t "3) Educational products for others.") "black")))



(slide 
 (t "What's the best programming language?"))

(slide #:title "What's my favorite language?"
 (t "Racket!")
 (colorize (t "(Lets you create new languages)") "gray"))


(slide #:title "Racket!"
       (vl-append
        (t "1) Download Racket")
        (t "2) Run this:")
        (t "")
        (scale
         (codeblock-pict
          #:keep-lang-line? #t
          (string-join
           '("#lang racket\n"
             "(require 2htdp/image)\n"
             "(circle 40 \"solid\" \"red\")\n")))
         2)
        (t "3) Use 2htdp/image docs.  Make something cool")))


(slide
 (t "The image game!"))

(slide #:title "Can you make this image?"
       (scale (puzzle-card (rule
                            '(and F
                                    (and (or T T)
                                         F))
                            '?))
              1))


(slide #:title "Git!"
       (vl-append
        (t "1) Clone git repo: github.com/thoughtstem/morugamu")
        (t "2) Give me your github username")
        (t "3) Push a new puzzle to puzzles/clock-number-puzzles.rkt")))


(slide
 (scale logo 0.5))

(slide
 (t "What is it?"))

(slide #:title "Game or Programming Language?"
 (vl-append 10
  (hc-append 10 (t "Computer  ") (t "⟷") (t "Player(s)"))
  (hc-append 10 (t "Identifiers  ") (t "⟷") (t "Tiles"))
  (hc-append 10 (t "Function    ") (t "⟷") (t "Rule Cards with Same Symbol"))
  (hc-append 10 (t "Expression ") (t "⟷") (t "Arrangement of tiles"))
  (hc-append 10 (t "Library      ") (t "⟷") (t "A collection of rule cards"))
  (hc-append 10 (t "Program    ") (t "⟷") (t "A collection of rule cards and tiles"))
  (hc-append 10 (t "Runtime    ") (t "⟷") (t "Playtime"))
  (hc-append 10 (t "Interpreter") (t "⟷") (t "Metarules"))))



(slide #:title "Functional programming??"
       (vl-append
        (t "1) Immutable data")
        (t "2) Pure functions")
        (t "3) ...")))



