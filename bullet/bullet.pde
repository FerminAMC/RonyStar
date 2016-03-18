
class Bullet{
  int damage;
  int posXL;
  int posXR;
  PImage icon;
  int posYU;
  int posYD;
  float speedX;
  float speedY;
  
  public Bullet(){
   damage = 10;
   posXL = 20;
   posXR = posXL +icon.width;
   icon = loadImage("");
   posYU = 200;
   posYD = posYU + icon.height;
   speedX = 1.02;
   speedY = 1;
  }
  public Bullet(int damage, int posXL, int posXR, int posYU, int posYD, PImage icon, int posY, float speedX, float speedY){
    this.damage = damage;
    this.posXL = posXL;
    this.posXR = posXR;
    this.icon = icon;
    this.posYU = posYU;
    this.posYD = posYD;
    this.speedX = speedX;
    this.speedY = speedY;
  }

  void moveRight(){
    posXL += speedX;
  }
  
  void moveLeft(){
    posXL -= speedX;
  }
  
  void moveDown(){
    posYU += speedY;
  }
  
  void moveUp(){
    posYU -= speedY;
  }
  void collide(){
      
  }
  
  int getDamage(){
    return damage;
  }
  
  void setDamage(int damage){
  this.damage = damage;
  }
  
  int getPosXL(){
    return posXL;
  }
  
  void setPosXL(int posXL){
    this.posXL = posXL;
  }
  
  int getPosXR(){
    return posXR;
  }
  

  PImage getIcon(){
    return icon;
  }
  
  void setIcon(PImage icon){
    this.icon = icon;
  }
  
  int getPosYU(){
    return posYU;
  }
  
  void setPosYU(int posYU){
    this.posYU = posYU;
  }
  
  int getPosYD(){
    return posYD;
  }
  
 
  
  float getSpeedX(){
    return speedX;
  }
  
  void setSpeedX(float speedX){
    this.speedX = speedX;
  }
  
  float getSpeedY(){
    return speedY;
  }
  
  void setSpeedY(float speedY){
    this.speedY = speedY;
  }
  
  void pintate(){
    image(icon, posXL, posYU);
  }
  
}