
class Bullet{
  PImage icon;
  PVector position;
  float direction;
  PVector velocity;
  int damage;
  
  public Bullet(){
   damage = 10;
   icon = loadImage("../Sprites/bullet.png");
   position = new PVector(0,0);
   this.position = new PVector(0,0);
   this.direction = 1;
   this.velocity = new PVector(0,0);
  }
  
  public Bullet(PImage image, float direction, float posX, float posY, int damage, float spX, float spY){

    this.damage = damage;
    this.position = new PVector(posX, posY);
    this.icon = image;
    this.direction = direction;
    this.velocity = new PVector(spX,spY);
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
  
  void setSpeedX(float velocity){
    this.velocity.x = velocity;
  }
  
  void pintate(){
    pushMatrix();
    position.add(velocity);
    translate(position.x, position.y);
    // Always scale after translate and rotate.
    // We're using direction because a -1 scale flips the image in that direction.
    scale(direction,1);
    imageMode(CENTER);
    image(icon, 0, -icon.height/2);
    popMatrix();
  }
  
  //posXR = this.position.x + this.icon.width/2
  //posXL = this.position.x - this.icon.width/2
  //posYU = this.position.y - this.icon.height/2
  //posYD = this.position.y + this.icon.height/2
  //isqE = e.position.x - e.image.width/2
  //derE = e.position.x + e.image.width/2
  //upE = e.position.y - e.image.height/2
  //downE = e.position.y + e.image.height/2
  boolean hit(Enemy e){
    if(this.position.x + this.icon.width/2 >= width || this.position.x <= 0){
      return true;
    }
    else if(this.position.x + this.icon.width/2 >= e.position.x - e.image.width/2 && 
    this.position.x - this.icon.width/2 <= e.position.x + e.image.width/2 && 
    this.position.y + this.icon.height/2 >= e.position.y - e.image.height/2 &&
    this.position.y - this.icon.height/2 <= e.position.y + e.image.height/2
    ){
      e.resistance--;
      return true;
    }
    else return false;
  }
}