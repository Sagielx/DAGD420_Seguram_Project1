public class Mouse extends AABB {
  
  public Mouse(){
    x = mouseX;
    y = mouseY;
    setSize(5,5);
    
    
  }
  
 
@Override public void update(float dt){
  x = mouseX;
  y = mouseY;
  calcEdges();
}
}
