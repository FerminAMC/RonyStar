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
  
  public Enemy(PImage image, int resistance, int value, float posX, float posY, float jumpSpeed, float walkSpeed){
    this.image = image;
    this.resistance = resistance;
    this.value = value;
    position = new PVector(posX, posY);
    direction = 1;
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
  
  void move(float gravity){
    if(position.y < 500){
      velocity.y += gravity;
    }
    else{
      velocity.y = 0;
    }
    //Walk left and right
    velocity.x = -walkSpeed;
    
    
    PVector nextPosition = new PVector(position.x, position.y);
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
    }
  }
  
  boolean die(){
    if(resistance <= -1){
      return true;
    }
    else return false;
  }
  
}