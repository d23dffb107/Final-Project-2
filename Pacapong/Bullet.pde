public class Bullet {
  private int x, y, speed;

  public Bullet(int x, int y) {
    this.x = x;
    this.y = y;
    speed = 2;
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }

  public void display() {
    ellipse(x, y, 5, 5);
    y -= speed;
  }
}

