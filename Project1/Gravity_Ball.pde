class Gravity_Ball extends AABB {
  float bounce =0;
  boolean grounded = false;
  float speed = 0;
  float initialVelocityy = random(425,645);
  
  float size = random(20,50);
  float direction = random(-150,150);
  private float r = random(0,255);
  private float g = random(0,255);
  private float b = random(0,255);
  
  
  Gravity_Ball(){
  
  
  
  setSize(size,size); 
  x=mouseX;
  y=mouseY;
  velocity.x = direction;
  
  
}
@Override public void update(float dt) {
  
  
  speed += (0.5*G*sq(dt));
  velocity.y = speed;
  velocity.x = direction;
    y+=((velocity.y)-(initialVelocityy * dt)+(bounce*dt));
    x+=velocity.x*dt;
    
    calcEdges();
    if(x>width||x<0) isDead = true;
    
    
  }

void draw(){
  noStroke();
  fill(r,g,b);
  ellipse(x, y, size, size);
  noFill();
  

}

}
