#lang racket

(define board-game-list
  (list "Vanguard of War"
        "Era of Kingdoms"
        "Reign Ed"
        "The Game of Crimps"
        "Game to Pick a Game"
        "Crown of Aragon"
        "Darkness Incarnate"
        "Absolutism"
        "Startropolis"
        "Miremarsh"
        "MYTH"
        "Dinosaur Island"
        "Trogdor"
        "Jetpack Joyride"
        "Shady Agents"
        "Wreck Raiders"
        "Over the Edge"
        "Rurik Dawn of Kiev"
        "SPQF"
        "Demon City"
        "Dark Matter"
        "HeartBeat Pride Dice"
        "Bat Cup"
        "Dragon Realms"
        "Nunami"
        "The Acts Board Game"
        "The Villagers"
        "Infinity D4"
        "Thug Life"
        "John Silence"
        "Rise of the Necromancers"
        "Paradox"
        "Exile Sun"
        "Monster Derby"
        "Cosmic Balance"
        "Guilds of Cadwallon"
        "Rivet Wars"
        "4 the Birds"
        "Fireteam Zero 3"
        "Evolution:CLIMATE 2"
        "BatmanTM Gotham City Chronicles"
        "Zombicide: Black Plague"
        "Shadows of Brimstone"
        "Tudor"
        "Kitchen Rush: Piece of Cake"
        "Eclipse: Second Dawn for the Galaxy"
        "Space: 1889"
        "THE FANTASY TRIP"
        "Snag the Flag"
        "Unicorns and Zombies"
        "Play Trumps Politics"
        "Manipulate"
        "Drunk In The Trunk"
        "No Pun Included"
        "Ian Brodys Quartermaster General"
        "Sorcerer City"
        "Transit City"
        "Hellboy"
        "Deus Lo Vult"
        "Soccer City"
        "Coding Farmers"
        "Inequality opoly"
        "Immortality"
        "Lunarchitects"
        "The Island Of El Dorado"
        "Trogdor"
        "Sword and Sorcery"
        "Tiki"
        "Apocalypse Galactic Arena"
        "Bellum of Mutants and Men"
        "Gloomhaven"
        "MourneQuest"
        "Galaxy Defenders"))

(define money-asked 
  (list 2 0.8 3.5 0.85 0.8 0.75 5 1.5 1 5.9
	4 2.3 7.5 0.8 16.58 0.76 5 5 1 2.3 
	2.5 3 1.9 0.78 5.27 0.4 0.13 1 5 1
	4.2 2.6 1.8 1 3 0.5 2.5 1.1 3 2
	50 12.5 3 1 2 15 2.2 2 0.6 1.2
	1 1.9 0.1 0.5 2.6 3 0.9 13.1 3 2.9 0.6 1.7
	0.19 3 2 7.5 7.5 1.5 0.8 0.8 3.8 2.8 4
))

(define money-received
  (list 12.3 0.85 2.1 0.28 1.8 0.19 0 0.39 3.69 9.9
	92.6 204.5 46.2 8.19 17.7 4.5 8 7.14 2 3.45 
	1.3 7.8 2.8 0.72 1.16 0.27 1 0.9 0.97 0.39
	6.6 4.6 2.3 1 3.5 11.7 58.2 1.7 20.7 33.7
	440.3 407.9 134.1 10.8 8.2 59.7 10.8 4.3 0.3 0.4 
	0.0002 2.1 0.062 1.5 4.3 21.9 0.2 190.6 0.7 3.3 0.8 0.1
	3 4 29.2 71.3 51.7 3.8 1.1 0.1 6.5 3 25.9
))