#lang racket

(require plot)
(plot-new-window? #t)

;Team 2+2=5 Games

(plot (list (discrete-histogram
               '(#(Play-Trumps-Politics 1) #(Manipulate 1.9) #(Drunk-In-The-Trunk .1)
                 #(No-Pun-Included .5) #(Ian-Brodys-Quartermaster-General 2.6) #(Sorcerer-City 3.0)
                 #(Transit-City .9) #(Hellboy 13.1) #(Deus-Lo-Vult 3)
                 #(Soccer-City 2.9) #(Coding-Farmers 0.6) #(Inequality-opoly 1.7))
               #:skip 2 #:x-min 0
               #:label "$ Asked For")

              (discrete-histogram
               '(#(Play-Trumps-Politics 0.0002) #(Manipulate 2.1) #(Drunk-In-The-Trunk 0.062)
                 #(No-Pun-Included 1.5) #(Ian-Brodys-Quartermaster-General 4.3) #(Sorcerer-City 21.9)
                 #(Transit-City 0.2) #(Hellboy 190.6) #(Deus-Lo-Vult 0.7)
                 #(Soccer-City 3.3) #(Coding-Farmers 0.8) #(Inequality-opoly 0.1))
               #:skip 2 #:x-min 1
               #:label "$ Received" #:color 2 #:line-color 2))
        #:x-label "Games" #:y-label "Money (in tens of thousands of dollars)"
        #:title "Board Games Funded Via Kickstarter")
