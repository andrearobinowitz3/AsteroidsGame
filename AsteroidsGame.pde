int numberOfLives;
int score = 0, highScore = 0;


Spaceship spaceShip;
Star[] stars;
ArrayList <Asteroid> asteroidsList;
ArrayList <Bullet> bulletsList;

public void setup() 
{
  size (800,800);

  score = 0;
  numberOfLives = 3;
  spaceShip = new Spaceship();
  stars = new Star[400];
  for (int i = 0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  
  asteroidsList = new ArrayList <Asteroid>();
  for (int i = 0; i<20; i++) {
    asteroidsList.add(new Asteroid());
  } 
  
  bulletsList = new ArrayList <Bullet>();
}


public void detectAsteroidCollision () {
  for (int i = 0; i < asteroidsList.size(); i++) {
    if (dist (asteroidsList.get(i).getX(), asteroidsList.get(i).getY(), 
        spaceShip.getMyX(), spaceShip.getMyY()) < asteroidsList.get(i).getRadius()*10)
        if  (spaceShip.getForceFieldCounter() > 0)  
          {
          score = (int) score + (int) asteroidsList.get(i).getRadius() * 10;
            asteroidsList.remove(i);
          return ;
          }
         else {
          numberOfLives--;
          asteroidsList.remove(i);
          spaceShip = new Spaceship ();
          break;
         }
    }
  }



public void  bulletAsteroidRemoval(){
   for (int i = 0; i < asteroidsList.size(); i++) {
      for (int j = 0; j < bulletsList.size(); j++) {
        if(dist ((float) asteroidsList.get(i).getX(), (float) asteroidsList.get(i).getY(), 
            (float) bulletsList.get(j).getMyX(), (float) bulletsList.get(j).getMyY()) 
            < asteroidsList.get(i).getRadius()) {
              score = (int) score + (int) asteroidsList.get(i).myRadius * 10;
              asteroidsList.remove(i);
              break;
            }
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
  if (numberOfLives > 0) {
          detectAsteroidCollision ();
  }
  bulletAsteroidRemoval();
  
  for (int i = 0; i < asteroidsList.size(); i++) {
    asteroidsList.get(i).show();
    asteroidsList.get(i).move();
  }
 
 for(int i = 0; i < bulletsList.size(); i++){
   if(bulletsList.get(i).getBulletCountDown() == 0){
     bulletsList.remove(i);
     break;
   }
 }
 for (int i = 0; i < bulletsList.size(); i++) {
    bulletsList.get(i).show();
    bulletsList.get(i).move();
  }
  
   // draw the space ship, and then have it move
  if (numberOfLives > 0) {
        spaceShip.show();
        spaceShip.move();
  }
  else
  {
    stroke (255,0,0); fill (255,0,0);
    textSize (32);
    text ("Game Over... type 'n' for New Game.",110,370);
  }
  
  if (asteroidsList.size() == 0) {
    stroke (0,255,0); fill (0,255,0);
    textSize (32);
    text ("You Won!!!   type 'n' for New Game.",110,370);
  }
  
  stroke (250); fill (250);
  textSize(14);
  text ("Lives "+numberOfLives+"  Force Field Left: "+spaceShip.getForceFields()+
      "  Score: "+score+".  High Score: "+highScore+".", 10,12);
  text ("Asteroids Remaining: "+asteroidsList.size(),400,12);    
  if ((spaceShip.getForceFieldCounter() > 0) &&
      (numberOfLives > 0) ){
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
  else if ((key == 'f') || (key == 'F')) {
    // activate the forcefield
    spaceShip.forceField();
  }
  else if ((key == 'r') || (key == 'R')) {
    // brake the spaceship
   spaceShip.accelerate (-0.5);
  }
  else if (((key == 'w') || (key == 'W')) &&
           (numberOfLives > 0)) {
   bulletsList.add(new Bullet(spaceShip)); 
  }
  else if ((key == '+') || (key == '=')) {
   asteroidsList.add(new Asteroid());
  }
}
    
