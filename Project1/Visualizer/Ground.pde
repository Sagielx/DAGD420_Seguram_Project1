class Ground extends AABB{
  
   Ground(){
  
  
  
  setSize(width,50); 
  x=halfW;
  y=1030;
  
  
  
}


 void draw() {
    fill(165,42,42);

    rect(x-halfW, y-halfH, halfW*2, halfH*2);
    noFill();
    calcEdges();
    
  }

}
