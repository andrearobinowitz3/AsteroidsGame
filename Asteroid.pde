class Asteroid extends Floater {
 private double rotationSpeed, myRadius;

 
 public Asteroid () {
     // create the asteroid polygon
     
       
      myRadius = 1 + Math.random() * 6;
    
     
     if (Math.random() < 0.8) {
       corners = 11;
       myRadius = 1 + Math.random() * 9;
       xCorners = new int[] 
       {4 * (int) myRadius, 4 * (int) myRadius, 2 *(int) myRadius, 1 *(int) myRadius, -1 * (int) myRadius,-2 * (int) myRadius,-5 * (int) myRadius, 
                       -4 * (int) myRadius, 0 * (int) myRadius, 3 * (int) myRadius, 5 * (int) myRadius}; 
       yCorners= 
                 new int[] 
       {0 * (int) myRadius,2 * (int) myRadius, 2  * (int) myRadius, 4 * (int) myRadius, 3 * (int) myRadius, 3 * (int) myRadius, 1 * (int) myRadius, 
                       -2 * (int) myRadius,-5 * (int) myRadius,-4 * (int) myRadius, -2 * (int) myRadius};
     }
     else
     {
       if (Math.random() < 0.8) {
       myRadius = 1 + Math.random() * 4;  
       corners = 6;  //the number of corners, a triangular floater has 3
       xCorners= new int[] {-9* (int) myRadius, 7 * (int) myRadius,11*(int) myRadius,12 * (int) myRadius,-4 * (int) myRadius,-6 * (int) myRadius};   
       yCorners= new int[] {-8 * (int) myRadius,-5 * (int) myRadius,0 *(int) myRadius,3 * (int) myRadius,6 * (int) myRadius,0 * (int) myRadius};
       }
       else
         {
         myRadius = 1 + Math.random() * 3;  
         corners = 8;  //the number of corners, a triangular floater has 3
         xCorners= new int[] {-7* (int) myRadius, 2 * (int) myRadius, 8*(int) myRadius,8*(int) myRadius,6 * (int) myRadius,-9 * (int) myRadius,
                 -2 * (int) myRadius, -3 * (int) myRadius};   
         yCorners= new int[] {-6 * (int) myRadius,-2 * (int) myRadius,3 * (int) myRadius, 3 * (int) myRadius,8 * (int) myRadius,6 * (int) myRadius,
                 0 * (int) myRadius, -2 * (int) myRadius}; 
         }
     }
     
      
   
      // set the color of the asteroid 
      myColor = (int) 100 + (int) (Math.random()*155);
      // set the initial (random) position of the asteroid
      myCenterX = (float) Math.random()*800; 
      myCenterY = (float) Math.random()*800;   
      // set the initial random speed of the polygon
      // the speed can be negative or positive
      
      /*
      myXspeed = (float) -2 + Math.random() * 4; // -2 .. 2
      myYspeed = (float) -2 + Math.random() * 4; */
      // set the initial direction of the polygon
      myPointDirection = Math.random() * 360; // 0 - 360 
      // set the amount that the polygon turns each move
      rotationSpeed = Math.random()*5 - 2.5;  // -2.5 .. 2.5      
      
      
     
 }
 

 public void move () {
   // this method moves the asteroids
   turn(rotationSpeed); // first turn the asteroid
   super.move(); // then call the superceding move function which will
                 // change its x and y location
 }
  
public float getRadius () {
  return (float) myRadius*10;
}

public float getX () {
  return  (float) myCenterX;
}

public float getY () {
  return (float) myCenterY;
}

}
