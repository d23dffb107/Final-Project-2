public class SpaceInvader {
  private int x, y, speed;
  private PImage SI;

  public SpaceInvader(int x, int y, PImage SI) {
    this.x = x;
    this.y = y;
    speed = 2;
    this.SI = SI;
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }

  public void display() {
    image(SI, x, y);
    if (millis() <= 60000) {
      y += speed;
    }
  }
}

