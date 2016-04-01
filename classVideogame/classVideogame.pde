
Videogame vid;
Bullet bala;
Character rony;
Enemy e;
HUD hud;
Level l;
boolean mR, mL, j;

void setup(){

   vid = new Videogame();
   size(1000,400);
   
}

void draw(){
  background(0);
  vid.pintate();
  vid.move(mR, mL, j);
}

void keyPressed(){
    if(key == 'd' || key == 'D'){
      mR = true;
    }
    if(key == 'a' || key == 'A'){
      mL = true;
    }
    if(key == ' '){
      j = true;
    }
  }
  
  void keyReleased(){
    if(key == 'd' || key == 'D'){
      mR = false;
    }
    if(key == 'a' || key == 'A'){
      mL = false;
    }
    if(key == ' '){
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
  }
  
  void start(){
  
  
  }
  void move(boolean mR, boolean mL, boolean j){
    rony.moveRight(mR);
    rony.moveLeft(mL);
    rony.jump(j);
  }
  
  void pintate(){
    bala.pintate();
    rony.pintate();
    e.pintate();
    //e.pintate();
    //hud.pintate();
    
  }
  
}