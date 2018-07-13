#lang scribble/manual

@require[racket/list]

@title{Morugamu}

Welcome to the Morugamu project.

@section{Philosophy}

What are we doing here?  There are lots of ways to answer that question.

One answer is that we're making a board game, and we're using Racket to help.

Another answer is that we're creating a new programming language -- one whose runtime environment is a table top and a human "computer".

Another answer is that we're trying to change the way computer science is taught -- by starting with the mathematical/algebraic basics that often get missed in traditional education (even at the university level!).

Another answer is that we're trying to provide a fun context for learning advanced concepts such as: pattern matching, higher-order functions, recursion, interpretation, macros/compilation, functional programming, immutable data, formal systems, the lambda calculus, automated theorem proving, inductive reasoning, algebraic types, and so on.

Another answer is that we're trying to make a game where you don't have to understand any of the above concepts to have fun.  They are all there, hidden just beneath the surface.

Another answer is that we're trying to get a product into stores by Christmas this year.

Another answer is that we're trying to create a teaching tool that works without computers, that can be used in any school or coffee shop around the world.

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

(Side note: this programming language is roughly isomorphic to the Lisp-family language called Scheme.  There are just a couple of small differences: the use of icons, and the patternmatching rules.) 

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

@defproc[(split-by [lst list?] [n number?])
         (list of lists?)]{
                           
The split-by function takes in a list and splits it into an equal number of sublists. Note that this function requires the list length to be a multiple of the number you put in.                  

}

@defproc[(pair-with-index [list list?])
         (listof list?)]{
This takes in a list of puzzle card images, and assigns a index to each of them. The index isn't added to the card itself as an image but a list of lists is made with each sublist containing the image and the index number.
}



@section{Rule Systems}

@require[
  (prefix-in bool: "../boolean-algebra-cards.rkt")
]

@require[
  (prefix-in bool: "../themes/emoji-boolean-algebra.rkt")
]

@define[ba-cards (bool:render bool:theme)]

A rule card looks like this:

@second[ba-cards]

Each of the symbols used in the rule card needs to be defined as a "tile".  Then the rule card can be constructed by specifying a list of rules.

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





@defproc[(rule)(rule '(Function in) '(Function out))]{

 Here’s an example of creating a rule for a rule card
 @racketblock[
   (rule '(> y x) '(< x y))
 ]

 

}


@defproc[(rule-card [rule rule?]) ()]{

 Here’s an example of creating a rule card for the boolean algebra card
 @racketblock[
 (rule-card (rule '(> y x) '(< x y)))
 ]
}

We now examine the various rule systems that have already been created:

@subsection{Boolean Algebra}

The convention in when implementing these rule systems is to export a render function that takes a
theme and returns a list of images (a printable symbol sheet and printable rule cards).
The theme can be easily changed as we explore different art styles for the game.

Here's an example of importing the boolean algebra rules, along with a theme, and rendering out those rule cards according to the theme.

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

As rule systems are created (see above), puzzles can be created. Puzzles help challenge your understanding of the rule cards and require you to simplify multiple tiles into one single tile

A puzzle is equivalent to some expression that can be evaluated according to some set of rules.

This section of the docs documents the tools available for creating puzzles.

Individual tiles can be defined using define-tile. Here's an example

@racketblock[
        (define-tile < '<
          (bitmap "./themes/emojis/LessThan.png"))
]
Tiles are then used in rule cards and puzzles.

@defproc[(puzzle-card [rule rule?])
         image?]{

TODO: Doc this..

}
Here's an example of creating a puzzle card
@racketblock[
          (puzzle-card ( rule '(< x y) 'T))
]
Note the use of the puzzle-card function. Here's how it works:
@defproc[(puzzle-card [rule rule?]) ()]{

}


@section{Printing}

As rule systems and puzzles are created (see above), they need to be printed.

With more and more printable materials, the need to automate things like page numberings and
page layouts becomes more and more important.  This section documents the tools that facilitate
these kinds of things.

@defproc[(number-all [list list?])
         (listof image?)]{

This takes in a list of images (i.e. puzzle cards), and numbers them starting from one.  It produces a list of the same images, each with its corresponding number now placed at the top right corner.                    

}
