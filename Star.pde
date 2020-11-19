class Star //note that this class does NOT extend Floater
{
  private float myX, myY, myDiameter;
  private float myRed, myGreen, myBlue, intensity;
  
  Star () {
    myX = (float) Math.random()*800.0; // create a random location for the star
    myY = (float) Math.random()*800.0;
    myDiameter = 1.0 + (float) Math.random()*6.0;  // make the star a random size
    
    if (Math.random() < 0.1) {
      // 10% of the stars get a color other than white. 
      // create a random color for these, and weight the red colors more
      myRed =  (float) 0.0 + (float) (Math.random()*255.0);
      myBlue = (float) 0.0 + (float) (Math.random()*100.0);
      myGreen = (float) 0.0 + (float) (Math.random()*75.0);
    }
    else {
      // 90% of the stars get white with varying intensity
        intensity = (float) 175.0 + (float) Math.random()*80.0;
        myRed = intensity;
        myBlue = intensity;
        myGreen = intensity;
    }
    
  }
  public void show() {
    // showing a star is straightforward -- just draw a solid
    // ellipse with no outline, using the colors and size determined
    // above in the constructor function.
    stroke (0,0,0);
    fill (myRed, myBlue, myGreen);
    ellipse(myX, myY, myDiameter, myDiameter);
  }
}
