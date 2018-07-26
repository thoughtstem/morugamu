#lang racket

(provide tags-list
         id
         tag)

(define id first)
(define tag second)

(define (tags-list)
  '((Fantasy "Fantasy")
    (Political "Political")
    (Dice "Dice")
    (Cards "Cards")
    (Dark-Theme "Dark-Theme")
    (Kids "Kids")
    (Violent "Violent")
    (Comedy "Comedy")
    (Sports "Sports")
    (Sci-Fi "Sci-Fi")
    (Superheroes "Superheroes")
    (Pictureless "Pictureless")
    (Adult "Adult")
    (Electronic "Electronic")))