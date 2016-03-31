
Videogame vid;
Bullet bala;
Character rony;
Enemy e;
HUD hud;
Level l;

void setup(){

  
   size(1000,400);
   
}

void draw(){
  //vid.start();
  
  vid = new Videogame();
  vid.pintate();
  
  
  
}

class Videogame{
  
  
   
   private PImage iRony, iEnemy;
  public Videogame(){
    l = new Level();
    iRony = loadImage("../Characters/RonyNA.png");
    iEnemy = loadImage("../Characters/robot.png");
    iEnemy.resize(10,10);
    rony = new Character(iRony, 3, 0, false, 20, 50, 5, 5);
    bala = new Bullet();
    //e = new Enemy(iEnemy,1,100);
  }
  
  void start(){
  
  
  }
  
  void pintate(){
    bala.pintate();
    rony.pintate();
    
     if(keyCode == RIGHT){
      rony.moveRight();
    }else if(keyCode == LEFT){
      rony.moveLeft();
    }
    //e.pintate();
    //hud.pintate();
    
  }
  
  void keyPressed(){
   
  
  }
}