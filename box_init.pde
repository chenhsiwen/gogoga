void box_init(){
  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  // Turn on collision listening!
  box2d.listenForCollisions();

  // Make the box
  chicken = new Box(width/2,height/2);

  // Make the spring (it doesn't really get initialized until the mouse is clicked)
  spring = new Spring();
  spring.bind(width/2,height/2,chicken);

  // Create the empty list
  rocks = new ArrayList<Rock>();
  pills = new ArrayList<Pill>(); 
  eggs = new ArrayList<Egg>(); 
  wall = new Boundary(width/2, height-5, width, 10);
  /*// add the egg
  eggs.add(new Egg(random(width/9)+1*width/9,height-20));
  eggs.add(new Egg(random(width/9)+4*width/9,height-20));
  eggs.add(new Egg(random(width/9)+7*width/9,height-20));*/
  //defune color
  colbox[0]=color(150,180,0);
  colbox[1]=color(0,0,255);
  colbox[2]=color(0,255,0);
  colbox[3]=color(0,255,255);
  colbox[4]=color(255,0,255);
  colbox[5]=color(255,255,0);  
  colbox[6]=color(150,0,180);
  colbox[7]=color(0,180,150); 
  colbox[8]=color(180,50,150);
  for(int i=0;i<3;i++)
    pass[i] = false;
}
void box_update(){
  //display the rocks
/*
  for (int i = rocks.size()-1; i >= 0; i--) {
    Rock r = rocks.get(i);
    r.display();
    // Particles that leave the screen, we delete them
    if (r.done()) {
      rocks.remove(i);
    }
  }
*/
  //display the pills
  for (int i = pills.size()-1; i >= 0; i--) {
    Pill p = pills.get(i);
    p.display();
    // Particles that leave the screen, we delete them
    if (p.done()) {
      pills.remove(i);
    }
  }
 //display th egg
/*  for (int i = eggs.size()-1; i >= 0; i--) {
    Egg e = eggs.get(i);
    e.display();
    // Particles that leave the screen, we delete them
    // (note they have to be deleted from both the box2d world and our list
    if (e.done()) {
      eggs.remove(i);
    }
  }*/
  chicken.display();
  wall.display();
  if(score<0){
    textSize(58);
    text("You lose",width/2-100,height/2);
    stop();
  
  }
  // display th score
  textSize(24);
  fill(0);
  text("Score:",1200,150);
  text(score,1270,150);

  
}