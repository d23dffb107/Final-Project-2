import java.util.*;
import ddf.minim.*;

private Paddle left, right;
private PacMan p;
private boolean keyUp, keyDown, keyLeft, keyRight, keyW, keyS, keyA, keyD;
private char[][] map;
private AudioPlayer player;
private Minim minim;
private PImage img;

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
  p = new PacMan(85, 225, left);
  //minim = new Minim(this);
  //player = minim.loadFile("Winter Night's Journey (Through The Storm).mp3", 2048);
  //player.play();
  img = loadImage("map.png");
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
    if (left.getY() >= 75) {
      left.move(0, -2);
    }
    p.setDirection(left, "UP");
  }
  if (keyS) {
    if (left.getY() <= 375) {
      left.move(0, 2);
    }
    p.setDirection(left, "DOWN");
  }
  if (keyA) {
    if (left.getX() >= 20) {
      left.move(-2, 0);
    }
  }
  if (keyD) {
    if (left.getX() <= 140) {
      left.move(2, 0);
    }
    p.setDirection(left, "RIGHT");
  }
  if (keyUp) {
    if (right.getY() >= 75) {
      right.move(0, -2);
    }
    p.setDirection(right, "UP");
  }
  if (keyDown) {
    if (right.getY() <= 375) {
      right.move(0, 2);
    }
    p.setDirection(right, "DOWN");
  }
  if (keyLeft) {
    if (right.getX() >= 660) {
      right.move(-2, 0);
    }
    p.setDirection(right, "LEFT");
  }
  if (keyRight) {
    if (right.getX() <= 780) {
      right.move(2, 0);
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

public void draw() {
  background(23, 32, 49);
  image(img, 400, 225);
  left.display();
  right.display();
  p.display();
  if (millis() <= 60000) {
    move();
  }
  fill(255, 255, 255);
  arc(400, 30, 20, 20, 3*HALF_PI, 3*HALF_PI + millis() * PI / 30000.0);
  arc(400, 30, 20, 20, 0, millis() * PI / 30000.0 - HALF_PI);
  if (p.getOwner() != left) {
    if (p.getX() - left.getX() <= 10 && p.getX() - left.getX() >= 0 && abs(p.getY() - left.getY()) <= 45) {
      p.setOwner(left);
    }
  } else if (p.getOwner() != right) {
    if (right.getX() - p.getX() <= 10 && right.getX() - p.getX() >= 0 && abs(p.getY() - right.getY()) <= 45) {
      p.setOwner(right);
    }
  }
  if (p.getX() >= 800) {
    p.setOwner(left);
  } else if (p.getX() <= 0) {
    p.setOwner(right);
  }
  if(p.getX() >= 166 && p.getX() <= 634){
    if(map[(p.getY()-50)/18][(p.getX()-166)/18] == 'o'){
      if((p.getY()-50)%18 < 2 && (p.getX()-166)%18 < 2){
        map[(p.getY()-50)/18][(p.getX()-166)/18] = ' ';
      }
    }
  }
  for (int y = 0; y < map.length; y++) {
    for (int x = 0; x < map[y].length; x++) {
      if (map[y][x] == 'o') {
        fill(255);
        ellipse(166 + 18 * x, 50 + 18 * y, 5, 5);
      }
    }
  }
}

