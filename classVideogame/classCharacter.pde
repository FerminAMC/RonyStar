
abstract class Element{
  PImage image;
  int posXL;
  int posXR;
  int posYU;
  int posYD;
  float speedX;
  float speedY;
  //boolean collide(){};
}


class Character extends Element{
  int lives;
  int score;
  boolean [] powerUp = new boolean[3] ;
  
  public Character(){ 
    
    image = loadImage("../Characters/RonyNA.png");
    posXL = 0;
    posXR = posXL + image.width;
    posYU = 0;
    posYD = posYU + image.height;
    lives = 0;
    score = 0;
    powerUp[0] = true;
    speedX = 0;
    speedY = 0;
  }
  
  public Character(PImage image, int lives, int score, boolean powerUp, int posXL, int posYU, int speedX, int speedY){
    this.posXL = posXL;
    posXR = this.posXL + image.width;
    this.posYU = posYU;
    posYD = this.posYU + image.height;
    this.image = image;
    this.lives = lives;
    this.score = score;
    this.powerUp[0] = powerUp;
    this.speedX = speedX;
    this.speedY = speedY;
  } 
  
  void setPosXL(int posXL){
    this.posXL = posXL;
  }
  
  void setPosYU(int posYU){
    this.posYU = posYU;
  }
  
  void setLives(int lives){
    this.lives = lives;
  }
  
  void setScore(int score){
    this.score = score;
  }
  
  void setSpeedX(int speedX){
    this.speedX = speedX;
  }
  
  void setSpeedY(int speedY){
    this.speedY = speedY;
  }
  
  int getPosXL(){
    return posXL;
  }
  
  int getPosXR(){
    return posXR;
  }
  
  int getPosYU(){
    return posYU;
  }
  
  int getPostYD(){
    return posYD;
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
  
  void bulletCollide(Bullet e){
    boolean destroy = false;
    if(e.getSpeedX() < 0 && e.getPosXL() < posXR && posYU > e.getPosYD() && posYD < e.getPosYU()){
      lives--;
      e.hit(destroy);
    } else if(e.getSpeedX() > 0 && e.getPosXR() > posXL && posYU > e.getPosYD() && posYD < e.getPosYU()){
      lives--;
      e.hit(destroy);
    }
  }
  
  void pintate(){
    image(image,posXL, posYU);
  }
  
  void moveRight(){
    posXL += speedX;
  }
  
  void moveLeft(){
    posXL -= speedX;
  }
  
  void jump(){
    for(int i = 0; i < 50; i += speedY){
      posYU += speedY;
      pintate();
    }
    for(int i = 0; i < 50; i += speedY){
      posYU -= speedY;
      pintate();
    }
  }
  
}