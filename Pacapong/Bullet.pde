public class Bullet {
  private int x, y, speed;

  public Bullet(Paddle owner) {
    this.x = owner.getX();
    this.y = owner.getY() - 35;
    speed = 3;
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }

  public void display() {
    fill(255);
    ellipse(x, y, 5, 5);
    if (millis() <= 60000) {
      y -= speed;
    }
  }
}

