import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Map mapa;
Videogame vid;
Bullet bala;
Character rony;
//Enemy e;
HUD hud;
Level l;
float right, left, up, gravity = .5;
Menu menu;
boolean MENU;
PImage iRony;
PImage iEnemy;
PImage icon, wasd, space;
PFont fuente;
//PImage mapimg;

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


void setup(){ //flScreen(); 
size(800, 668);
mapa1 = loadImage("../Sprites/lvl_1.png");
mapa2 = loadImage("../Sprites/lvl_2.png");
mapa3 = loadImage("../Sprites/lvl_3.png");

combinacion = createGraphics(2228, 668, JAVA2D);

combinacion.beginDraw();
combinacion.image(mapa1, 0,0);
combinacion.image(mapa2, 980, 0);
combinacion.image(mapa3,1959,0);
combinacion.endDraw();

   iRony = loadImage("../Characters/RonyNA.png");
   iEnemy = loadImage("../Characters/robot.png");
   iRony.resize(50, 50);
   iEnemy.resize(50, 50);
   wasd = loadImage("../Sprites/wasd.png");
   space = loadImage("../Sprites/spaceKey.png");
   icon = loadImage("../Sprites/bullet.jpg");
   fuente = createFont("../fonts/majorforce.ttf", 32);
   textFont(fuente);
   vid = new Videogame();
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
  }
  
  
}
  void keyPressed(){
  if(keyPressed == true){
    if(key == 'w' || key == 'W'){
      if(MENU == true){
        menu.up();
      }
      else{
        up = -1;
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
        right = 1;
        rony.setDirection(1);
        s2.rewind();
        s2.play();
      }
    }
    if(key == 'a' || key == 'A'){
      if(MENU == true){
        menu.right();
      }else{
        left = -1;
        rony.setDirection(-1);
        flush.rewind();
        flush.play();
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
      right = 0;
    }
    if(key == 'a' || key == 'A'){
      if(!MENU)
      left = 0;
    }
    if(key == 'w' || key == 'W'){
      if(!MENU)
      up = 0;
    }
}

class Videogame{
  
  
  private boolean mR, mL;
  //private PImage iRony, iEnemy;
  public Videogame(){
    l = new Level();
    rony = new Character(iRony, 3, 0, false, 100, 0, 10, 4);
    bala = new Bullet(10,20,20+icon.width,height/2,(height/2)+icon.height,icon, 1.02,1);
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
      bala.pintate();
      
    }
  }
  
}