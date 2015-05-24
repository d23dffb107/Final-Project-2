public class Paddle {
  private color c;
  private int x, y;

  public Paddle(color c, int x, int y) {
    this.c = c;
    this.x = x;
    this.y = y;
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }

  public void move(int x, int y) {
    this.x += x;
    this.y += y;
  }

  public void draw() {
    rectMode(CENTER);
    fill(c);
    rect(x, y, 20, 70);
  }
}

