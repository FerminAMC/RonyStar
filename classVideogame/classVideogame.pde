
Videogame vid;
Bullet bala;
Character rony;
Enemy e;
HUD hud;
Level l;
boolean mR, mL, j;
Menu menu;
boolean MENU;

PImage iRony;
PImage iEnemy;
PImage icon, wasd, space;
void settings(){
  //fullScreen(); 
  size(1000,500);
}

void setup(){
   frameRate(200);
   iRony = loadImage("../Characters/RonyNA.png");
   iEnemy = loadImage("../Characters/robot.png");
   iRony.resize(50, 50);
   iEnemy.resize(50, 50);
   wasd = loadImage("../Sprites/wasd.png");
   space = loadImage("../Sprites/spaceKey.png");
   icon = loadImage("../Sprites/bullet.jpg");
   textFont(loadFont("../fonts/majorforce.ttf"));
   vid = new Videogame();
   
   MENU = true;
}

void draw(){
  background(0);
  vid.pintate();
  vid.move(mR, mL, j);
}

void keyPressed(){
  if(keyPressed == true){
    if(key == 'w' || key == 'W'){
      if(MENU == true){
        menu.up();
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
        mR = true;
      }
    }
    if(key == 'a' || key == 'A'){
      if(MENU == true){
        menu.right();
      }else{
        mL = true;
      }
    }
    if(key == ' '){
      if(!MENU){
        j = true;
      }
    }
    if(keyCode == ENTER){
      if(MENU == true){
        MENU = menu.select();
      }
    }
  }
 }
  
  void keyReleased(){
    if(key == 'd' || key == 'D'){
      if(!MENU)
      mR = false;
    }
    if(key == 'a' || key == 'A'){
      if(!MENU)
      mL = false;
    }
    if(key == ' '){
      if(!MENU)
      j = false;
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
    rony = new Character(iRony, 3, 0, false, 20, height - iRony.height, 5, .01);
    bala = new Bullet(10,20,20+icon.width,height/2,(height/2)+icon.height,icon, 1.02,1);
    e = new Enemy(iEnemy, 1, 100, 800, 50, 5, 1);
    //menu = new Menu(1, wasd, space);
  }
  
  void start(){
  
  }
  void move(boolean mR, boolean mL, boolean j){
    rony.moveRight(mR);
    rony.moveLeft(mL);
    rony.jump(j);
  }
  
  void pintate(){
    if(MENU == true){
      menu.pintate();
    }else{
      bala.pintate();
      rony.pintate();
      e.pintate();
      //e.pintate();
      //hud.pintate();
    }
  }
  
}