#lang scribble/manual

@require[racket/list]

@title{Morugamu}

Welcome to the Morugamu project.

@section{Philosophy}

What are we doing here?  There are lots of ways to answer that question.

One answer is that we're making a board game, and we're using Racket to help.

Another answer is that we're creating a new programming language -- one whose runtime environment is a table top and a human "computer."

Another answer is that we're trying to change the way computer science is taught -- by starting with the mathematical/algebraic basics that often get missed in traditional education (even at the university level!).

Another answer is that we're trying to provide a fun context for learning advanced concepts such as: pattern matching, higher-order functions, recursion, interpretation, macros/compilation, functional programming, immutable data, formal systems, the lambda calculus, automated theorem proving, inductive reasoning, algebraic types, and so on.

Another answer is that we're trying to make a game where you don't have to understand any of the above concepts to have fun.  They are all there, hidden just beneath the surface.

Another answer is that we're trying to get a product into stores by Christmas this year.

Another answer is that we're trying to create a teaching tool that works without computers and that can be used in any school or coffee shop around the world.

Another answer is that we're trying to create something that perfectly blends two things: fun and education.

And so on.   There are lots of ways to think about this project.  All in all, though, I'm excited about making a change in the world.  I hope you are too!

~Stephen R. Foster

@section{API Docs}

Remember that you can think of Morugamu as either a game or a programming language.  Here's the mapping of ideas:

@itemlist[
 @item{Identifiers      = Symbols/Emojis/etc}
 @item{Function named F = All Rule Cards with Symbol F}
 @item{Expression       = A Puzzle Card}
 @item{Library          = A collection of rule cards}
 @item{Program          = A collection of rule cards and a puzzle card}
 @item{Runtime          = Playtime}
 @item{Interpreter      = Metarules}]

(Side note: this programming language is roughly isomorphic to the Lisp-family language called Scheme.  There are just a couple of small differences: the use of icons and the patternmatching rules.) 

This repository separates some of the above concerns into different files. (This will definitely change as the repository grows.)

@itemlist[
          @item{How things look: see the "themes" folder}
          @item{Library definitions: see files like boolean-algebra-cards.rkt in the top-level folder}
          @item{Puzzles: see the "puzzles" folder}
]


@section{Util}

As with any project, there are some functions that are so useful that they can be used
in a variety of contexts.  This section of the docs is reserved for these low-level, high-value
functions.

@defproc[(example-function [param1 param1-type?]
                           [param2 param2-type?])
         output-type?]{

This is a fake function.  It's just there to help you document other functions.

}


@defproc[(safe-1 [f procedure?])
         procedure?]{

This makes a function that normally requires 2 arguments to be safe for calling on 1 argument.

For example, this is usually an error:

@racketblock[
  (beside (circle 30 "solid" "red"))
]

This is not an error:

@racketblock[
  ((safe-1 beside) (circle 30 "solid" "red"))
]

This is most useful in conjunction with apply:

@racketblock[
  (apply (safe-1 beside) list-of-images)
]

You now don't have to worry about handling the case when the list has only one element.

}

@defproc[(split-by [lst list?] [n number?])
         (list of lists?)]{
                           
The split-by function takes in a list and splits it into sublists of n. If there is a remainder, the remainder will be put in sublist.

Let's say you have a list of 6 letters, and you want to split it into sublists of three letters. Here's how: 
@racketblock[
(define lst '(a b c d e f))

(split-by lst 3)
]
This would return '((a b c) (d e f))

Let's say you have a list of 5 letters, and you want to split it into sublists of three letters. Here's how:
@racketblock[
(define lst '(a b c d e))

(split-by lst 3)
]
This would return '((a b c) (d e))
}

@defproc[(pair-with-index [list list?])
         (listof list?)]{
This takes in a list of puzzle card images and assigns an index to each of them. The index isn't added to the card itself as an image but a list of lists is made with each sublist containing the image and the index number.
}

@defproc[(pair-with-index [list list?])
         (listof list?)]{
This takes in a list and assigns an index to each of them. The index isn't added to the card itself as an image but a list of lists is made with each sublist containing the image and the index number.

For example, if a list of puzzle cards were inputted into this function, a list of lists would be produced in that each sublist would contain the puzzle card with its respective index. 

}

@defproc[(expression->puzzle-card [exp exp?])
         (puzzle-card?)]{
This takes in an expression then calls the puzzle-card function. It creates a puzzle card based on the expression.

For example, let's say you call the expression->puzzle-card function with a boolean algebra expression.
@racketblock[

 (expression->puzzle-card '(and (not T) F))

]
Or, try using a different expression:
@racketblock[

 (expression->puzzle-card '(and T F))

]

 Either function call will create puzzle cards. Different puzzle cards will be created based on the different boolean algebra expressions that are input into the function.

}


@section{Rule Systems}

@require[
  (prefix-in bool: "../rule-systems/boolean-algebra-cards.rkt")
]

@require[
  (prefix-in bool: "../themes/emoji-boolean-algebra.rkt")
]

@define[ba-cards (bool:render bool:theme)]

A rule card looks like this:

@second[ba-cards]

Each of the symbols used in the rule card needs to be defined as a "tile."  Then the rule card can be constructed by specifying a list of rules.

Here's an example:

Import
@racketblock[
 (require "./card-designs.rkt"
          "./rules.rkt"
          2htdp/image)
 ]

Let's suppose we wanted to create the following rule card:

@racketblock[
  (rule-card (rule '(S 0) '1)
             (rule '(S 1) '2))
]

Note that each of the four unique symbols above would need to be defined before this rule card can be constructed:

@racketblock[
  (define-tile the-successor  'S (circle 40 "solid" "black"))
  (define-tile the-0  '0 (circle 40 "solid" "red"))
  (define-tile the-1  '1 (circle 40 "solid" "orange"))
  (define-tile the-2  '2 (circle 40 "solid" "yellow"))
]

This specifies that the tiles for S, 0, 1, and 2 are each a different color of circle.  

Usually, you'll not need to specify images this way, though.  Most rule cards are part of a set of rules that define some kind of mathematically interesting system (e.g. boolean algebra or arithmetic).  These
cards will often share the same symbols and theme.  Such sets of cards (or "libraries" if you prefer the programming language terminology) are defined in files like boolean-algebra-cards.rkt.

@defproc[(define-tile [sym symbol?] [img image?]) void?]{

 Here's an example of creating a define-tile card and linking it to an image:
 @racketblock[
        (define-tile < '<
          (bitmap "./themes/emojis/LessThan.png"))
 ]
}

@defproc[(rule [ruleVar ('(function in) '(function out))])(rule?)]{

 Here’s an example of creating a rule for a rule card:
 @racketblock[
   (rule '(> y x) '(< x y))
 ]

 

}


@defproc[(rule-card [rule image?]) (image)]{

 Here’s an example of creating a rule card for the boolean algebra card:
 @racketblock[
 (rule-card (rule '(> y x) '(< x y)))
 ]
}

We now examine the various rule systems that have already been created:

@subsection{Boolean Algebra}

The convention in when implementing these rule systems is to export a render function that takes a
theme and returns a list of images (a printable symbol sheet and printable rule cards).
The theme can be easily changed as we explore different art styles for the game.

Here's an example of importing the boolean algebra rules, along with a theme, and rendering out those rule cards according to the theme:

@racketblock[
	(require
	  (prefix-in bool: "../boolean-algebra-cards.rkt")
	  (prefix-in bool: "../themes/emoji-boolean-algebra.rkt"))

	(define boolean-algebra
	  (bool:render bool:theme))
]

Note the use of the render function.  Here's how it works:

@defproc[(render [theme theme?])
         (listof image?)]{

This returns a list of images for the tiles and rule cards for the boolean algebra.

}


@subsection{Clock Numbers}

@defproc[(render [theme theme?])
         (listof image?)]{

This returns a list of images for the tiles and rule cards for the clock numbers system.

}


@subsection{Inequalities}

Inequalities is implemented on top of boolean algebra and clock numbers.

@defproc[(render [theme theme?])
         (listof image?)]{

This returns a list of images for the tiles and rule cards for the inequalities system.

}

@subsection{Lists}

@defproc[(render [theme theme?])
         (listof image?)]{

This returns a list of images for the tiles and rule cards for the list rules system.

}

@subsection{Clock++ Numbers}

@defproc[(render [theme theme?])
         (listof image?)]{

This returns a list of images for the tiles and rule cards for the clock++ number system.

}


@section{Puzzles}

As rule systems are created (see above), puzzles can be created. Puzzles help challenge your understanding of the rule cards and require you to simplify multiple tiles into one single tile.

A puzzle is equivalent to some expression that can be evaluated according to some set of rules.

This section of the docs documents the tools available for creating puzzles.

TODO: Doc this..

}
Here's an example of creating a puzzle card:
@racketblock[
          (puzzle-card ( rule '(< x y) 'T))
]
Note the use of the puzzle-card function. Here's how it works:
@defproc[(puzzle-card [rule rule?]) (image)]{

}


@section{Printing}

As rule systems and puzzles are created (see above), they need to be printed.

With more and more printable materials, the need to automate things like page numberings and
page layouts becomes more and more important.  This section documents the tools that facilitate
these kinds of things.

@defproc[(number-all [list listof image?])
         (listof image?)]{

This takes in a list of images (i.e. puzzle cards) and numbers them starting from one.  It produces a list of the same images, each with its corresponding number now placed at the top right corner.                    

}

@defproc[(save-sheets [lst list?] [num number?])
         ()]{

This function uses a list of sheet images and saves them recursively. If num is less than the length of the list, the function is called again and num is incremented.
Num is part of the file name. This function lets us save multiple files with different names without randomizing.

}

@defproc[(my-save-image [img image?] [num number?])
         ()]{

This function takes in an image and a number and saves it as "sheet" + num + ".png".

Here's an example: 
@racketblock[
(define img (circle 30 "outline" "red"))

(my-save-image img 3)
]
This would save the circle as "sheet3.png"

}

@defproc[(cards->pages [list_of_cards listof images?])
         (listof image?)]{
This function takes a list of images and turns them into a list of pages that contains 9 or less images.
}

@defproc[(9images->page [list_of_images listof images?])
         (image?)]{
This function turns a list of 9 card images into an image of a page.
}
                                          



@section{Market Research}

There's a set of tools we're building for examining the success of other board games and companies
on the Kickstarter crowd funding platform.

We have a dataset for board games and for companies and various query functions for slicing the
data in various ways.  The docs for those functions are below:

@subsection{Database Utilities}

@defproc[(row-from-id [id string?] [data list?])
	(list?)]{
This function takes in an ID string and database list. It searches the database for the ID and returns the corresponding row of data as a list. If the ID cannot be found in the database, the function returns -1.
}

@defproc[(row-from-title [title string?] [data list?])
	(list?)]{
This function takes in a title string and database list. It searches the database for the title and returns the corresponding row of data as a list. If the title cannot be found in the database, the function returns -1.
}


@subsection{Display Utilities}

@defproc[(data->histogram [data-vector listof-vector?] [skip-num number?] [x-min number?] [label string?] [color number?] [line-color number?])
         (discrete-histogram?)]{
This function returns a discrete histogram to plot, when given a list of vectors plus other info.
Here's an example:

@racketblock[
(define vector-asked
  (map list->vector (elements->lst (game:table) 1 2)))

(plot-new-window? #t)

(parameterize ([plot-x-tick-label-anchor 'top-right]
               [plot-x-tick-label-angle 50])

(plot
 (data->histogram vector-asked 3 0 "$ Asked For" 0 0)
 #:x-label "Games" #:y-label "Money (in tens of thousands of dollars)"
 #:title "Board Games Funded Via Kickstarter"))]}

