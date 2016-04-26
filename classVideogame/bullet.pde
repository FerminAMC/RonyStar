class Bullet{
  PImage icon;
  PVector position;
  float direction;
  PVector velocity;
  int damage;
  boolean hit;
  float xSave;
  String tipo; //Rony, normalEnemy, aerea, boss, cohete, etc
  
  public Bullet(){
   damage = 10;
   icon = loadImage("../Sprites/bullet.png");
   position = new PVector(0,0);
   this.position = new PVector(0,0);
   this.direction = 1;
   this.velocity = new PVector(0,0);
  }
  
  public Bullet(PImage image, float direction, float posX, float posY, int damage, float spX, float spY, String tipo){

    this.damage = damage;
    this.position = new PVector(posX, posY);
    this.icon = image;
    this.direction = direction;
    this.velocity = new PVector(spX,spY);
    hit = false;
    xSave = 0;
    this.tipo = tipo;
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
    
    //velocity.x *= -direction;
    
    float xSpeed = velocity.x;
    int x = round(position.x);
    int y = round(position.y);
    
    int xRep = 0; //should be zero because the for loops count it down but just as a safety
    xRep += floor(abs(xSpeed));
    xSave += abs(xSpeed)-floor(abs(xSpeed));
    int signX = (xSpeed<0) ? -1 : 1;
    //when the player is moving a direction collision is tested for only in that direction
    //the offset variables are used for this in the for loops below
    int offsetX = (xSpeed<0) ? -24 : 24;
    
    if ( xSave >= 1 ) {
      xSave -= 1;
      xRep++;
    }
    for ( ; xRep > 0; xRep-- ) {
      if ( place_free(x+offsetX+signX,y) && place_free(x+offsetX+signX,y+12) ) {
        x += signX;
      }
      else {
        xSpeed = 0;
        hit = true;
      }
    }
    
    position.x = x;
    velocity.x = xSpeed;
    
    pushMatrix();
    translate(position.x, position.y + 25);
    // Always scale after translate and rotate.
    // We're using direction because a -1 scale flips the image in that direction.
    scale(-direction,1);
    imageMode(CENTER);
    image(icon, 0, -icon.height/2);
    popMatrix();
  }
  
  boolean hit(Enemy e){
    if(hit){
      return true;
    }
    if(this.position.x + this.icon.width/2 >= width || this.position.x <= 0){
      return true;
    }
    else if(tipo == "rony"){
      if(this.position.x + this.icon.width/2 >= e.position.x - e.image.width/2 && 
        this.position.x - this.icon.width/2 <= e.position.x + e.image.width/2 && 
        this.position.y + this.icon.height/2 >= e.position.y - e.image.height/2 &&
        this.position.y - this.icon.height/2 <= e.position.y + e.image.height/2
        ){
          e.resistance--;
          return true;
        }else{
          return false;
        }
    }
    
    else return false;
  }
}