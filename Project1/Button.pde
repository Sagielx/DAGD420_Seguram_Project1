 class Button{
  
  float x,y; //position
  float w,h; //size
  boolean rectOver; //is the button selected / on? true/false
  color rectHighlight, rectColor, currentColor;
  String label; 
  
 
 
 
 
 
 
 
 Button(float x, float y, float w, float h, String label, color rectColor, color rectHighlight){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    this.rectColor = rectColor;
    this.rectHighlight = rectHighlight;
   

  }
  void d() {
  u(mouseX, mouseY);
 
  
  if (rectOver) {
    fill(rectHighlight);
  } else {
    fill(rectColor);
  }
  stroke(255);
  rect(x, y, w, h);
  
  
  }
  
  

 void u(float x, float y) {
  if (overRect(x, y, w, h) ) {
    rectOver = true;
    
  }
}

boolean overRect(float x, float y, float w, float h)  {
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
        
    return true;
  } else {
    return false;
  }
}

void mousePressed() {
  if (rectOver) {
    currentColor = rectHighlight;
  }
}
  
  
} //end
