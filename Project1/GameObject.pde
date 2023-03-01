public class GameObject {
    
    
    protected PVector velocity = new PVector();
    public float x, y;
    public boolean isDead = false;
    
    public GameObject() {
      
    }
    
    public void update(float dt) {
      x += velocity.x * dt;
      y += velocity.y * dt;
    }
  }
