public class Dots{
  private int x,y;
  private boolean draw;
  
  public Dots(int x, int y){
      this.x = x;
      this.y = y;
      draw = true;
  }
  
  public void display(){
    fill(255);
    if(draw){
      ellipse(x,y,5,5);
    }
  }
  
  public void eat(){
    draw = false;
  }
}
