

class Map {
  PImage background;
  float gravity;
  int w;
  int h;
  
  public Map(){
    background = loadImage("");
    gravity = 1;
    w = background.width;
    h = background.height;
 
  }
  public Map(PGraphics path, float grav, int w, int h){
    background = path;
    //background.resize(displayWidth, displayHeight);
    gravity = grav;
    this.w = w;
    this.h = h;
  }
  
  public Map(PGraphics map, float grav){
    background = map;
    //background.resize(displayWidth, displayHeight);
    gravity = grav;
    w = background.width;
    h = background.height;
  }

   void drawboard(int positionX) {
     
    int x = (background.width/2) - offset; //Cambio de signo
    float y = h/2;
    float x1;
    if(x < -274){
      x1 = -274;
      rony.setPosX(positionX - (int)rony.getXSpeed());
    }else if(x > 1100){
      x1 = 1100;
      rony.setPosX(positionX - (int)rony.getXSpeed());
    }else{
       x1 = x; 
    }
    
    buffer.image(background, x1 , y);
  }
}