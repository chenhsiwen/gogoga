boolean gesture_listener(KJoint[] joints){
  
   float scale_ref=diff(joints[KinectPV2.JointType_SpineShoulder],joints[KinectPV2.JointType_SpineBase]);
   float left_ratio=diff(joints[KinectPV2.JointType_WristLeft],joints[KinectPV2.JointType_ShoulderLeft])/scale_ref;
   float right_ratio=diff(joints[KinectPV2.JointType_WristRight],joints[KinectPV2.JointType_ShoulderRight])/scale_ref;
   if(left_ratio<=0.7 && right_ratio<=0.7)
     return true;   
   else 
     return false;
}
boolean wing_listener(float new_Leftangle, float org_Leftangle, float new_Rightangle, float org_Rightangle){
  if(abs(new_Leftangle-org_Leftangle)>0.25&&abs(new_Rightangle-org_Rightangle)>0.25)
    return true;
  else
    return false;
}
void beginContact(Contact cp) {
  // Get both fixtures
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  // Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
  // Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();

  //handle the event while rock hit the box
  if (o1.getClass() == Box.class&&o2.getClass() == Rock.class) {;
    Rock r = (Rock) o2;
    r.delete(); 
    score++; 
  } 
  else if (o2.getClass() == Box.class&&o1.getClass() == Rock.class) {
    Rock r = (Rock) o2;
    r.delete();
    score++;
  }
  //handle the event while pill hit the box
  else if (o1.getClass() == Box.class&&o2.getClass() == Pill.class) {
    Box b = (Box) o1;
    Pill p = (Pill) o2;
    if (p.col==color(0)){}
    else if (b.change(p.col))
      score++;
    else 
      score -=3;
    p.change();
  } 
  else if (o2.getClass() == Box.class&&o1.getClass() == Pill.class) {
    Box b = (Box) o2;
    Pill p = (Pill) o1;
    if (p.col==color(0)){}
    else if (b.change(p.col))
      score++;
    else 
      score -=3;
    p.change();
    
  }
 //handle the event while rock hit the boundary
  else if (o1.getClass() == Boundary.class&&o2.getClass() == Rock.class) {
    Rock r = (Rock) o2;
    r.delete();
  } 
  else if (o2.getClass() == Boundary.class&&o1.getClass() == Rock.class) {
    Rock r = (Rock) o1;
    r.delete();
  }
   //handle the event while rock hit the egg
  else if (o1.getClass() == Egg.class&&o2.getClass() == Rock.class) {
    Egg e = (Egg) o1;
    e.delete();
  } 
  else if (o2.getClass() == Egg.class&&o1.getClass() == Rock.class) {
    Egg e = (Egg) o2;
    e.delete();
  } 
}

void endContact(Contact cp) {
}