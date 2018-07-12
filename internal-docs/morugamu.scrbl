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
          @item{Interpreter      = Metarules}
]

(Side note: this programming language is roughly isomorphic to the Lisp-family language called Scheme.  There are just a couple of small differences: the use of icons, and the patternmatching rules.) 

This repository separates some of the above concerns into different files. (This will definitely change as the repository grows.)

@itemlist[
          @item{How things look: see the "themes" folder}
          @item{Library definitions: see files like boolean-algebra-cards.rkt in the top-level folder}
          @item{Puzzles: see the "puzzles" folder}
]


@section{Defining new Functions (Rule Cards)}

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

(TODO: What to import?)

@racketblock[
  (rule-card (rule '(S 0) '1)
             (rule '(S 1) '2))
]

This would create this rule card:

**** COming soon... ****

Note that each of the four unique symbols above would need to be defined before this rule card can be constructed:

@racketblock[
  (define-tile the-successor  'S (circle 40 "solid" "black"))
  (define-tile the-0  '0 (circle 40 "solid" "red"))
  (define-tile the-1  '1 (circle 40 "solid" "orange"))
  (define-tile the-2  '2 (circle 40 "solid" "yellow"))
]


Usually, you'll not need to specify images this way, though.  Most rule cards are part of a set of rules that define some kind of mathematically interesting system (e.g. boolean algebra or arithmetic).  These
cards will often share the same symbols and theme.  Such sets of cards (or "libraries" if you prefer the programming language terminology) are defined in files like boolean-algebra-cards.rkt.

The convention in these files is to export a render function that takes a theme and returns a list of images (a printable symbol sheet and printable rule cards).  The theme can be easily changed as we explore different art styles for the game.

Here's the current documentation for the existing libraries:


@subsection{Boolean Algebra}

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

This takes in a theme (TODO: Define what a theme is), and produces a list of images of rule cards and symbols.  The symbols are the first thing in the list and they are arranged in a table to facilitate printing.  The rule cards follow the symbol page.  There may be 1 or more rule cards, depending on the particular algebra being rendered.

TODO: Give an example of the output...

}

@defproc[(number-all [lst list?])
         (listof image?)]{

This takes in a list of images (i.e. puzzle cards), and numbers them starting from one.  It produces a list of the same images, each with its corresponding number now placed at the top right corner.                    

}

@defproc[(place-num [list list?])
         (images?)]{

This takes in a list of images and their corresponding numbers and produces the images with their corresponding numbers placed over them. The function takes a number and converts it into a string that is then placed over the image.

}


@subsection{Clock Numbers}

**** Coming soon... ****

@subsection{Lists}

**** Coming soon... ****

@subsection{Clock++ Numbers}

**** Coming soon... ****





