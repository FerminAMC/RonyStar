class Enemy extends Element{
  int resistance;
  int value;
  
  public Enemy(){
    int resistance = 0;
    int value = 0;
    PImage image = null;
    position = new PVector(0, 0);
    direction = 0;
    velocity = new PVector(0, 0);
    jumpSpeed = 0;
    walkSpeed = 0;
  }
  
  public Enemy(PImage image, int resistance, int value, PVector charPos, float jumpSpeed, float walkSpeed){
    this.image = image;
    this.resistance = resistance;
    this.value = value;
    if(charPos.x > width/2){
      this.position = new PVector(charPos.x + 100, charPos.y + 100);
    }
    else{
      this.position = new PVector(charPos.x - 100, charPos.y + 100);
    }
    velocity = new PVector(0, 0);
    this.jumpSpeed = jumpSpeed;
    this.walkSpeed = walkSpeed;
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
  
  PVector getPos(){
    return position;
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
  
  void pintate(){
    pushMatrix();
    translate(position.x, position.y);
    scale(direction, 1);
    imageMode(CENTER);
    image(image, 0, -image.height/2);
    popMatrix();
  }
  
  void move(){
    if(position.y < height){
      velocity.y += gravity;
    }
    else{
      velocity.y = 0;
    }
  }
}