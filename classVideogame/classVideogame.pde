import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import processing.sound.*;

AudioPlayer player;
Minim back;

Animation start;
Map mapa;
Videogame vid;
ArrayList<Bullet> bala;
Character rony;
ArrayList <Enemy> enemy;
HUD hud;
Level l;
float right, left, up, gravity = .25;
Menu menu;
boolean MENU;
int ln;

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
   
   start = new Animation("../Sprites/menuinicio/menuinicio", 89, 0, height/2, width, height);

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
   
   back = new Minim(this);
   player = back.loadFile("piratas.mp3",2048);
   player.loop();
}

void draw(){
  println(rony.getPosX());
  s2.rewind();
  s2.play();
  
  
  
  
  vid.pintate();
  if(!MENU){
    vid.move(right, left, up, gravity);
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
          fill(240,200,50);
          switch(screen[iy][ix]) {
            case 1: rect(ix*50,iy*50,50,20);
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
        //  public Bullet(PImage image, float direction, PVector pos, int damage, float spX, float spY){

      }
    }
    
    if(keyCode == ENTER){
      if(MENU == true){
        MENU = menu.select(vid);
      }
    }
    
    if(key == 'p' || key == 'P'){
      player.pause();
      if(MENU == true && menu.menuNumber == 2){
          MENU = false;
          player.play();
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
    enemy = new ArrayList();
    rony = new Character(iRony, 5, 0, false, 40, 450, 15, 2);
    bala = new ArrayList();
    menu = new Menu(1, wasd, space);
    mapa = new Map(combinacion, 0);
    enemy.add(new Enemy(iEnemy, 2, 100, -100000, 1000000, 20, 2));
    hud = new HUD();
  }
  
  void increaseLevel(){
    l.setLevelNumber(ln++);
  }
  void restart(){
    rony.icon = iRony;
    rony.lives = 3;
    rony.score = 0;
    rony.powerUp[0] = false;
    rony.x = 45;
    rony.y = height - iRony.height;
    rony.jumpSpeed = 20;
    rony.walkSpeed = 2;
    for(Enemy e : enemy){
      e.resistance = 2;
      e.position.x = width - 100;
      e.position.y = height - iEnemy.height - (gravity*5);
    }
}
  
  void move(float right, float left, float up, float gravity){
    for(Enemy e : enemy){
      e.move(gravity);
    }
    rony.move(left, right, up, gravity);
  }
  
  void gana(){
    println("Ora pinches vergas");
    
}
  
  void pintate(){
   mapa.pintate(rony);
    if(MENU == true){
     
      menu.pintate();
    }
    else{
      rony.pintate();
      hud.pintate();
      for(Enemy e : enemy){
        e.pintate();
        if(e.die()){
          enemy.remove(e);
          rony.score +=100;
          break;
        }
      }
      int interval = 5;
      int spawnT = interval - int(millis()/10);
      if(spawnT % 103 == 0){
        frameRate(5);
        enemy.add(new Enemy(iEnemy, 1, 100, width - 100 + 10, 500 - iEnemy.height - (gravity*5), 20, 2));
      }
      frameRate(60);
      //System.out.println(spawnT);
      boolean aux = false;
      for(Bullet b : bala){
        b.pintate();
        for(Enemy e : enemy){
          if(b.hit(e)){
            animacion.add(new Animation("../Sprites/bulletHit/bulletHit", 25, b.position.x, b.position.y));
            bala.remove(b);
            aux = true;
            break;
          }
        }
        if(aux)break;
      }
      for(Animation anim : animacion){
      if(anim.turnOff()){
        animacion.remove(anim);
        break;
      }else{
        anim.pintate();
      }
      
      
    }
    if(rony.getPosX() >= 750 && enemy.size()==1){
        text("Has ganado", height/2, width/2);
        //aumentar de nivel y reiniciar tiempo
        increaseLevel();
        Level l2 = new Level(50,2,60);
        
        
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