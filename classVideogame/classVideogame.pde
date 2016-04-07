Videogame vid;
ArrayList<Bullet> bala;
Character rony;
//Enemy e;
HUD hud;
Level l;
float right, left, up, gravity = 1;
Menu menu;
boolean MENU;

ArrayList<Animation> animacion;
int lastBulletRony = 0;
PImage iRony, iEnemy, iBullet;
PImage wasd, space;
PFont fuente;
PVector v = new PVector(300,750);
void setup(){
   fullScreen(); 
   //size(1000,400);
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
   textFont(fuente);
   vid = new Videogame();
   MENU = true;
   animacion = new ArrayList();
}

void draw(){
  background(0);
  vid.pintate();
  if(!MENU){
    vid.move(right, left, up, gravity);
    rony.collide(v);
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
        lastBulletRony = millis();
        bala.add(new Bullet(iBullet, rony.getDirection(), rony.getPosX() , rony.getPosY(), 0, 20 * rony.getDirection(), 0));
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
    if(key == ' '){
      if(!MENU)
      lastBulletRony = 0;
    }
}

class Videogame{
  
  public Videogame(){
    l = new Level();
    rony = new Character(iRony, 3, 0, false, 100, height - iRony.height, 20, 10);
    bala = new ArrayList();
    
    menu = new Menu(1, wasd, space);
  }
  
  void move(float right, float left, float up, float gravity){
    rony.move(left, right, up, gravity);
  }
  
  void pintate(){
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