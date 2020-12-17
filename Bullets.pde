class Bullet extends Floater{

int bulletCountDown;
  
public Bullet(Spaceship thisShip){
  myCenterX = thisShip.getMyX();
  myCenterY = thisShip.getMyY();
  myXspeed = thisShip.getMyXSpeed();
  myYspeed = thisShip.getMyYSpeed();
  myPointDirection = thisShip.getMyDirection();  
  myColor = thisShip.getMyColor();
  accelerate(6);
  bulletCountDown = 130;
}
public void show(){
  fill(myColor);
  stroke(253,255,255);
  ellipse((float)myCenterX, (float) myCenterY , 5.0 , 5.0);
  
}
public void move(){
 if(bulletCountDown > 0){
  bulletCountDown--; 
 }
 super.move();
}
public int getBulletCountDown(){
 return bulletCountDown; 
}
public double getMyX(){
  return myCenterX;
}
public double getMyY(){
  return myCenterY;
}
}
