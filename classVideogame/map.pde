

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
  
  public Map(String path, float grav, int w, int h){
    background = loadImage(path);
    gravity = grav;
    this.w = w;
    this.h = h;
  }
  
  public Map(String path, float grav){
    background = loadImage(path);
    gravity = grav;
    w = background.width;
    h = background.height;
  }
  
  void pintate(int x){
    image(background,x-100,0);
  }
} 