class Enemy extends Element{
  int resistance;
  int value;
  int direction;
  float xSave,ySave;
  int xRep, yRep;
  String tipo;//Puede ser uno normal, volador, brincador, boss, etc;
  boolean jump = false;
  int tiempoVida;
  
  public Enemy(PImage image, int resistance, int value, float posX, float posY, float jumpSpeed, float walkSpeed, String tipo){
    this.image = image;
    this.resistance = resistance;
    this.value = value;
    position = new PVector(posX, posY);
    direction = 1;
    velocity = new PVector(0, 0);
    this.jumpSpeed = jumpSpeed;
    this.walkSpeed = walkSpeed;
    xSave = 0;
    ySave = 0;
    this.tipo = tipo;
    tiempoVida = 0;
  }
  
  int getTiempoVida(){
    return tiempoVida;
  }
  
  void setPosX(float posX){
    position.x = posX;
  }
  
  void setPosY(float posY){
    position.y = posY;
  }
  
  void setResistance(int resistance){
    this.resistance = resistance;
  }
  
  void setValue(int value){
    this.value = value;
  }
  
  void setVelX(float velX){
    velocity.x = velX;
  }
  
  void setVelY(float velY){
    velocity.y = velY;
  }
  
  float getPosX(){
    return position.x;
  }
  
  float getPosY(){
    return position.y;
  }
  
  PVector getPos(){
    return position;
  }
  
  int getDirection(){
    return direction;
  }
  
  void setDirection(int dir){
    this.direction = dir;
  }
  
  PVector getVel(){
    return velocity;
  }
  
  int getResistance(){
    return resistance;
  }
  
  int getValue(){
    return value;
  }
  
  String getTipo(){
    return tipo;
  }
  
  void pintate(){
    pushMatrix();
    translate(position.x, position.y);
    scale(-direction, 1);
    imageMode(CENTER);
    image(image, 0, 0);
    popMatrix();
    tiempoVida++;
  }
  
  void move(float gravity){
    
    if(tipo == "brincador" && jump == true){
      if ( !place_free(round(position.x),round(position.y)+25) || !place_free(round(position.x)+24,round(position.y)+25) ) {
        velocity.y = -8.3;
      }
    }
    if(tipo != "volador"){
      velocity.y += gravity;
    }
    
    //Walk left and right
    velocity.x = direction * walkSpeed;
    
    float xSpeed = velocity.x;
    float ySpeed = velocity.y;
    int x = round(position.x);
    int y = round(position.y);
    
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
    int offsetX = (xSpeed<0) ? -24 : 24;
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
        jump = (signY > 0)? true: false;
        ySpeed = 0;
      }
    }
    for ( ; xRep > 0; xRep-- ) {
      if ( place_free(x+offsetX+signX,y) && place_free(x+offsetX+signX,y+12) ) {
        x += signX;
      }
      else {
        xSpeed = 0;
        direction *= -1;
      }
    }
    
    position.x = x;
    position.y = y;
    velocity.x = xSpeed;
    velocity.y = ySpeed;
    
    /*PVector nextPosition = new PVector(position.x, position.y);
    nextPosition.add(velocity);
    // Check collision with edge of screen and don't move if at the edge
    float offset = 0;
    if (nextPosition.x + image.width/2 >= offset && nextPosition.x <= (width + image.width/2))
    {
      position.x = nextPosition.x;
    
    }
    if (nextPosition.y + image.height/2 >= offset && nextPosition.y <= (500 + image.height/2 - offset))
    {
      position.y = nextPosition.y;
    }
    if (nextPosition.x + image.width/2 <= offset && nextPosition.x >= (width + image.width/2)){
    rony.lives -= 1;
    }*/
  }
  
  boolean die(){
    if(resistance <= -1){
      return true;
    }
    else return false;
  }
  
}