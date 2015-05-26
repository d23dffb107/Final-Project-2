private Paddle left, right;
private PacMan p;
private boolean keyUp, keyDown, keyLeft, keyRight, keyW, keyS, keyA, keyD;

public void setup() {
  size(800, 450);
  background(23, 32, 49);
  left = new Paddle(color(249, 187, 126), 75, 225);
  right = new Paddle(color(211, 105, 106), 725, 225);
  p = new PacMan(75,225,-1);
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

public void draw() {
  background(23, 32, 49);
  left.display();
  right.display();
  p.display();
  if (keyW && left.getY() >= 75) {
    left.move(0, -2);
  }
  if (keyS && left.getY() <= 375) {
    left.move(0, 2);
  }
  if (keyA && left.getX() >= 20) {
    left.move(-2, 0);
  }
  if (keyD && left.getX() <= 140) {
    left.move(2, 0);
  }
  if (keyUp && right.getY() >= 75) {
    right.move(0, -2);
  }
  if (keyDown && right.getY() <= 375) {
    right.move(0, 2);
  }
  if (keyLeft && right.getX() >= 660) {
    right.move(-2, 0);
  }
  if (keyRight && right.getX() <= 780) {
    right.move(2, 0);
  }
}

