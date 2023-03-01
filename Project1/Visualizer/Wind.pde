public class Wind extends AABB {
  
  public Wind(){
   
   setSize(300,75);
    
    
    
  }
 void draw(){
    x = mouseX;
    y = mouseY;
    noFill();
    stroke(0);
    //if(page == 2) rect(x-halfW, y-halfH, halfW*2, halfH*2);
    noStroke();
    calcEdges();
  
  }
@Override public void update(float dt){
 
  
}
}

public class Windline{
    float x;
    float y1, y2, y;
    float speed;
    int timer = 8;
    boolean isDead;
    
  
  
  public Windline(float x, float y1, float y2, float speed){
    this.x = x;
    this.y1 = y1;
    this.y2 = y2;
    this.speed = speed;
    y = random(y1,y2);
  }
 
  
  void draw(){
    stroke(255);
    strokeWeight(10);
    line(x-random(25,75), y, x+random(25,75), y) ;
    noStroke();
    strokeWeight(0);
  }
  
  void update(){
    x+=speed;
    timer--;
    if (timer<=0) isDead=true;
  }
}
  
