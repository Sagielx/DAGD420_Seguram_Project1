
Button b; // Button(float x, float y, float w, float h, String label, color rectColor, color rectHighlight)
void setup(){
  size(1280,720);
  background(255);
  colorMode(HSB, 360, 100, 100);
  
 
  
}

void draw(){
  background(255);
  control();
  
  
}

void control(){
  fill(0, 0, 100);
  rect(930,50,300,620);
  fill(0);
  stroke(0);
  textSize(24);
  text("Settings", 1030, 90);
  b = new Button(200,200,200,200,"test", color(0,0,30), color(0, 0, 50));
  b.d();
  //println(b.x,b.y,b.x+b.w,b.y+b.h);
  //println(mouseX, mouseY);
  //println(b.rectOver);

  
   
}
