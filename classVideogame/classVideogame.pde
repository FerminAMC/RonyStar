
Videogame vid;
Bullet bala;
Character rony;
Enemy e;
HUD hud;
Level l;
boolean mR, mL, j;
Menu menu;
boolean MENU;

void setup(){

   vid = new Videogame();
   size(1000,400);
   MENU = true;
   
}

void draw(){
  background(0);
  vid.pintate();
  vid.move(mR, mL, j);
}

void keyPressed(){
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
  private PImage iRony, iEnemy;
  public Videogame(){
    l = new Level();
    iRony = loadImage("../Characters/RonyNA.png");
    iEnemy = loadImage("../Characters/robot.png");
    iRony.resize(50, 50);
    iEnemy.resize(50, 50);
    rony = new Character(iRony, 3, 0, false, 20, 350, 5, .01);
    bala = new Bullet();
    e = new Enemy(iEnemy, 1, 100, 800, 50, 5, 1);
    menu = new Menu(1);
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