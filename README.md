Pacapong

A combination of pong, pacman and space invaders. You control a paddle that shoots a pac-man to the other side. 
You have some control over how the pacman moves through the maze. Collect space invader icons to send space invaders on your opponent’s side. 
Collect small circles to shoot them upwards. Avoid ghosts. Collect big orbs and consume ghosts. 
Do good things (get circles, eat ghosts, shoot space invaders) and get points. 
Do bad things (touch space invaders, let pacman get through, touch ghosts, touch the barrels that donkey kong throws) and lose points. 
Have the most points at the end to win. Kinda complicated.

Road map of goals:
Pong:
1)	Players can control paddles with WASD and arrow keys (bounded within a certain area) Done
2)	Shoot a pacman at the other side. Done
3)	Collide with pacman and collect him. Done
4)	Timer and score bars at top. Semi-done
5)	Music. Done
PacMan:
1)	Make the maze and allow pacman to move through it. Pacman controllable with same keys as paddles. Check walls, cannot go backwards (as in opposite of direction he faces, not toward your side, possibly). Done
2)	Small orbs get collected and increase score. Done
3)	Ghosts that spawn (randomly?) and follow a specific path? Not sure what their AI entails. Colliding with them decreases score and gives pacman to opponent. Done.
4)	Big orbs make ghosts blue and eat-able for a certain period of time. Eating them increases score. Done.
5)	Space invaders icons. Spawn space invaders. Done.
Space Invaders
1)	Space invaders spawn from top and move down. Lose points if you touch them. Done.
2)	Small orbs also cause you to shoot them upwards (only shoots them if there are space invaders). Done.
3)	Pacman can collide with space invaders and destroy them, giving you points. Done.
Donkey Kong:
1)	Donkey Kong (randomly?) shows up and throws barrels. Pacman touching barrels gives pacman to opponent. Paddle touching barrels decreases score.

The first demo is in the branch "Demo1".
To play, use WASD to move the left paddle and the arrow keys to move the right paddle.

5/24/15:
	Pong(1) complete. (Ri Jiu)
5/26/15:
	Pong(2) and Pong(3) complete. Cannot control pacman; he only heads in the opposite direction. Also, he doesn't look right (he's just a circle). (Ri Jiu)
5/27/15:
	Fixed bug with PacMan not launching correctly. (Ri Jiu)
	Worked on map. (Brian)
5/28/15:
	PacMan looks kinda like Pac-Man. (Ri Jiu)
	Worked on map (Brian)
5/29/15:
	PacMan moves. Added timer. (Ri Jiu)
5/30/15:
	Displays map properly. No wall collisions yet. (Ri Jiu)
5/31/15:
	Bug fix: pacman will change y-coordinate when launched so it doesn't bump into a wall. Added file statement to make orbs white. (Ri Jiu)
6/1/15:
	Incorporated music in the background. Game still lags however. (Brian)
6/3/15:
	Took screenshot of map, so it doesn't keep drawing a map from the text file, which is laggy. (Brian)
6/4/15:
	The program creates an image of a map from the text file, so the map is editable and doesn't lag when it kept redrawing the map from the text file. (Ri Jiu)
6/5/15:
	PacMan will eat dots, not very accurate. (Brian)
	Started work on wall collisions. (Ri Jiu)
6/6/15:
	Wall collision works! But now we have to work on manual turns and timing. (Brian)
	Manual turns work. PacMan can spawn on either paddle. Score displayed with growing rectangle. Score increases by eating small orbs. (Ri Jiu)
6/7/15:
	Ghosts spawn every 15 seconds. Colliding PacMan with them causes you to lose points and give it to the other player. Score displayed by rectangle. (Ri Jiu)
6/8/15:
	Powerups spawn every 3 seconds (50% chance of big orb, no space invaders yet). Can eat ghosts if you ate a big orb in the last 2 seconds, giving you lots of points. (Ri Jiu)
6/9/15:
	Powerups only spawn on empty tiles. Space invader icons show up and can be eaten, but don't spawn space invaders yet. (Ri Jiu)
6/11/15:
	Worked on adding a buffer to movement so turning pacman isn't so finicky. (Brian)
	Bug fixes: Pacman will no longer be stuck in 4 specific spots if moving vertically. Dead ghosts can't kill Pacman. Pacman can't move after game ends. (Ri Jiu)
6/12/15:
	Finished the last command feature. (Brian)
	Can't kill dead ghosts again. Started work on Space Invaders part. Added necessary classes. (Ri Jiu)
6/13/15:
	Space invaders are spawn and if they collide with the paddle, that player loses points. No bullets yet. (Ri Jiu)
6/14/15:
	Bullets get shot if there are space invaders on your side. Hit detection between space invaders and pacman, and space invaders and bullets. Changes to speeds. (Ri Jiu) 
	Spawning of powerups isn't 50/50. Space invaders are favoured 2:1. (Ri Jiu)
	Made start screen and a postgame screen. (Brian)
