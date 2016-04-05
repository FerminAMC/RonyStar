
class Bullet{
  PImage icon;
  PVector position;
  float direction;
  PVector velocity;
  int damage;
  
  public Bullet(){
   damage = 10;
   icon = loadImage("../Sprites/bullet.jpg");
   position = new PVector(0,0);
   this.position = new PVector(0,0);
   this.direction = 1;
   this.velocity = new PVector(0,0);
  }
  
  public Bullet(PImage image, float direction, float posX, float posY, int damage){

    this.damage = damage;
    this.position = new PVector(posX, posY);
    this.icon = image;
    this.direction = direction;
    this.velocity = new PVector(0,0);
  }
  
  int getDamage(){
    return damage;
  }
  
  void setDamage(int damage){
    this.damage = damage;
  }
  
  PVector getPosition(){
    return position;
  }
  
  void setPosition(PVector position){
    this.position = position;
  }

  PImage getIcon(){
    return icon;
  }
  
  void setIcon(PImage icon){
    this.icon = icon;
  }
  
  PVector getVelocity(){
    return velocity;
  }
  
  void setSpeedX(PVector velocity){
    this.velocity = velocity;
  }
  
  void pintate(){
    pushMatrix();
   
    translate(position.x, position.y);
     
    // Always scale after translate and rotate.
    // We're using direction because a -1 scale flips the image in that direction.
    scale(direction, 1);
    imageMode(CENTER);
    image(icon, 0, -icon.height/2);
    popMatrix();
  }
  
}