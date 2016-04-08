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
Enemy enemy;
HUD hud;
Level l;
float right, left, up, gravity = 1;
Menu menu;
boolean MENU;

ArrayList<Animation> animacion;
int lastBulletRony = 0;
PImage iRony, iEnemy, iBullet;
PImage wasd, space, icon;
PFont fuente;
PVector v = new PVector(300,750);
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
  if(!MENU && !rony.die()){
    vid.move(right, left, up, gravity);
    rony.collide(v);
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
      }
    }
    if(key == 'a' || key == 'A'){
      if(MENU == true){
        menu.right();
      }else{
        left = -1;
        rony.setDirection(-1);
        
      }
    }
    
    if(key == ' ' && millis() - lastBulletRony > 500){
      if(!MENU){
        flush.rewind();
        flush.play();
        lastBulletRony = millis();
        bala.add(new Bullet(iBullet, rony.getDirection(), rony.getPos(), 0, 20 * rony.getDirection(), 0));
      }
    }
    
    if(keyCode == ENTER){
      if(MENU == true){
        MENU = menu.select(vid);
      }
    }
    
    if(key == 'p' || key == 'P'){
      if(MENU == true && menu.menuNumber == 2){
          MENU = false;
        }
        right = 0;
        left = 0;
        up = 0;
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
    if(key == ' '){
      if(!MENU)
      lastBulletRony = 0;
    }
}

class Videogame{
  
  public Videogame(){
    l = new Level();
    //se pone el gravity por 5 para que colisione bien con el piso, no se por que pasa
    //si se cambia el gravity eso se va al carajo
    rony = new Character(iRony, 3, 0, false, 100, height - iRony.height - (gravity*5), 20, 2);
    enemy = new Enemy(iEnemy, 2, 100, width - 100, height - iEnemy.height - (gravity*5), 20, 2);
    bala = new ArrayList();
    menu = new Menu(1, wasd, space);
    mapa = new Map(combinacion, 0);
  }
  void restart(){
  rony.image = iRony;
  rony.lives = 3;
  rony.score = 0;
  rony.powerUp[0] = false;
  rony.position.x = 45;
  rony.position.y = height - iRony.height;
  rony.jumpSpeed = 20;
  rony.walkSpeed = 2;
  enemy.resistance = 2;
  enemy.position.x = width - 100;
  enemy.position.y = height - iEnemy.height - (gravity*5);
}
  
  void move(float right, float left, float up, float gravity){
    rony.move(left, right, up, gravity, enemy);
    enemy.move(gravity);
  }
  
  void pintate(){
   mapa.pintate(rony);
    if(MENU == true){
      menu.pintate();
    }
    else{
      rony.pintate();
      enemy.pintate();
      for(Bullet b : bala){
        b.pintate();
        if(b.hit(enemy)){
          animacion.add(new Animation("../Sprites/bulletHit/bulletHit", 25, b.position.x, b.position.y));
          bala.remove(b);
          break;
        }
      }
      for(Animation anim : animacion){
      if(anim.turnOff()){
        animacion.remove(anim);
        break;
      }else{
        anim.pintate();
      }
    }
    }
  }
  
}