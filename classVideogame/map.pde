

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
    //x = constrain(rony.getPosX(), 0, background.width - background.width);
    image(background, 5*background.width/10-rony.getPos().x * 2, h/2); 

    //image(background,w/2,h/2);
} 
}