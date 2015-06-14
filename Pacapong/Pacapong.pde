import java.util.*;
import ddf.minim.*;

private Paddle left, right;
private PacMan p;
private boolean keyUp, keyDown, keyLeft, keyRight, keyW, keyS, keyA, keyD;
private char[][] map;
private AudioPlayer player;
private Minim minim;
private PImage img, smallSI, bigSI;
private ArrayList<Ghost> ghosts;
private ArrayList<int[]> emptyTiles;
private ArrayList<SpaceInvader> leftSI, rightSI;
private ArrayList<Bullet> leftB, rightB;
private int speed, numPowerUps;

public void setup() {
  size(800, 450);
  background(23, 32, 49);
  noStroke();
  rectMode(CENTER);
  ellipseMode(CENTER);
  imageMode(CENTER);
  map("map.txt");
  left = new Paddle(color(249, 187, 126), 75, 225);
  right = new Paddle(color(211, 105, 106), 725, 225);
  if (randomGaussian() < 0) {
    p = new PacMan(85, 225, left);
  } else {
    p = new PacMan(85, 225, right);
  }
  ghosts = new ArrayList<Ghost>();
  emptyTiles = new ArrayList<int[]>();
  leftSI = new ArrayList<SpaceInvader>();
  rightSI = new ArrayList<SpaceInvader>();
  leftB = new ArrayList<Bullet>();
  rightB = new ArrayList<Bullet>();
  speed = 3;
  spawnGhost();
  minim = new Minim(this);
  player = minim.loadFile("Winter Night's Journey (Through The Storm).mp3", 4096);
  player.play();
  img = loadImage("map.png");
  smallSI = loadImage("spaceInvadersSmall.png");
  bigSI = loadImage("spaceInvadersBig.png");
}

public void stop() {
  player.close();
  minim.stop();
  super.stop();
}

public void keyPressed() {
  if (keyCode == 38) {
    keyUp = true;
  }
  if (keyCode == 40) {
    keyDown = true;
  }
  if (keyCode == 37) {
    keyLeft = true;
  }
  if (keyCode == 39) {
    keyRight = true;
  }
  if (keyCode == 87) {
    keyW = true;
  }
  if (keyCode == 83) {
    keyS = true;
  }
  if (keyCode == 65) {
    keyA = true;
  }
  if (keyCode == 68) {
    keyD = true;
  }
}

public void keyReleased() {
  if (keyCode == 38) {
    keyUp = false;
  }
  if (keyCode == 40) {
    keyDown = false;
  }
  if (keyCode == 37) {
    keyLeft = false;
  }
  if (keyCode == 39) {
    keyRight = false;
  }
  if (keyCode == 87) {
    keyW = false;
  }
  if (keyCode == 83) {
    keyS = false;
  }
  if (keyCode == 65) {
    keyA = false;
  }
  if (keyCode == 68) {
    keyD = false;
  }
}

public void move() {
  if (keyW) {
    if (p.getOwner() == left) {
      p.setLast("UP");
    }
    if (left.getY() >= 75) {
      left.move(0, -speed);
    }
    if (p.getOwner() == left && p.getDirection().equals("RIGHT") && p.getX() >= 166 && p.getX() <= 617 && map[(p.getY()-50-18)/18][(p.getX()-166)/18] != '#' && (p.getX()-166)%18 == 0) {
      p.setDirection("UP");
    }
  }
  if (keyS) {
    if (p.getOwner() == left) {
      p.setLast("DOWN");
    }
    if (left.getY() <= 375) {
      left.move(0, speed);
    }
    if (p.getOwner() == left && p.getDirection().equals("RIGHT") && p.getX() >= 166 && p.getX() <= 617 && map[(p.getY()-50+18)/18][(p.getX()-166)/18] != '#' && (p.getX()-166)%18 == 0) {
      p.setDirection("DOWN");
    }
  }
  if (keyA) {
    if (left.getX() >= 20) {
      left.move(-speed, 0);
    }
  }
  if (keyD) {
    if (p.getOwner() == left) {
      p.setLast("RIGHT");
    }
    if (left.getX() <= 140) {
      left.move(speed, 0);
    }
    if (p.getOwner() == left && p.getX() >= 166 && p.getX() <= 617 && map[(p.getY()-50)/18][(p.getX()-166+18)/18] != '#' && (p.getY()-50)%18 == 0) {
      p.setDirection("RIGHT");
    }
  }
  if (keyUp) {
    if (p.getOwner() == right) {
      p.setLast("UP");
    }
    if (right.getY() >= 75) {
      right.move(0, -speed);
    }
    if (p.getOwner() == right && p.getDirection().equals("LEFT") && p.getX() >= 184 && p.getX() <= 635 && map[(p.getY()-50-18)/18][(p.getX()-166)/18] != '#' && (p.getX()-166)%18 == 0) {
      p.setDirection("UP");
    }
  }
  if (keyDown) {
    if (p.getOwner() == right) {
      p.setLast("DOWN");
    }
    if (right.getY() <= 375) {
      right.move(0, speed);
    }
    if (p.getOwner() == right && p.getDirection().equals("LEFT") && p.getX() >= 184 && p.getX() <= 635 && map[(p.getY()-50+18)/18][(p.getX()-166)/18] != '#' && (p.getX()-166)%18 == 0) {
      p.setDirection("DOWN");
    }
  }
  if (keyLeft) {
    if (p.getOwner() == right) {
      p.setLast("LEFT");
    }
    if (right.getX() >= 660) {
      right.move(-speed, 0);
    }
    if (p.getOwner() == right && p.getX() >= 184 && p.getX() <= 635 && map[(p.getY()-50)/18][(p.getX()-166-18)/18] != '#' && (p.getY()-50)%18 == 0) {
      p.setDirection("LEFT");
    }
  }
  if (keyRight) {
    if (right.getX() <= 780) {
      right.move(speed, 0);
    }
  }
}

public void map(String filename) {
  String[] data = loadStrings("map.txt");
  map = new char[data.length][data[0].length()];
  for (int x = 0; x < data.length; x++) {
    String line = data[x];
    for (int y = 0; y < line.length (); y++) {
      if (line.charAt(y) == ' ') {
        map[x][y] = 'o';
      } else {
        map[x][y] = line.charAt(y);
      }
    }
  }
  int startx = 166;
  int starty = 50;
  for (int y = 0; y < map.length; y++) {
    for (int x = 0; x < map[y].length; x++) {
      if (map[y][x] == '#') {
        fill(color(47, 93, 131));
        if (y > 0) {
          if (map[y - 1][x] == '#') {
            rect(startx + 18 * x, starty + 18 * y - 4, 10, 10);
          }
        }
        if (y < map.length - 1) {
          if (map[y + 1][x] == '#') {
            rect(startx + 18 * x, starty + 18 * y + 4, 10, 10);
          }
        }
        if (x > 0) {
          if (map[y][x - 1] == '#') {
            rect(startx + 18 * x - 4, starty + 18 * y, 10, 10);
          }
        }
        if (x < map[y].length - 1) {
          if (map[y][x + 1] == '#') {
            rect(startx + 18 * x + 4, starty + 18 * y, 10, 10);
          }
        }
        if (y > 0 && x > 0) {
          if (map[y - 1][x] == '#' && map[y][x - 1] == '#' && map[y - 1][x - 1] == '#') {
            rect(startx + 18 * x - 4, starty + 18 * y - 4, 10, 10);
          }
        }
        if (y < map.length - 1 && x < map[y].length - 1) {
          if (map[y + 1][x] == '#' && map[y][x + 1] == '#' && map[y + 1][x + 1] == '#') {
            rect(startx + 18 * x + 4, starty + 18 * y + 4, 10, 10);
          }
        }
        if (y > 0 && x < map[y].length - 1) {
          if (map[y - 1][x] == '#' && map[y][x + 1] == '#' && map[y - 1][x + 1] == '#') {
            rect(startx + 18 * x + 4, starty + 18 * y - 4, 10, 10);
          }
        }
        if (y < map.length - 1 && x > 0) {
          if (map[y + 1][x] == '#' && map[y][x - 1] == '#' && map[y + 1][x - 1] == '#') {
            rect(startx + 18 * x - 4, starty + 18 * y + 4, 10, 10);
          }
        }
        rect(startx + 18 * x, starty + 18 * y, 10, 10);
      }
    }
  }
  save("map.png");
}

public void spawnGhost() {
  int x;
  int y;
  do {
    x = int(random(25)) + 1;
    y = int(random(19)) + 1;
  }
  while (map[y][x] == '#');
  ArrayList<String> dirs = new ArrayList<String>();
  if (map[y-1][x] != '#') {
    dirs.add("UP");
  }
  if (map[y+1][x] != '#') {
    dirs.add("DOWN");
  }
  if (map[y][x-1] != '#') {
    dirs.add("LEFT");
  }
  if (map[y][x+1] != '#') {
    dirs.add("RIGHT");
  }
  ghosts.add(new Ghost(x*18+166, y*18+50, dirs.get((int)random(dirs.size()))));
}

public void checkStates() {
  if (p.getOwner() != left) {
    if (abs(p.getX() - left.getX()) <= 18 && abs(p.getY() - left.getY()) <= 53) {
      p.setOwner(left);
    }
  } else if (p.getOwner() != right) {
    if (abs(p.getX() - right.getX()) <= 18 && abs(p.getY() - right.getY()) <= 53) {
      p.setOwner(right);
    }
  }
  if (p.getX() >= 800) {
    p.setOwner(left);
    right.addScore(-10);
  } else if (p.getX() <= 0) {
    p.setOwner(right);
    left.addScore(-10);
  }

  if (p.getX() >= 166 && p.getX() <= 635) {
    if (map[(p.getY()-50)/18][(p.getX()-166)/18] == 'o') {
      if ((p.getY()-50)%18 < 2 && (p.getX()-166)%18 < 2) {
        map[(p.getY()-50)/18][(p.getX()-166)/18] = ' ';
        p.getOwner().addScore(1);
        emptyTiles.add(new int[] {
          (p.getY()-50)/18, (p.getX()-166)/18
        }
        );
        if (p.getOwner() == left && leftSI.size() > 0) {
          leftB.add(new Bullet(left));
        } else if (p.getOwner() == right && rightSI.size() > 0) {
          rightB.add(new Bullet(right));
        }
      }
    } else if (map[(p.getY()-50)/18][(p.getX()-166)/18] == 'O') {
      if ((p.getY()-50)%18 < 2 && (p.getX()-166)%18 < 2) {
        map[(p.getY()-50)/18][(p.getX()-166)/18] = ' ';
        for (Ghost g : ghosts) {
          g.makeWeak();
        }
        emptyTiles.add(new int[] {
          (p.getY()-50)/18, (p.getX()-166)/18
        }
        );
      }
    } else if (map[(p.getY()-50)/18][(p.getX()-166)/18] == 'S') {
      if ((p.getY()-50)%18 < 2 && (p.getX()-166)%18 < 2) {
        map[(p.getY()-50)/18][(p.getX()-166)/18] = ' ';
        emptyTiles.add(new int[] {
          (p.getY()-50)/18, (p.getX()-166)/18
        }
        );
        if (p.getOwner() == left) {          
          rightSI.add(new SpaceInvader(760 - int(random(90)), 12, bigSI));
        } else if (p.getOwner() == right) {
          leftSI.add(new SpaceInvader(40 + int(random(90)), 12, bigSI));
        }
      }
    }
  }

  for (Ghost g : ghosts) {
    if (abs(p.getX() - g.getX()) <= 3 && abs(p.getY() - g.getY()) <= 3) {
      if (g.isWeak()) {
        if ( g.kill()) {
          p.getOwner().addScore(10);
        }
      } else if (!g.isWeak()) {
        p.getOwner().addScore(-5);
        if (p.getOwner() == left) {
          p.setOwner(right);
        } else if (p.getOwner() == right) {
          p.setOwner(left);
        }
      }
    }
  }

  if ((p.getX()-166)%18 == 0 && (p.getY()-50)%18 == 0 && p.getX() >= 166 && p.getX() <= 634) {
    if (p.getX() <= 617 && map[(p.getY()-50)/18][(p.getX()-166+18)/18] != '#' && p.getLast().equals("RIGHT")) {
      p.setDirection("RIGHT");
    } else if (map[(p.getY()-50-18)/18][(p.getX()-166)/18] != '#' && p.getLast().equals("UP") && !p.getDirection().equals("DOWN")) {
      p.setDirection("UP");
    } else if (map[(p.getY()-50+18)/18][(p.getX()-166)/18] != '#' && p.getLast().equals("DOWN") && !p.getDirection().equals("UP")) {
      p.setDirection("DOWN");
    } else if (p.getX() >= 183 && map[(p.getY()-50)/18][(p.getX()-166-18)/18] != '#' && p.getLast().equals("LEFT")) {
      p.setDirection("LEFT");
    }
  }

  if ((p.getX()-166)%18 == 0 && (p.getY()-50)%18 == 0 && p.getX() >= 166 && p.getX() <= 634) {
    if (p.getX() <= 617 && map[(p.getY()-50)/18][(p.getX()-166+18)/18] != '#' && p.getLast().equals("RIGHT") && p.getOwner() == left) {
      p.setDirection("RIGHT");
    } else if (map[(p.getY()-50-18)/18][(p.getX()-166)/18] != '#' && p.getLast().equals("UP") && !p.getDirection().equals("DOWN")) {
      p.setDirection("UP");
    } else if (map[(p.getY()-50+18)/18][(p.getX()-166)/18] != '#' && p.getLast().equals("DOWN") && !p.getDirection().equals("UP")) {
      p.setDirection("DOWN");
    } else if (p.getX() >= 183 && map[(p.getY()-50)/18][(p.getX()-166-18)/18] != '#' && p.getLast().equals("LEFT") && p.getOwner() == right) {
      p.setDirection("LEFT");
    }
  }

  for (int i = 0; i < leftSI.size (); i++) {
    SpaceInvader s = leftSI.get(i);
    if (s.getY() >= 462 || (abs(s.getX() - left.getX()) <= 26 && abs(s.getY() - left.getY()) <= 47)) {
      left.addScore(-10);
      leftSI.remove(i);
      i--;
    }
    if (p.getX() <= 166) {
      if (abs(s.getX() - p.getX()) <= 24 && abs(s.getY() - p.getY()) <= 20) {
        p.getOwner().addScore(10);
        leftSI.remove(i);
        i--;
      }
    }
    if (leftB.size() > 0) {
      for (int b = 0; b < leftB.size (); b++) {
        if (abs(leftB.get(b).getX() - s.getX()) <= 18 && abs(leftB.get(b).getY() - s.getY()) <= 8) {
          left.addScore(10);
          leftSI.remove(i);
          i--;
          leftB.remove(b);
          b--;
          break;
        }
      }
    }
  }
  for (int i = 0; i < rightSI.size (); i++) {
    SpaceInvader s = rightSI.get(i);
    if (s.getY() >= 462 || (abs(s.getX() - right.getX()) <= 26 && abs(s.getY() - right.getY()) <= 47)) {
      right.addScore(-10);
      rightSI.remove(i);
      i--;
    }
    if (p.getX() >= 634) {
      if (abs(s.getX() - p.getX()) <= 24 && abs(s.getY() - p.getY()) <= 20) {
        p.getOwner().addScore(10);
        rightSI.remove(i);
        i--;
      }
    }
    if (rightB.size() > 0) {
      for (int b = 0; b < rightB.size (); b++) {
        if (abs(rightB.get(b).getX() - s.getX()) <= 18 && abs(rightB.get(b).getY() - s.getY()) <= 8) {
          right.addScore(10);
          rightSI.remove(i);
          i--;
          rightB.remove(b);
          b--;
          break;
        }
      }
    }
  }

  ArrayList<String> dirs = new ArrayList<String>();
  if (p.getDirection().equals("RIGHT") && (p.getX()-166)%18 == 0 && p.getX() >= 166 && p.getX() <= 617 && map[(p.getY()-50)/18][(p.getX()-166+18)/18] == '#') {
    if (p.getLast().equals("UP") && map[(p.getY()-50-18)/18][(p.getX()-166)/18] != '#') {
      p.setDirection("UP");
    } else if (p.getLast().equals("DOWN") && map[(p.getY()-50+18)/18][(p.getX()-166)/18] != '#') {
      p.setDirection("DOWN");
    } else {
      if (map[(p.getY()-50-18)/18][(p.getX()-166)/18] != '#') {
        dirs.add("UP");
      }
      if (map[(p.getY()-50+18)/18][(p.getX()-166)/18] != '#') {
        dirs.add("DOWN");
      }
      p.setDirection(dirs.get((int)random(dirs.size())));
    }
  }
  if (p.getDirection().equals("LEFT") && (p.getX()-166)%18 == 0 && p.getX() >= 184 && p.getX() <= 635 && map[(p.getY()-50)/18][(p.getX()-166-18)/18] == '#') {
    if (p.getLast().equals("UP") && map[(p.getY()-50-18)/18][(p.getX()-166)/18] != '#') {
      p.setDirection("UP");
    } else if (p.getLast().equals("DOWN") && map[(p.getY()-50+18)/18][(p.getX()-166)/18] != '#') {
      p.setDirection("DOWN");
    } else {
      if (map[(p.getY()-50-18)/18][(p.getX()-166)/18] != '#') {
        dirs.add("UP");
      }
      if (map[(p.getY()-50+18)/18][(p.getX()-166)/18] != '#') {
        dirs.add("DOWN");
      }
      p.setDirection(dirs.get((int)random(dirs.size())));
    }
  }
  if (p.getDirection().equals("UP") && (p.getY()-50)%18 == 0 && p.getX() >= 166 && p.getX() <= 635 && map[(p.getY()-50-18)/18][(p.getX()-166)/18] == '#') {
    if (p.getOwner() == left) {
      if (map[(p.getY()-50)/18][(p.getX()-166+18)/18] != '#') {
        p.setDirection("RIGHT");
      } else {
        p.setDirection("DOWN");
      }
    } else {
      if (map[(p.getY()-50)/18][(p.getX()-166-18)/18] != '#') {
        p.setDirection("LEFT");
      } else {
        p.setDirection("DOWN");
      }
    }
  }
  if (p.getDirection().equals("DOWN") && (p.getY()-50)%18 == 0 && p.getX() >= 166 && p.getX() <= 635 && map[(p.getY()-50+18)/18][(p.getX()-166)/18] == '#') {
    if (p.getOwner() == left) {
      if (map[(p.getY()-50)/18][(p.getX()-166+18)/18] != '#') {
        p.setDirection("RIGHT");
      } else {
        p.setDirection("UP");
      }
    } else if (p.getOwner() == right) {
      if (map[(p.getY()-50)/18][(p.getX()-166-18)/18] != '#') {
        p.setDirection("LEFT");
      } else {
        p.setDirection("UP");
      }
    }
  }

  for (Ghost g : ghosts) {
    dirs.clear();
    if (g.getDirection().equals("LEFT") && g.getX() == 166) {
      g.setDirection("RIGHT");
    } else if (g.getDirection().equals("RIGHT") && g.getX() == 634) {
      g.setDirection("LEFT");
    } else {
      if (g.getDirection().equals("RIGHT") && (g.getX()-166)%18 == 0) {
        if ((map[(g.getY()-50)/18][(g.getX()-166+18)/18] != '#')) {
          dirs.add("RIGHT");
        }
        if (map[(g.getY()-50-18)/18][(g.getX()-166)/18] != '#') {
          dirs.add("UP");
        } 
        if (map[(g.getY()-50+18)/18][(g.getX()-166)/18] != '#') {
          dirs.add("DOWN");
        }
        g.setDirection(dirs.get(int(random(dirs.size()))));
      }
      if (g.getDirection().equals("LEFT") && (g.getX()-166)%18 == 0) {
        if (map[(g.getY()-50)/18][(g.getX()-166-18)/18] != '#') {
          dirs.add("LEFT");
        }
        if (map[(g.getY()-50-18)/18][(g.getX()-166)/18] != '#') {
          dirs.add("UP");
        } 
        if (map[(g.getY()-50+18)/18][(g.getX()-166)/18] != '#') {
          dirs.add("DOWN");
        }
        g.setDirection(dirs.get(int(random(dirs.size()))));
      }
      if (g.getDirection().equals("UP") && (g.getY()-50)%18 == 0) {
        if (map[(g.getY()-50-18)/18][(g.getX()-166)/18] != '#') {
          dirs.add("UP");
        }
        if (map[(g.getY()-50)/18][(g.getX()-166-18)/18] != '#') {
          dirs.add("LEFT");
        }
        if (map[(g.getY()-50)/18][(g.getX()-166+18)/18] != '#') {
          dirs.add("RIGHT");
        }
        g.setDirection(dirs.get(int(random(dirs.size()))));
      }
      if (g.getDirection().equals("DOWN") && (g.getY()-50)%18 == 0) {
        if (map[(g.getY()-50+18)/18][(g.getX()-166)/18] != '#') {
          dirs.add("DOWN");
        }
        if (map[(g.getY()-50)/18][(g.getX()-166-18)/18] != '#') {
          dirs.add("LEFT");
        }
        if (map[(g.getY()-50)/18][(g.getX()-166+18)/18] != '#') {
          dirs.add("RIGHT");
        }
        g.setDirection(dirs.get(int(random(dirs.size()))));
      }
    }
  }
}


public void draw() {
  background(23, 32, 49);
  image(img, 400, 225);
  fill(255, 255, 255);
  arc(400, 30, 20, 20, 3*HALF_PI, 3*HALF_PI + millis() * PI / 30000.0);
  arc(400, 30, 20, 20, 0, millis() * PI / 30000.0 - HALF_PI);
  for (int y = 0; y < map.length; y++) {
    for (int x = 0; x < map[y].length; x++) 
      if (map[y][x] == 'o') {
        ellipse(166 + 18 * x, 50 + 18 * y, 5, 5);
      } else if (map[y][x] == 'O') {
        ellipse(166 + 18 * x, 50 + 18 * y, 10, 10);
      } else if (map[y][x] == 'S') {
        image(smallSI, 166 + 18 * x, 50 + 18 * y);
      }
  }

  left.display();
  right.display();
  p.display();
  for (Ghost g : ghosts) {
    g.display();
  }
  for (SpaceInvader s : leftSI) {
    s.display();
  }
  for (SpaceInvader s : rightSI) {
    s.display();
  }
  for (int b = 0; b < leftB.size (); b++) {
    if (leftB.get(b).getY() >= -3) {
      leftB.get(b).display();
    } else {
      leftB.remove(b);
      b--;
    }
  }
  for (int b = 0; b < rightB.size (); b++) {
    if (rightB.get(b).getY() >= -3) {
      rightB.get(b).display();
    } else {
      rightB.remove(b);
      b--;
    }
  }
  if (millis() <= 60000) {
    move();
    checkStates();
    if (ghosts.size() <= millis() / 15000) {
      spawnGhost();
    }
    if (numPowerUps < millis() / 3000) {
      int x, y;
      if (emptyTiles.size() > 0) {
        int[] xy = emptyTiles.remove(int(random(emptyTiles.size())));
        x = xy[1];
        y = xy[0];
      } else {
        do {
          x = int(random(25)) + 1;
          y = int(random(19)) + 1;
        }
        while (map[y][x] == '#');
      }
      if (int(random(3)) == 0) {
        map[y][x] = 'O';
      } else {
        map[y][x] = 'S';
      }
      numPowerUps++;
    }
  }
}

