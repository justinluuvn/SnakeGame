# ------------------------------------------------MATLAB SNAKE GAME PROJECT------------------------------------------------------------------ 

This project is using Matlab to create a Snake Game with the following features:
	- 	The game features a 20x20 grids for the snake to move within.
	- 	For each level, the snake will always start with a size of ten grid and a prey is created at
		the center of the screen.
	- 	Each time the snake gets to eat the prey, a new prey is created randomly in the map and
		the snake body is lengthen by one grid.
	- 	Every level has requirement needed to level up. Based on which level the player is in, the
		requirement can vary from simply achieving a certain body length to finishing the level
		within a limited given amount of time (time-attack feature).
	- 	There is a total of seventy levels. Of which, the first 11 levels (0 -> 10), no time limit is set,
		but the speed of the snake gradually increases. Then starting from level 11, the player
		must rush to finish the level before time runs out. Once you finish the last level, you win
		the game.
	- 	The game is over under either of the two following conditions:
		▪ 	The player mistakenly controls the snake to bite itself (including turning around).
		▪ 	The player fails to finish the level within the given time limit (for time-attack level).

Table of content

1. Confiuration
2. Installation
3. Operation
4. Manifest
5. Copyright and License
6. Contact Information

1. Configuration
	This project requires Matlab application in order to run.  
2. Installation
	a) Open the Matlab application.
	b) Run the project by running the script "snake_game.m".
3. Operation	
	Using the navigation buttons on the keyboard to control the snake to eat prey and to reach the gate for each level. More information is provided in
	the pdf file.
4. Manifest (list of files and short description of their roles)
	a) snake_game.m
		This file is the main file taking care of initialization and general execution of the game.
	b) snake_move.m
		This file takes care of direction and control of the snake movement.
	c) display_snake.m
		This file is responsible for displaying the snake according to its coordination.
	d) display_detail.m
		This file focuses on displaying time, level, score and some other detail of the game.
	e) bypass.m
		This file implements new prey after consumption of the previous one.
5. Copyright and License
	Matlab are trademark of the MathWorks.
	Other trademarks and trade names are those of their respective owners.
	The person mentioned in the contact information content has the copyright and license for the code.		
6. Contact Information
	Tin Luu,
	Department of Information Technology
	Vaasa University of Applied Sciences
	Wolffintie 30, Vaasa, Finland
	Home: http://www.cc.puv.fi/~e1700674
	Email: e1700674(at)edu.vamk.fi