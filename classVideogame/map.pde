

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
  
  void pintate(Character rony){
    float x = background.width/2 - rony.getPosX()*2;
    float x1 = (x >= -274)? x : -274;
    float y = h/2;
    println(x);
    image(background, x1 , y); 
  } 
}