Spaceship spaceShip;
Star[] stars;

public void setup() 
{
  size (800,800);
  spaceShip = new Spaceship();
  stars = new Star[100];
  for (int i = 0; i<stars.length; i++) {
    stars[i] = new Star();
  }
}

public void draw() 
{
  background(0);  // create a black background
  
  // draw the stars first so other objects are infront
  for (int i = 0; i<stars.length; i++) {
    stars[i].show();
  }  
   // draw the space ship, and then have it move
  spaceShip.show();
  spaceShip.move();
  
}


public void keyPressed () {
  if ((key == 'h') || (key == 'H')) {
    // H pressed --> hyperspace
    spaceShip.hyperSpace();
  }
  else if ((key == 'n') || (key == 'N')) {
   // newgame
   setup ();
  }
  else if ((key == 'd') || (key == 'D')) {
    // rotate right
    spaceShip.turn(20);
  }
  else if ((key == 'a') || (key == 'A')) {
    // rotate left
    spaceShip.turn(-20);
  }
  else if ((key == 's') || (key == 'S')) {
    // fire thruster
    spaceShip.accelerate (2);
  }
  else if ((key == 'q') || (key == 'Q')) {
    // quit the game
    exit ();
  }
  else if ((key == 'w') || (key == 'W')) {
    // shoot the gun
    spaceShip.shoot();
  }
  else if ((key == 'f') || (key == 'F')) {
    // activate the forcefield
    spaceShip.forceField();
  }
  else if ((key == 'r') || (key == 'R')) {
    // brake the spaceship
   spaceShip.accelerate (-0.5);
  }
    
}
