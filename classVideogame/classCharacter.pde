
class Character extends Element{
  int lives;
  int score;
  boolean [] powerUp = new boolean[3] ;
  
  public Character(){ 
    
    image = loadImage("../Characters/RonyNA.png");
    position = new PVector(0, 0); 
    direction = 1;
    velocity = new PVector(0, 0);
    jumpSpeed = 0;
    walkSpeed = 0;
    gravity = 0;
    lives = 0;
    score = 0;
    powerUp[0] = true;
  }
  
  public Character(PImage image, int lives, int score, boolean powerUp, float posX, float posY, float jumpSpeed, float walkSpeed){ 
    this.image = image;
    image.resize(50,50);
    position = new PVector(posX, posY);
    direction = 1;
    velocity = new PVector(0, 0);
    this.jumpSpeed = jumpSpeed;
    this.walkSpeed = walkSpeed;
    this.lives = lives;
    this.score = score;
    this.powerUp[0] = powerUp;
  } 
  
  void setPosX(float posX){
    position.x = posX;
  }
  
  void setPosY(float posY){
    position.y = posY;
  }
  
  void setLives(int lives){
    this.lives = lives;
  }
  
  void setScore(int score){
    this.score = score;
  }
  
  void setVelX(float velX){
    velocity.x = velX;
  }
  
  void setVelY(float velY){
    velocity.y = velY;
  }
  
  void setDirection(float direction){
    this.direction = direction;
  }
  
  PVector getPos(){
    return position;
  }
  
  PVector getVel(){
    return velocity;
  }
  
  boolean getPowerup(int i){
    return powerUp[i];
  }
  
  int getLives(){
    return lives;
  }
  
  int getScore(){
    return score;
  }
  
  float getDirection(){
    return direction;
  }

  void move(float left, float right, float up, float gravity, Enemy e){
    if(position.y < height){
      velocity.y += gravity;
    }
    else{
      velocity.y = 0;
    }
    
    //Jump
    if(position.y >= height && up != 0){
      velocity.y = -jumpSpeed;
    }
    
    //Walk left and right
    velocity.x = walkSpeed * (left + right);
    
    PVector nextPosition = new PVector(position.x, position.y);
    nextPosition.add(velocity);
    
    // Check collision with edge of screen and don't move if at the edge
    float offset = 0;
    
    if (nextPosition.x - image.width/2 > offset && nextPosition.x < (width - image.width/2 - 53))
    {
      position.x = nextPosition.x;
    }
    if(nextPosition.x + image.width/2 > e.getPos().x - e.image.width/2 && nextPosition.x - image.width/2 < e.getPos().x + e.image.width/2){
      lives--;
    }
    if (nextPosition.y + image.height/2 > offset && nextPosition.y < (height + image.height/2 - offset))
    {
      position.y = nextPosition.y;
    }
  }
  
  void collide(PVector v){
    PVector nextPosition = new PVector(position.x, position.y);
    nextPosition.add(velocity);
    if(nextPosition.x + image.width/2 > v.x && nextPosition.y > v.y){
      position.x = v.x - image.width/2;
    }
  }
  
  void pintate(){
    pushMatrix();
    translate(position.x, position.y);
    scale(direction, 1);
    imageMode(CENTER);
    image(image, 0, -image.height/2);
    popMatrix();
  }
  
  boolean die(){
    if(lives <= 0){
      return true;
    }
    else return false;
  }
  
}