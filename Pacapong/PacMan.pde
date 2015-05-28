public class PacMan {
  private int x, y, time;
  private Paddle owner;

  public PacMan(int x, int y, Paddle owner) {
    this.x = x;
    this.y = y;
    this.owner = owner;
    time = millis();
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }

  public Paddle getOwner() {
    return owner;
  }

  public void setOwner(Paddle owner) {
    this.owner = owner;
    time = millis();
  }

  public void display() {
    fill(owner.getColor());
    arc(x, y, 20, 20, 0, TWO_PI);
<<<<<<< HEAD
    if (millis() >= time + 1000) {
=======
    if (millis() > time) {
>>>>>>> brian
      if (owner.getX() < 150) {
        x += 2;
      } else if (owner.getX() > 650) {
        x -= 2;
      }
    } else {
      if (owner.getX() < 150) {
        x = owner.getX() + 10;
      } else if (owner.getX() > 650) {
        x = owner.getX() - 10;
      }
      y = owner.getY();
    }
  }
}

