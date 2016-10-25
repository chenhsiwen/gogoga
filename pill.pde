// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// Box2DProcessing example

// A circular particle

class Pill {

  Body body;
  float r;
  boolean delete = false;

  color col;


  Pill(float x, float y, float r_) {
    r = r_;
    // puts the particle in the Box2d world
    makeBody(x, y, r);
    body.setUserData(this);
    randdomcolor();
  }
  void delete() {
    delete = true;
  }
  // removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  // Change color when hit
  void change() {
    col = color(0);
  }

  // Is the particle ready for deletion?
  boolean done() {
    //the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height+r*2 || delete) {
      killBody();
      return true;
    }
    return false;
  }
  void randdomcolor(){
    int t=int(random(10));
    switch(t)
    {
           case 0:
              col=colbox[0];
              break;
           case 1:
              col=colbox[1];
              break;
           case 2:
              col=colbox[2];
              break;
           case 3:
              col=colbox[3];
              break;
           case 4:
              col=colbox[4];
              break;
           case 5:
              col=colbox[5];  
              break;
           case 6:
              col=colbox[6];
              break;
           case 7:
              col=colbox[7];
              break;
           case 8:
              col=colbox[8];
              break;    
              
    }
  }



  // 
  void display() {
    //body's screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    fill(col);
    stroke(0);
    strokeWeight(0);
    ellipse(0, 0, r*1.3, r*2);
    popMatrix();
  }

  // Here's our function that adds the particle to the Box2D world
  void makeBody(float x, float y, float r) {
    // Define a body
    BodyDef bd = new BodyDef();
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.01;
    fd.restitution = 0.3;

    // Attach fixture to body
    body.createFixture(fd);

    body.setAngularVelocity(random(-10, 10));
  }
}