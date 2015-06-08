public class Ghost {
  private int x, y;
  private String direction;
  private int time;
  private boolean weak, dead;

  public Ghost(int x, int y, String direction) {
    this.x = x;
    this.y = y;
    this.direction = direction;
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }

  public String getDirection() {
    return direction;
  }

  public void setDirection(String direction) {
    this.direction = direction;
  }

  public void makeWeak() {
    weak = true;
    time = millis();
  }

  public boolean isWeak(){
    return weak; 
  }

  public void kill() {
    dead = true;
  }

  public void display() {
    if(millis() - time >= 2000){
      weak = false; 
    }
    if (!dead) {
      if ((millis()/50)%2 == 0) {
        if (!weak) {
          image(loadImage("ghost1normal.png"), x, y);
        } else {
          image(loadImage("ghost1weak.png"), x, y);
        }
      } else {
        if (!weak) {
          image(loadImage("ghost2normal.png"), x, y);
        } else {
          image(loadImage("ghost2weak.png"), x, y);
        }
      }

      if (millis() <= 60000) {
        if (direction.equals("RIGHT")) {
          x += 2;
        } else if (direction.equals("LEFT")) {
          x -= 2;
        } else if (direction.equals("UP")) {
          y -= 2;
        } else if (direction.equals("DOWN")) {
          y += 2;
        }
      }
    }
  }
}
