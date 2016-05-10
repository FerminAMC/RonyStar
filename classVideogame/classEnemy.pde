class Enemy extends Element{
  int resistance;
  int value;
  int direction;
  float xSave,ySave;
  int xRep, yRep;
  String tipo;//Puede ser uno normal, volador, brincador, boss, etc;
  boolean jump = false;
  int tiempoVida;
  
  public Enemy(PImage image, int resistance, int value, float posX, float posY, float jumpSpeed, float walkSpeed, int direction, String tipo){
    this.image = image;
    this.resistance = resistance;
    this.value = value;
    position = new PVector(posX, posY);
    this.direction = direction;
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
    buffer.pushMatrix();
    buffer.translate(position.x-offset, position.y); //Cambio signo
    buffer.scale(-direction, 1);
    buffer.imageMode(CENTER);
    buffer.image(image, 0, 0);
    buffer.popMatrix();
    tiempoVida++;
  }
  
<<<<<<< HEAD
  void move(float gravity){
    
    if(tipo == "brincador" && jump == true){
        velocity.y = -8.3;
        jump = false;
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
      if ( place_free(x-24 - offset,y+offsetY+signY) && place_free(x+24 - offset,y+offsetY+signY) ) { // Cambio de signo
        y += signY;
      }
      else {
        jump = (signY > 0)? true: jump;
        ySpeed = 0;
=======
  void move(float gravity, Character c){
    if(tipo == "boss"){
      
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
      int offsetX = (xSpeed<0) ? -154 : 154;
      int offsetY = (ySpeed<0) ? -69 : 69;
      
      if ( xSave >= 1 ) {
        xSave -= 1;
        xRep++;
      }
      if ( ySave >= 1 ) {
        ySave -= 1;
        yRep++;
      }
     
      
      for ( ; yRep > 0; yRep-- ) {
        if ( place_free(x-24 + offset,y+offsetY+signY) && place_free(x+24 + offset,y+offsetY+signY) ) {
          y += signY;
        }
        else {
          jump = (signY > 0)? true: false;
          ySpeed = 0;
        }
      }
      for ( ; xRep > 0; xRep-- ) {
        if ( place_free(x+offsetX+signX+offset,y) && place_free(x+offsetX+signX+offset,y+12) ) {
          x += signX;
        }
        else {
          xSpeed = 0;
          direction *= -1;
        }
>>>>>>> boss
      }
      
      position.x = x;
      position.y = y;
      velocity.x = xSpeed;
      velocity.y = ySpeed;
    }
<<<<<<< HEAD
    for ( ; xRep > 0; xRep-- ) {
      if ( place_free(x+offsetX+signX-offset,y) && place_free(x+offsetX+signX-offset,y+12) ) { // Cambio de signo
        x += signX;
      }
      else {
        xSpeed = 0;
        direction *= -1;
        x += direction * walkSpeed;
=======
    else{
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
        if ( place_free(x-24 + offset,y+offsetY+signY) && place_free(x+24 + offset,y+offsetY+signY) ) {
          y += signY;
        }
        else {
          jump = (signY > 0)? true: false;
          ySpeed = 0;
        }
      }
      for ( ; xRep > 0; xRep-- ) {
        if ( place_free(x+offsetX+signX+offset,y) && place_free(x+offsetX+signX+offset,y+12) ) {
          x += signX;
        }
        else {
          xSpeed = 0;
          direction *= -1;
        }
>>>>>>> boss
      }
      
      position.x = x;
      position.y = y;
      velocity.x = xSpeed;
      velocity.y = ySpeed;
    }
  }
  
  boolean die(){
    if(resistance <= -1){
      return true;
    }
    else return false;
  }
  
}