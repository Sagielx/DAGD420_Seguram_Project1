public class AABB extends GameObject {

  // AABB Properties
  protected float edgeL = 0;
  protected float edgeR = 0;
  protected float edgeT = 0;
  protected float edgeB = 0;
  protected float halfW = 0;
  protected float halfH = 0;

  public AABB() {
    // constructor code
  }

  // This function overrides the parent's update function.
  @Override public void update(float dt) {
    super.update(dt); // Calls the parent's update function.
    calcEdges();
  }

  // This function calculates all four edges of the hit-box.
  public void calcEdges() {
    edgeL = x - halfW;
    edgeR = x + halfW;
    edgeT = y - halfH;
    edgeB = y + halfH;
  }

  // This function sets the width and height of the AABB.
  // @param float w, h: Width and Height of the AABB.
  public void setSize(float w, float h) {
    halfW = w/2;
    halfH = h/2;
    calcEdges();
  }

  // This function checks if this AABB object is overlapping another AABB object.
  // @param AABB other: The other AABB object participating in the collision.
  // @param return: true if colliding, false if not.
  public boolean checkOverlap(AABB other) {
    if (edgeR < other.edgeL) return false;
    if (edgeL > other.edgeR) return false;
    if (edgeB < other.edgeT) return false;
    if (edgeT > other.edgeB) return false;
    return true;
  }

  // This function pushes the other object up or left from this AABB object.
  // @param AABB other: The other AABB object participating in the collision.
  public void fixOverlap(AABB other) {
    float pushUp = edgeB - other.edgeT;
    float pushLeft = edgeR - other.edgeL;
    float pushBottom = edgeT - other.edgeB;

    if (pushUp <= pushLeft) {
      setBottomEdge(other.edgeT);
    } else if (pushBottom <= pushLeft) {
      setTopEdge(other.edgeB);
    } else setRightEdge(other.edgeL);
  }

  /**
   * This method finds the best solution for moving (this) AABB out from an (other)
   * AABB object. The method compares four possible solutions: moving (this) box
   * left, right, up, or down. We only want to choose one of those four solutions.
   * The BEST solution is whichever one is the smallest. So after finding the four
   * solutions, we compare their absolute values to discover the smallest.
   * We then return a vector of how far to move (this) AABB.
   * NOTE: you should first verify that (this) and (other) are overlapping before
   * calling this method.
   * @param  other  The (other) AABB object that (this) AABB is overlapping with.
   * @return  The vector that respresents how far (and in which direction) to move (this) AABB.
   */
  public PVector findOverlapFix(AABB other) {

    float moveL = other.edgeL - edgeR; // how far to move this box so it's to the LEFT of the other box.
    float moveR = other.edgeR - edgeL; // how far to move this box so it's to the RIGHT of the other box.
    float moveU = other.edgeT - edgeB; // how far to move this box so it's to the TOP of the other box.
    float moveD = other.edgeB - edgeT; // how far to move this box so it's to the BOTTOM of the other box.

    // The above values are potentially negative numbers; the sign indicates what direction to move.
    // But we want to find out which ABSOLUTE value is smallest, so we get a non-signed version of each.

    float absMoveL = abs(moveL);
    float absMoveR = abs(moveR);
    float absMoveU = abs(moveU);
    float absMoveD = abs(moveD);

    PVector result = new PVector();

    result.x = (absMoveL < absMoveR) ? moveL : moveR; // store the smaller horizontal value.
    result.y = (absMoveU < absMoveD) ? moveU : moveD; // store the smaller vertical value.

    if (abs(result.y) <= abs(result.x)) {
      // If the vertical value is smaller, set horizontal to zero.
      result.x = 0;
    } else {
      // If the horizontal value is smaller, set vertical to zero.
      result.y = 0;
    }

    return result;
  }


  // This function sets the top edge of this object to a specified Y value.
  // @param float Y: The value to set the top edge to.
  public void setTopEdge(float Y) {
    y = Y + halfH;
    velocity.y = 0;
    calcEdges();
  }

  // This function sets the bottom edge of this object to a specified Y value.
  // @param float Y: The value to set the bottom edge to.
  public void setBottomEdge(float Y) {
    y = Y - halfH;
    velocity.y = 0;
    calcEdges();
  }

  // This function sets the right edge of this object to a specified X value.
  // @param float X: The value to set the right edge to.
  public void setRightEdge(float X) {
    x = X - halfW;
    velocity.x = 0;
    calcEdges();
  }
}
