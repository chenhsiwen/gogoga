// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2012
// Box2DProcessing example

// A rectangular box

class Box {

  // We need to keep track of a Body and a width and height
  Body body;
  float w;
  float h;
  color col;
  color neckcol = color(175);
  color butcol = color(150);
  color clothescol = color(210);;
  color midcol = color(230);;
  color target_neckcol ;
  color target_butcol ;
  color target_clothescol;
  color target_midcol;
  int color_count;
  float angle;
  boolean shake;
  int direction;
  // Constructor
  Box(float x_, float y_) {
    float x = x_;
    float y = y_;
    w = 120;
    h = 120;
    // Add the box to the box2d world
    makeBody(new Vec2(x, y));
    body.setUserData(this);
    col = color(225);
    angle = 0;
    direction = 1;
    
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }
  boolean change(color col_) {


     if (col_==target_neckcol){
       neckcol=col_;
       bluh.play();
       change_target();
       return true;
     }
     else if (col_== target_butcol){
       butcol=col_; 
       bluh.play();
       change_target();
       return true;    
     }
     else if (col_== target_clothescol){
       clothescol = col_; 
       bluh.play();
       change_target();
       return true;
     }
     else if (col_==target_midcol){
       midcol = col_; 
       bluh.play();
       change_target();
       return true;
     }
     else if(col_==color(0)) 
        return true;
     else  
        return false;
  }
  void change_target(){
     if(neckcol==target_neckcol&&butcol==target_butcol&&midcol==target_midcol&&clothescol==target_clothescol){  
       target_col() ;
       neckcol = color(175);
       butcol = color(150);
       midcol = color(230);
       clothescol = color(210);
       score  += 5;
     }
  }
  void target_col() {
    int t=int(random(10));
    switch(t)
    {
         case 0:
            set_col(1,2,3,4);
            break;
         case 1:
            set_col(0,1,3,8);
            break;
         case 2:
            set_col(4,8,5,6);
            break;
         case 3:
            set_col(1,6,5,4);
            break;
         case 4:
            set_col(8,5,4,3);
            break;
         case 5:
            set_col(4,3,7,1);
            break;
         case 6:
            set_col(2,5,6,7);
            break;
         case 7:
            set_col(5,4,3,1);
            break;
         case 8:
            set_col(7,2,5,1);
            break;                
    }
  }
 //shake listener 
  void shake(boolean shake_){
    shake = shake_;
  }
  //set the color
  void set_col(int neck, int mid ,int but, int cloth){
    target_neckcol = colbox[neck];
    target_midcol = colbox[mid];
    target_butcol = colbox[but];
    target_clothescol = colbox[cloth];
  }
//our target color
  void hint_dispay(){
    translate(0, 0);
    fill(target_neckcol);
    rect(1205,180,25,25);
    fill(target_midcol);
    rect(1230,180,25,25);
    fill(target_butcol);
    rect(1255,180,25,25);
    fill(target_clothescol);
    rect(1280,180,25,25);
  }


  // Drawing the box
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
   
    
    ellipseMode(PConstants.CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(0);
    strokeWeight(0);
   


    //ellipse(0,0,w,h); 

    wing_display(shake);
    
    //body
    fill(color(255,175,0));
    rotate(0);
    beginShape();
      vertex(100, 60);
      vertex(-100, 60);
      vertex(0, -80);  
    endShape(CLOSE);

    //leg
    fill(color(255,70,0));
    ellipse(-40,60,24,24);
    ellipse(40,60,24,24);
    fill(color(255,100,0));
    ellipse(-40,60,12,12);
    ellipse(40,60,12,12);
    
    //clothes
    fill(clothescol);
    beginShape();
      vertex(100, 60);
      vertex(-100, 60);
      vertex(-70, 14); 
      vertex(70, 14);    
    endShape(CLOSE);
    
    //neck
    fill(neckcol);
    beginShape();
      vertex(70, 14);
      vertex(-70, 14);
      vertex(-55, -4);  
      vertex(55, -4);  
    endShape(CLOSE);
    
    //mid
    fill(midcol);
    beginShape();
      vertex(15, 14);
      vertex(-15, 14);
      vertex(-15, 60);  
      vertex(15, 60);  
    endShape(CLOSE);
    
    //eye
    fill(245);
    ellipse(35,-35,25,25);
    ellipse(-35,-35,25,25);
    fill(0);
    ellipse(35,-35,12,12);
    ellipse(-35,-35,12,12);
    //bouton
    fill(butcol);
    ellipse(0,5,12,12);
    ellipse(0,25,12,12);
    ellipse(0,45,12,12);
    
     //mouse
    fill(color(250,100,0));
    beginShape();
      vertex(15,-11 );
      vertex(-15, -11);
      vertex(0, -32);  
    endShape(CLOSE);
    fill(color(255,0,0));
    beginShape();
      vertex(15,-11 );
      vertex(-15, -11);
      vertex(0, -22);  
    endShape(CLOSE); 
    
    //head
    fill(color(255,70,0));
    beginShape();
      vertex(15, -60);
      vertex(-15, -60);
      vertex(0, -80);  
    endShape(CLOSE);
  

    popMatrix();
    hint_dispay();

         
  }

  void wing_display(boolean  shake){
    //smooth the motion of the wings 
    if(shake==true){
        if(direction == 1){
          angle+=0.05;
          if(angle > 0.4 )
            direction = -1;
        }
        else if(direction == -1){
          angle-=0.05;
          if(angle < -0.25 )
            direction = 1;
        }
        
    }
    //Leftwing
    pushMatrix();
    fill(color(255,70,0));
    rotate(angle);
    beginShape();
      vertex(-120, 30);
      vertex(-75, -10);
      vertex(-20, -10);  
      vertex(-30, 30);  
    endShape(CLOSE);
    fill(color(250,130,0));
    beginShape();
      vertex(-120, 30);
      vertex(-75, -00);
      vertex(0, -00);  
      vertex(-10, 30);  
    endShape(CLOSE);
    popMatrix();

    //Rightwing
    pushMatrix();
    fill(color(255,70,0));
    rotate(-1*angle);
    beginShape();
      vertex(120, 30);
      vertex(75, -10);
      vertex(20, -10);  
      vertex(30, 30);  
    endShape(CLOSE);
    fill(color(250,130,0));
    beginShape();
      vertex(120, 30);
      vertex(75, -00);
      vertex(0, -00);  
      vertex(10, 30);  
    endShape(CLOSE);
    popMatrix();
  }
  // This function adds the rectangle to the box2d world
  void makeBody(Vec2 center) {
    // Define and create the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);
    // Define a polygon (this is what we use for a rectangle)
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(w/2);
    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    //fd.rotation =true;
    body.createFixture(fd);
    //body.setMassFromShapes();

    // Give it some initial random velocity
   // body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
   // body.setAngularVelocity(random(-5, 5));
  }
}