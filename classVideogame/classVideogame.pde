import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Map mapa;
Videogame vid;
ArrayList<Bullet> bala;
Character rony;
HUD hud;
Level l;
float right, left, up, gravity = .25;
Menu menu;
boolean MENU;

ArrayList<Animation> animacion;
int lastBulletRony = 0;
PImage iRony, iEnemy, iBullet;
PImage wasd, space, icon;
PFont fuente;
//PVector v = new PVector(300,750);

PImage mapa1;
PImage mapa2;
PImage mapa3;
PGraphics combinacion;
//tipo de archivos necesarios para el audio
AudioSnippet s2;
AudioSnippet flush;
//objetos minim
Minim minim;
Minim s2min;

int WIDTH = 800/50;
int HEIGHT = 650/50;
int[][] screen = new int[HEIGHT][WIDTH];

void setup(){ //flScreen(); 
    size(800, 650);
    mapa1 = loadImage("../Sprites/lvl_1.png");
    mapa2 = loadImage("../Sprites/lvl_2.png");
    mapa3 = loadImage("../Sprites/lvl_3.png");
    
    combinacion = createGraphics(2200, 650, JAVA2D);
    
    combinacion.beginDraw();
    combinacion.image(mapa1, 0,0);
    combinacion.image(mapa2, 611, 0);
    combinacion.image(mapa3,1221,0);
    combinacion.endDraw();

   iRony = loadImage("../Characters/RonyNA.png");
   iEnemy = loadImage("../Characters/robot.png");
   iRony.resize(50, 50);
   iEnemy.resize(50, 50);
   iBullet = loadImage("../Sprites/bullet.png");
   iBullet.resize(50,50);
   
   wasd = loadImage("../Sprites/wasd.png");
   space = loadImage("../Sprites/spaceKey.png");

   //fuente = createFont("../fonts/majorforce.ttf", 32);
   fuente = createFont("../fonts/justice.ttf", 32);
   vid = new Videogame();
   animacion = new ArrayList();
   textFont(fuente);
   MENU = true;
   
   minim = new Minim(this);
   s2min = new Minim(this);
   flush = minim.loadSnippet("bullet.mp3");
   s2 = s2min.loadSnippet("bullet.mp3");
}

void draw(){
  vid.pintate();
  if(!MENU){
    vid.move(right, left, up, gravity);
    //rony.collide(v);
    for(Animation anim : animacion){
      if(anim.turnOff()){
        animacion.remove(anim);
        break;
      }else{
        anim.pintate();
      }
    }
    noStroke();
    for ( int ix = 0; ix < WIDTH; ix++ ) {
    for ( int iy = 0; iy < HEIGHT; iy++ ) {
      if(iy == 10){
        screen[iy][ix] = 1;
      }else{
        switch(screen[iy][ix]) {
          case 1: rect(ix*50,iy*50,50,50);
        }
      }
    }
  }
  }
 }

boolean place_free(int xx, int yy){
  //checks if a given point (xx,yy) is free (no block at that point) or not
  yy = int(floor(yy/50.0));
  xx = int(floor(xx/50.0));
  if ( xx > -1 && xx < screen[0].length && yy > -1 && yy < screen.length ) {
    if ( screen[yy][xx] == 0 ) {
      return true;
    }
  }
  return false;
}  

  void keyPressed(){
  if(keyPressed == true){
    if(key == 'w' || key == 'W'){
      if(MENU == true){
        menu.up();
      }
      else{
        up = 1;
      }
    }
    if(key == 's' || key == 'S'){
      if(MENU == true){
        menu.down();
      }
    }
    if(key == 'd' || key == 'D'){
      if(MENU == true){
        menu.left();
      }else{
        left = 1;
        //right = 1;
        rony.setDirection(1);
      }
    }
    if(key == 'a' || key == 'A'){
      if(MENU == true){
        menu.right();
      }else{
        right = 1;
        //left = 1;
        rony.setDirection(-1);
        
      }
    }
    
    if(key == ' ' && millis() - lastBulletRony > 500){
      if(!MENU){
        flush.rewind();
        flush.play();
        lastBulletRony = millis();
        bala.add(new Bullet(iBullet, -rony.getDirection(), rony.getPosX() , rony.getPosY() + 25, 0, 20 * rony.getDirection(), 0));
      }
    }
    
    if(keyCode == ENTER){
      if(MENU == true){
        MENU = menu.select();
      }
    }
    
    if(key == 'p' || key == 'P'){
      if(MENU == true && menu.menuNumber == 2){
          MENU = false;
        }
        
        MENU = true;
        menu.setMenuNumber(2);
        
    }
  }
 }
  
  void keyReleased(){
    if(key == 'd' || key == 'D'){
      if(!MENU)
      left = 0;
    }
    if(key == 'a' || key == 'A'){
      if(!MENU)
      right = 0;
    }
    if(key == 'w' || key == 'W'){
      if(!MENU)
      up = 0;
    }
    if(key == ' '){
      if(!MENU)
      lastBulletRony = 0;
    }
}

class Videogame{
  
  public Videogame(){
    l = new Level();
    rony = new Character(iRony, 5, 0, false, 100, 50, 15, 2);
    //(PImage image, int lives, int score, boolean powerUp, 
    //float posX, float posY, float jumpSpeed, float walkSpeed)
    bala = new ArrayList();
    menu = new Menu(1, wasd, space);
    mapa = new Map(combinacion, 0);
  }
  void start(){
  

  }
  
  void move(float right, float left, float up, float gravity){
    rony.move(left, right, up, gravity);
  }
  
  void pintate(){
   mapa.pintate(rony);
    if(MENU == true){
      menu.pintate();
    }else{
      rony.pintate();
      for(Bullet b : bala){
        b.pintate();
        if(b.hit()){
          animacion.add(new Animation("../Sprites/bulletHit/bulletHit", 25, b.position.x, b.position.y));
          bala.remove(b);
          break;
        }
      } 
    }
  }
}

void mousePressed() {
//Left click creates/destroys a block
  if ( mouseButton == LEFT ) {
    screen[int(floor(mouseY/50.0))][int(floor(mouseX/50.0))] ^= 1;
  }
}