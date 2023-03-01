class Bowling_Ball extends AABB {
  PImage img;
  
  boolean grounded = false;
  float speed = 0;
  float initialVelocityy = random(425,645);
  float weight =5;
  float size = 64;
  float direction = random(-150,150);
 
  
  
  Bowling_Ball(){
  
  if(page != 3){
  img = loadImage("Bowling.png");
  setSize(size,size); 
  x=mouseX;
  y=mouseY;
  velocity.x = direction;
  }
  
}
@Override public void update(float dt) {
  
  if(!grounded) speed += (0.5*G*sq(dt));
  if(!grounded)velocity.y = speed;
  velocity.x = direction;
    if(!grounded) y+=((velocity.y)-(initialVelocityy * dt));
    x+=velocity.x*dt;
    
    calcEdges();
    if(x>width||x<0) isDead = true;
    
    
  }

void draw(){
  noStroke();
  pushMatrix();
  translate(x-size-(size/2),y-size-(size/2));
  image(img, size, size);
 
  popMatrix();
  noFill();
  

}

}
