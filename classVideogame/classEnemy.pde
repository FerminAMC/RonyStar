
/*class Enemy extends Element{
  int resistance;
  int value;
  
  public Enemy(){
    int resistance = 0;
    int value = 0;
    for(int i = 0; i < 10; i++){
      image = null;
    }
    posXL = 0;
    posXR = posXL + image.width;
    posYU = 0;
    posYD = posYU + image.height;
    speedX = 0;
    speedY = 0;
  }
  
  public Enemy(PImage image, int resistance, int value, int posXL, int posYU, int speedX, int speedY){
    this.posXL = posXL;
    posXR = this.posXL + image.width;
    this.posYU = posYU;
    posYD = this.posYU + image.height;
    this.image = image;
    this.resistance = resistance;
    this.value = value;
    this.speedX = speedX;
    this.speedY = speedY;
  }
  
  void setPosXL(int posXL){
    this.posXL = posXL;
  }
  
  void setPosYU(int posYU){
    this.posYU = posYU;
  }
  
  void setResistance(int resistance){
    this.resistance = resistance;
  }
  
  void setValue(int value){
    this.value = value;
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
  
  int getResistance(){
    return resistance;
  }
  
  int getValue(){
    return value;
  }
  
  void bulletCollide(Bullet e){
    boolean destroy = false;
    if(e.getSpeedX() < 0 && e.getPosXL() < posXR && posYU > e.getPosYD() && posYD < e.getPosYU()){
      resistance--;
      e.hit(destroy);
    } else if(e.getSpeedX() > 0 && e.getPosXR() > posXL && posYU > e.getPosYD() && posYD < e.getPosYU()){
      resistance--;
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
      //pintate();
    }
    for(int i = 0; i < 50; i += speedY){
      posYU -= speedY;
      //pintate();
    }
  }
}
*/