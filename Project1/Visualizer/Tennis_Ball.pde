class Tennis_Ball extends AABB {
  PImage img;
  float bounce =0;
  boolean grounded = false;
  float speed = 0;
  float initialVelocityy = random(425,645);
  
  float size = 64;
  float direction = random(-150,150);
  
  
  
  Tennis_Ball(){
  
  if (page !=3){
  img = loadImage("Tennis.png");
  setSize(size,size); 
  x=mouseX;
  y=mouseY;
  velocity.x = direction;
  }
  
}
@Override public void update(float dt) {
  
  
  speed += (0.5*G*sq(dt));
  velocity.y = speed;
  velocity.x = direction;
    y+=((velocity.y)-(initialVelocityy * dt));
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
