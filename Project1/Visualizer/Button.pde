class Button extends AABB{
  
  
  Button(float xPos, float yPos, float W, float H){
     x=xPos;
     y=yPos;
    setSize(W,H);
  }
  void draw() {
    
    strokeWeight(10);
    
    strokeJoin(ROUND);
    rect(x-halfW, y-halfH, halfW*2, halfH*2);
    strokeJoin(SQUARE);
    noFill();
    calcEdges();

  }
}
