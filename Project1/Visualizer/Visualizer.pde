public static int G = 980;
Float prevTime = 0.0;
Float dt;
int page=0;
int learn=0;
int ballType =2;
boolean wind = false;
boolean click =false;
float windForce = 50;
ArrayList<Gravity_Ball> balls1 = new ArrayList<Gravity_Ball>();
ArrayList<Bowling_Ball> balls2 = new ArrayList<Bowling_Ball>();
ArrayList<Tennis_Ball> balls3 = new ArrayList<Tennis_Ball>();
ArrayList<Windline> lines = new ArrayList<Windline>();
Ground ground;
Mouse m;
Wind w;
int windTimer=2;
Button Start;
Button ballSwitch;
Button Continue;
Button Learn;

void setup(){
  size(1920, 1080);
  ground = new Ground();
  m = new Mouse();
  w = new Wind();
  Start = new Button(width/4,700,400,100);
  ballSwitch = new Button(100,100,100,100);
  Continue = new Button(100,100,100,100);
  Learn = new Button(width/2 ,700,400,100);  
}

void draw(){
  background(#6D76C1);
  dt = calcDeltaTime();
  m.update(dt);
  ground.draw();
  w.draw();
  
  
  
  if(learn ==1){
    
  }
  
  
  if(page==0 && learn ==0){
    
    background(#6D76C1);
    textSize(64);
    fill(255);
    text("Forces and Interactions", width/4,300);
    textSize(32);
    text("By Michael Segura", width/4,400);
    
    noFill();
    fill(#1C69FF);
    stroke(#9ECCE3);
    Start.draw();
    fill(#0A8E84);
    stroke(#9ECCE3);
    Learn.draw();
    fill(255);
    text("Start", width/4-50,700);
    text("Learn", width/2-50,700);
    noFill();
    fill(#0A8E84);
    stroke(#9ECCE3);
    
    
    if(m.checkOverlap(Start)&&click){
      page++;
  }
  if(m.checkOverlap(Learn)&&click) learn++;
 }
  
  if(page==1){
////////////////////////////////////////////////////////update gravity balls
for (int i = 0; i < balls1.size(); i++) {
    Gravity_Ball b = balls1.get(i);
    b.update(dt);
}
for (int i = 0; i < balls1.size(); i++) {
     Gravity_Ball b = balls1.get(i);
    
    
     
     if (b.checkOverlap(ground)&&!b.grounded){
       b.grounded=true;
       b.velocity.y = -b.velocity.y;
       
       b.speed=0;
     }
      if(!b.checkOverlap(ground)) {
        b.grounded = false;
       
     }
     
     if(b.isDead) balls1.remove(b);
    b.draw();
  }
  }
  ///////////////////////////////////////////////////// END BALL UPDATE
  
  ////////////////////////////////////////////////////PAGE 2
  if(page==2){
    /////////////////////////////////////// BOWLING BALL
    for (int i = 0; i < balls2.size(); i++) {
    Bowling_Ball bb = balls2.get(i);
    bb.update(dt);
}
for (int i = 0; i < balls2.size(); i++) {
     Bowling_Ball bb = balls2.get(i);
    
    
     
     if (bb.checkOverlap(ground)&&!bb.grounded){
       bb.grounded=true;
       bb.velocity.y = 0;
       bb.speed=0;
     }
      if(!bb.checkOverlap(ground)) {
        bb.grounded = false;
       
     }
     
     if(bb.checkOverlap(w) && wind){
       bb.direction += windForce/bb.weight;
     }
     if(bb.isDead) balls1.remove(bb);
    bb.draw();
  }
    /////////////////////////////////////// BOWLING BALL END
    
    /////////////////////////////////////////TENIS BALL UPDATE
  for (int i = 0; i < balls3.size(); i++) {
    Tennis_Ball tb = balls3.get(i);
    tb.update(dt);
}
for (int i = 0; i < balls3.size(); i++) {
     Tennis_Ball tb = balls3.get(i);
    
    
     
     if (tb.checkOverlap(ground)&&!tb.grounded){
       tb.grounded=true;
       tb.velocity.y = 0;
       tb.speed=0;
     }
      if(!tb.checkOverlap(ground)) {
        tb.grounded = false;
       
     }
     if(tb.checkOverlap(w) && wind){
       tb.direction += windForce;
     }
     if(tb.isDead) balls3.remove(tb);
    tb.draw();
    ////////////////////////////////////////TENNIS BALL END
  }
  
  ///////////////////////////////////////////////////WINDLINES
  if(wind)windTimer--;
  
  if(windTimer<=0){
    windTimer=2;
    Windline l = new Windline(w.x-w.halfW, w.y-w.halfH,w.y+w.halfH, windForce);
      lines.add(l);
   
  }
    for (int i = 0; i < lines.size(); i++) {
    Windline l = lines.get(i);
    l.update();
}
  
  for (int i = 0; i < lines.size(); i++) {
     Windline l = lines.get(i);
     if(l.isDead) lines.remove(l);
     l.draw();
  }
  
  }/////////////////////////////////////////END PAGE 2
  
}///////////////////////////////////////////END DRAW
    

void mousePressed(){
  click=true;
  if(mouseButton == LEFT){
    if(page==1&&mouseY<height-50){
      
    Gravity_Ball b = new Gravity_Ball();
    balls1.add(b);
    }
    if(page==2 && mouseY<height-50 && ballType == 1){
      Bowling_Ball bb = new Bowling_Ball();
      balls2.add(bb);
    }
    if(page==2 && mouseY<height-50 && ballType == 2){
      Tennis_Ball tb = new Tennis_Ball();
      balls3.add(tb);
    }
  }
  if(mouseButton == RIGHT && page == 2){
    wind = true;
    
  }
}

void mouseReleased(){
  click=false;
  if(mouseButton == RIGHT) wind =false;
}


float calcDeltaTime() {
  float currTime = millis();
  float dt = (currTime - prevTime) / 1000;
  prevTime = currTime;
  return dt;
}
