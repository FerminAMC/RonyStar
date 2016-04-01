/*
1 - Menu Start
2 - Menu Pausa
3 - Instrucciones
*/

class Menu{
  int menuNumber;   
  float selectorX;
  float selectorY;
  
  public Menu(){
    menuNumber = 1;
    selectorX = width/2 - 50;
    selectorY = 120;
  }
  
  public Menu(int menuNumber){
    this.menuNumber = menuNumber;
    
  }
  
  void pintate(){
    switch(this.menuNumber){
      case 1:
      //Menu Start
      background(0);
      drawStart();
      drawSelector();
    }
  }
  
  void drawStart(){
    fill(180);
    textSize(40);
    textAlign(CENTER);
    text("Rony Star", width/2 , 50);
    textSize(30);
    textAlign(LEFT);
    text("Empezar juego", width/2, 150);
    text("Instrucciones", width/2, 250);
  }
  
  void drawSelector(){
    fill(180);
    rect(this.selectorX, this.selectorY, 30, 30);
  }
  
  void select(){}
  
  void up(){}
  void down(){
    this.selectorY += 100;
    this.selectorY %= 250;
  }
  void right(){}
  void left(){}
}