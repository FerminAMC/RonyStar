class Character {
  int x,y;
  float xSpeed,ySpeed;
  float accel,deccel;
  float maxXspd,maxYspd;
  float xSave,ySave;
  int xRep,yRep;
  float gravity;
  PImage icon;
  float direction;
  int lives;
  int score;
  boolean powerUp[];
  float jumpSpeed, walkSpeed;
  
  Character(PImage icon, int lives, int score, boolean powerUP, int _x, int _y, float jumpSpeed, float walkSpeed ) {
    //(PImage image, int lives, int score, boolean powerUp, 
    //float posX, float posY, float jumpSpeed, float walkSpeed)
    this.icon = icon;
    x = _x;
    y = _y;
    xSpeed = 0;
    ySpeed = 0;
    lives = 3;
    accel = 0.5;
    deccel = 0.5;
    maxXspd = 5;
    maxYspd = 20;
    xSave = 0;
    ySave = 0;
    xRep = 0;
    yRep = 0;
    gravity = 0.25;
    //Si direction es = NULL todo rony se va al carajo
    direction = 1;
  }
  void move(float left, float right, float up, float movX) {
    if ( left != 0 ) {
      xSpeed += accel;
      if ( xSpeed > maxXspd ) {
        xSpeed = maxXspd;
      }
    }
    else if ( right != 0) {
      xSpeed -= accel;
      if ( xSpeed < -maxXspd ) {
        xSpeed = -maxXspd;
      }
    }
    else { //neither right or left pressed, decelerate
      if ( xSpeed > 0 ) {
        xSpeed -= deccel;
        if ( xSpeed < 0 ) {
          xSpeed = 0;
        }
      }
      else if ( xSpeed < 0 ) {
        xSpeed += deccel;
        if ( xSpeed > 0 ) {
          xSpeed = 0;
        }
      }
    }
    
    if ( up != 0) {
      if ( !place_free(x,y+25) || !place_free(x+24,y+25) ) {
        ySpeed = -6.3;
      }
    }
    
    ySpeed += this.gravity;
    
    /*
    // The technique used for movement involves taking the integer (without the decimal)
    // part of the player's xSpeed and ySpeed for the number of pixels to try to move,
    // respectively.  The decimal part is accumulated in xSave and ySave so that once
    // they reach a value of 1, the player should try to move 1 more pixel.  This jump
    // is not normally visible if it is moving fast enough.  This method is used because
    // is guarantees that movement is pixel perfect because the player's position will
    // always be at a whole number.  Whole number positions prevents problems when adding
    // new elements like jump through blocks or slopes.
    */
    xRep = 0; //should be zero because the for loops count it down but just as a safety
    yRep = 0;
    xRep += floor(abs(xSpeed));
    yRep += floor(abs(ySpeed));
    xSave += abs(xSpeed)-floor(abs(xSpeed));
    ySave += abs(ySpeed)-floor(abs(ySpeed));
    int signX = (xSpeed<0) ? -1 : 1;
    int signY = (ySpeed<0) ? -1 : 1;
    //when the player is moving a direction collision is tested for only in that direction
    //the offset variables are used for this in the for loops below
    int offsetX = (xSpeed<0) ? -24 : 24;   // Estos offsets son el (tamaño de la imagen/ 2) - 1
    int offsetY = (ySpeed<0) ? -24 : 24;
    
    if ( xSave >= 1 ) {
      xSave -= 1;
      xRep++;
    }
    if ( ySave >= 1 ) {
      ySave -= 1;
      yRep++;
    }

    for ( ; yRep > 0; yRep-- ) {
      if ( place_free(x-24,y+offsetY+signY) && place_free(x+24,y+offsetY+signY) ) {
        y += signY;
      }
      else {
        ySpeed = 0;
      }
    }
    for ( ; xRep >= 0; xRep-- ) {
      if ( place_free(x -offsetX-signX,y-24) && place_free(x -offsetX-signX, y) && place_free(x -offsetX-signX,y+24) ) {
        //x -= signX;
      }
      else if(x <= 25 || x >= width-25) {
        x += signX;
        xSpeed = 0;
      }else{
        xSpeed = 0;
      }
    }
      
  }
  float getPosX(){
    return x;
  }
  void setPosX(int x){
    this.x = x;
  }
  float getPosY(){
    return y;
  }
  void setPosY(int y){
    this.y = y;
  }
  float getDirection(){
    return direction;
  }
  float getXSpeed(){
    return xSpeed;
  }
  
  void setDirection(float dir){
    this.direction = dir;
  }
  
  PImage getIcon(){
    return icon;
  }
  
  void setIcon(PImage icon){
    this.icon = icon;
  }
  
  void pintate() {
    buffer.pushMatrix();
    buffer.translate(x,y);
    buffer.scale(direction, 1);
    buffer.imageMode(CENTER);
    buffer.image(icon, 0, 0);
    buffer.popMatrix();
   
  }
  
  boolean die(){
    if(lives <= 0){
      return true;
    }
    else return false;
  }
}