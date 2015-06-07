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
3)	Ghosts that spawn (randomly?) and follow a specific path? Not sure what their AI entails. Colliding with them decreases score and gives pacman to opponent.
4)	Big orbs make ghosts blue and eat-able for a certain period of time. Eating them increases score.
5)	Space invaders icons. Spawn space invaders.
Space Invaders
1)	Space invaders spawn from top and move down. Lose points if you touch them.
2)	Small orbs also cause you to shoot them upwards (only shoots them if there are space invaders).
3)	Pacman can collide with space invaders and destroy them, giving you points.
Donkey Kong:
1)	Donkey Kong (randomly?) shows up and throws barrels. Pacman touching barrels gives pacman to opponent. Paddle touching barrels decreases score.

The first demo is in the branch "Demo1".
To play, use WASD to move the left paddle and the arrow keys to move the right paddle.

5/24/15:
	Pong(1) complete. (Ri Jiu)
5/26/15:
	Pong(2) and Pong(3) complete. Cannot control pacman; he only heads in the opposite direction. Also, he doesn't look right (he's just a circle). (Ri Jiu)

5/28/15:
	PacMan looks kinda like Pac-Man. (Ri Jiu)
	Worked on map (Brian)
5/29/15:
	PacMan moves. (Ri Jiu)
	Added timer. (Ri Jiu)
5/30/15:
	Displays map properly. No wall collisions yet. (Ri Jiu)
5/31/15:
	Incorporated music in the background. Game still lags however. (Brian)
6/6/15:
	Wall collision works! But now we have to work on manual turns and timing. (Brian)
	Manual turns work. PacMan can spawn on either paddle. Score displayed with growing rectangle. Score increases by eating small orbs. (Ri Jiu)
