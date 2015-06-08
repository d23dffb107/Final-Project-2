public class Paddle {
  private color c;
  private int x, y, score;

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

  public color getColor() {
    return c;
  }

  public void addScore(int s) {
    score += s;
    if (score > 100) {
      score = 100;
    } else if (score < 0) {
      score = 0;
    }
  }

  public void display() {
    fill(c);
    rect(x, y, 20, 70);
    fill(255);
    if (x <= 142) {
      rect(375-score, 30, score*2, 5);
    } else if (x >= 658) {
      rect(425+score, 30, score*2, 5);
    }
  }
}

