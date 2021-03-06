class Spaceship extends Floater  
{   

    private int forceFieldUsesLeft;
    private int forceFieldCounter;
    private int flames;
    protected int cornersFlame;  //the number of corners, a triangular floater has 3   
    protected int[] xCornersFlameRear;   
    protected int[] yCornersFlameRear;
    protected int[] xCornersFlameFront;
    protected int[] yCornersFlameFront;

    
    public Spaceship(){
    // the constructor for this class
    // the polygon design for the default space ship
    corners=4;    
    xCorners= new int[] {-8, 16, -8, -2};   
    yCorners= new int[] {-8, 0, 8, 0};
    cornersFlame = 4;
    xCornersFlameRear = new int[] {-2, -11, -20, -11};
    yCornersFlameRear = new int[] {0,   5,   0, -5};
    xCornersFlameFront = new int[] {16, 25, 34, 25};
    yCornersFlameFront = new int[] {0,  4,  0, -4};
    myColor= color(238,187,250); // set the color to white   
    myCenterX = myCenterY= 400;  // position the space ship in the center of the screen   
    myXspeed = myYspeed=0;   // set it to not moving
    myPointDirection=0;  // set its direction to East (0 degrees)
    forceFieldUsesLeft = 3; // set 3 force field uses left
    forceFieldCounter = 50; // starts with the force field off
    flames = 0; // whether flames should come out of spaceship
    }
    
    public void hyperSpace () {
    myXspeed = 0; // stop the space ship
    myYspeed = 0;
    myPointDirection = 0; // reset its direction to East (0 degrees)
    myCenterX = Math.random() * 800; // assign it a random location
    myCenterY = Math.random() * 800;
    }
    
    public void forceField() {
      // this function turns on the force field
      // if there are force field uses left.
      if (forceFieldUsesLeft > 0) {
        // if there are force field uses left then
        forceFieldCounter = 900; // start the force field count-down timer
        forceFieldUsesLeft--; // decrement the number of force field uses available
      }
    }
    
    public void shoot () {
      // this method shoot bullets
     
    }
    
     public void accelerate (double dAmount) {
      super.accelerate (dAmount);
      if(dAmount>0){
        flames = 1;
      }
      else{
        flames=-1;
      }
     }
    
    public void show () {
      // this method supercedes the show method from the Floater class.
      float myX, myY;
  
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that *any shapes* will be drawn in the correct direction
    rotate(dRadians);
    
    if (forceFieldCounter > 0) {
        // now draw the forcefield, if the forcefield is active.
        // noFill () ; // turn off fill
        if (forceFieldCounter < 300) {
            // depending on the amount of time left for the force field countdown          
            if (forceFieldCounter < 200) {
              if (forceFieldCounter < 100) {
                  stroke (250,0,0); // 100 count downs left, set color red
                  fill (125,0,0);
              }
              else {
                  stroke (225,165,0); // 200 count downs left, set color orange
                  fill (125,87,0);
              }
            }
            else
              { stroke (255,255,0); // 300 count downs left, set color yellow
                fill (125,125,0);
              }
        }
        else { 
            stroke(0,255,0); // greater than 300 count down left, set color green
            fill (0,125,0);
        } 
        // draw the force field as an ellipse outline 
        ellipse (2, 0, 37,37);
        forceFieldCounter--; // decrease the force field counter
    }
    fill(myColor);   
    stroke(myColor);  
     //draw the spaceShip itself polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
       {
        vertex(xCorners[nI], yCorners[nI]);
      }
     endShape(CLOSE);
    if (flames != 0) {
     // if we just hit accelerate, then we will drame flames coming out of rocket
     beginShape();
     if(flames>0){
       fill(255,0,0);
           for (int nI = 0; nI < cornersFlame; nI++) {
              vertex(xCornersFlameRear[nI], yCornersFlameRear[nI]); 
            }
         }
       else{
       // flame is less than zero, meaning decelerate 
       fill(0,191,255); // change the color of the flame to blue
       for (int nI = 0; nI < cornersFlame; nI++) {
            vertex(xCornersFlameFront[nI], yCornersFlameFront[nI]); 
         }
       }
      endShape(CLOSE);
    }

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
    flames = 0;
  }
  
  public int getForceFields() {
    return forceFieldUsesLeft;
  }
  
  public int getForceFieldCounter () {
     return forceFieldCounter; 
  }
  
  public float getMyX () {
    return (float) myCenterX;
  }
  public float getMyY () {
    return (float) myCenterY;
  }
  
  public float getMyXSpeed () {
    return (float) myXspeed;
  }
  public float getMyYSpeed () {
    return (float) myYspeed;
  }
  
  public float getMyDirection() {
    return (float) myPointDirection;
  }
    public int getMyColor() {
    return myColor;
  }
}
