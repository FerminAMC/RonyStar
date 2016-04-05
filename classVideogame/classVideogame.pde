
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

void setup(){
   fullScreen(); 
   //size(1000,400);
   iRony = loadImage("../Characters/RonyNA.png");
   iEnemy = loadImage("../Characters/robot.png");
   iRony.resize(50, 50);
   iEnemy.resize(50, 50);
   wasd = loadImage("../Sprites/wasd.png");
   space = loadImage("../Sprites/spaceKey.png");
   icon = loadImage("../Sprites/bullet.jpg");
   fuente = createFont("../fonts/majorforce.ttf", 32);
   //fuente = createFont("../fonts/justice.ttf", 32);
   textFont(fuente);
   vid = new Videogame();
   
   MENU = true;
}

void draw(){
  background(0);
  vid.pintate();
  if(!MENU)
  vid.move(right, left, up, gravity);
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
    //iRony = loadImage("../Characters/RonyNA.png");
    //iEnemy = loadImage("../Characters/robot.png");
    //iRony.resize(50, 50);
    //iEnemy.resize(50, 50);
    rony = new Character(iRony, 3, 0, false, 100, height - iRony.height, 10, 4);
    bala = new Bullet(10,20,20+icon.width,height/2,(height/2)+icon.height,icon, 1.02,1);
    //e = new Enemy(iEnemy, 1, 100, 800, 50, 5, 1);
    menu = new Menu(1, wasd, space);
  }
  
  void start(){
  

  }
  void move(float right, float left, float up, float gravity){
    rony.move(left, right, up, gravity);
  }
  
  void pintate(){
    if(MENU == true){
      menu.pintate();
    }else{
      bala.pintate();
    }
  }
  
}