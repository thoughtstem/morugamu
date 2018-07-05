#lang scribble/manual

@require[racket/list]

@title{Morugamu Game Rules}

Game rules and modes

CONTENTS

Puzzle cards (Easy, Medium, Hard)

Rules

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
          

