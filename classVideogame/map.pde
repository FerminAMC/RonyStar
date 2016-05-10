

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
    println(x);
    float y = h/2;
    if(x < l.getLimScrDer()){
      rony.setPosX(positionX - (int)rony.getXSpeed());
    }else if(x > l.getLimScrIzq()){
      rony.setPosX(positionX - (int)rony.getXSpeed());
    }
    
    buffer.image(background, x , y);
  }
}