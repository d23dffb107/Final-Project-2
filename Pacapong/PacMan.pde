public class PacMan {
  private int x, y, mode, time;

  public PacMan(int x, int y, int mode) {
    this.x = x;
    this.y = y;
    this.mode = mode;
  }

  public int getMode() {
    return mode;
  }

  public void display() {
    ellipseMode(CENTER);
    if (mode == -1) {
      fill(color(249, 187, 126));
    } else if (mode == 1) {
      fill(color(211, 105, 106));
    }
    ellipse(x, y, 10, 10);
  }
}

