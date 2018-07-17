#lang scribble/manual

@require[racket/list]

@title{Morugamu Game Rules}

Game rules and modes

CONTENTS

Puzzle cards (Easy, Medium, Hard)(Like the one pictured below)

@image["./puzzle-example.png"]

Rule Cards(like the one picture below)
@require[
         (prefix-in bool: "../rule-systems/boolean-algebra-cards.rkt")]
@require[
         (prefix-in bool: "../themes/emoji-boolean-algebra.rkt")]
@define[ba-cards (bool:render bool:theme)]
@second[ba-cards]

Game Tiles

@section{Codeoff}

2-4 Players
Goal of Codeoff is to finish the puzzle before your opponents.

SET UP

@itemlist[
          @item{ Shuffle tiles}
          @item{ Choose desired puzzle cards difficulty then shuffle}
          @item{ Draw one puzzle card}]

RULES

PHASE 1: Building the Puzzle
 @itemlist[
           @item{Draw three tiles per turn}
           @item{Discard tiles not needed withhin your puzzle (cannot "hold on" to tiles that are not needed on your current turn)}
           @item{Place tiles in the order that the puzzle depicts}
           @item{Your turn ends and play moves on to next player in the circle}
           @item{Optional Rule 1: Shuffle draw tiles every other turn}
           @item{Optional Rule 2: Instead of drawing three tiles during your turn, steal one of the opponents tiles}]
           
Once you have a completed puzzle, move on to phase 2.

PHASE 2: Solving the Puzzle

 Pick up 3 tiles. If any of the tiles match a transformation in your puzzle, make one transformation and discard the other two tiles (also return transformation tiles to the draw pile and only keep the output). Only make one transformation per turn.
 Execute transformations until the puzzle is solved (while drawing the necessary tile needed to excute transformation). When puzzle is complete, the player with the finished puzzle is the winner!
 
@section{Reverse Codeoff}
 2 Players

Goal of Reverse Codeoff is to find the order of the transformations to get the output before your opponent.

@itemlist[
          @item{Choose puzzle card difficulty}
           @item{shuffle puzzle cards}
           @item{both players draw one puzzle cards (don't let your opponent see the puzzle card}
           @item{gather tiles needed to complete the puzzle}
           @item{Trade tiles with other player (without showing the puzzle to the opposing player}
           @item{show the other player what the output should be}
           @item{build the transformations that will give the predetermined output shown}
           @item{Whichever player first builds transformations which use all the given tiles and results in the correct output is the winner}
 ]
          
@section{Code Attack}

2-4 Players

The objective of the game is to elimate opponnets health be completeing transformations and using the result as an attack.

RULES OF CODE ATTACK


@itemlist[
          @item{SET UP: Place draw tiles face down in the middle and shuffle. All players take one board}
          @item{Everyone draws five tiles}
          @item{Agree upon the damage values and abilities of each of the transformation outputs (EX. some outputs can heal, some can shield, etc)}
          @item{Youngest player goes first}]

GAMEPLAY

@itemlist[
          @item{On each players turn, you can do one of three things}
          @item{1) Play a tile from your hand onto your board and replace it with another from the draw pile}
          @item{2) Replace all five tiles in your hand with new ones from the draw pile}
          @item{3) Complete a transformation and perform the action of the output (Damage other player, heal/shield self, etc.)}
          @item{You must use paranthesis to comeplete your transformation or it will not be considered complete}
          @item{The last player with health remaining is the winner}]

DO'S AND DONT'S

@itemlist[
          @item{Once a tile is placed onto your board, you cannot move it to a different location}
          @item{If you mess up and cannot finish a transformation within the remaining space on your board, you can discard the entire line to the draw pile and restart}
          @item{Be sure to keep five tiles in your hand at all times}
          @item{To be a valid transformation, it must exactly match the example on the rule card}]