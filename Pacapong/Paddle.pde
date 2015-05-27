public class Paddle {
  private color c;
  private int x, y;
  private int timer;

  public Paddle(color c, int x, int y) {
    this.c = c;
    this.x = x;
    this.y = y;
    timer = 0;
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

  public color getColor() {
    return c;
  }

  public void display() {
    fill(c);
    rect(x, y, 20, 70);
    timer++;
  }
}

