//your variable declarations here

// game controls

int numberOfLives;
int score = 0, highScore = 0;


Spaceship spaceShip;
Star[] stars;
ArrayList <Asteroid> asteroidsList;

public void setup() 
{
  size (800,800);

  score = 0;
  numberOfLives = 3;
  spaceShip = new Spaceship();
  stars = new Star[200];
  for (int i = 0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  
  asteroidsList = new ArrayList <Asteroid>();
  for (int i = 0; i<20; i++) {
    asteroidsList.add(new Asteroid());
  } 
  
}


public void detectAsteroidCollision () {
  for (int i = 0; i < asteroidsList.size(); i++) {
    if (dist (asteroidsList.get(i).getX(), asteroidsList.get(i).getY(), spaceShip.getMyX(), spaceShip.getMyY()) < asteroidsList.get(i).getRadius()) {
        score = (int) score + (int) asteroidsList.get(i).myRadius * 10;
        asteroidsList.remove(i);
        return ;
    }
  }
}

public void draw() 
{
  background(0);  // create a black background
  
  if (score > highScore) {
    highScore = score;
  }
  
  // draw the stars first -- so that the other objects
  // are in the foreground with stars in the background
  for (int i = 0; i<stars.length; i++) {
    stars[i].show();
  }
  // draw the asteroids next, and then have them move
  detectAsteroidCollision ();
  for (int i = 0; i < asteroidsList.size(); i++) {
    asteroidsList.get(i).show();
    asteroidsList.get(i).move();
  }
 
  
   // draw the space ship, and then have it move
  spaceShip.show();
  spaceShip.move();
  
  
   stroke (250); fill (250);
  text ("Lives "+numberOfLives+"  Force Field Left: "+spaceShip.getForceFields()+
      "  Score: "+score+".  High Score: "+highScore+".", 10,12);
  if (spaceShip.getForceFieldCounter() > 0) {
    text ("Force Field Power: "+spaceShip.getForceFieldCounter(),650,12);
  }
  
  
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
