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
    setSelectorX();
    setSelectorY();
  }
  
  public Menu(int menuNumber){
    this.menuNumber = menuNumber;
    setSelectorX();
    setSelectorY();
  }
  
  void setMenuNumber(int mn){
    this.menuNumber = mn;
  }
  
  int getMenuNumber(){
    return this.menuNumber;
  }
  
  void setSelectorX(){
    switch(this.getMenuNumber()){
      case 1:
      this.selectorX = width/2 - 50;
      break;
      case 2:
      break;
      case 3:
      break;
    }
  }
  
  float getSelectorX(){
    return this.selectorX;
  }
  
  void setSelectorY(){
    switch(this.getMenuNumber()){
      case 1:
      this.selectorY = height/3 - 30;
      break;
      case 2:
      break;
      case 3:
      break;
    }
  }
  
  float getSelectorY(){
    return this.selectorY;
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
    text("Empezar juego", width/2, height/3);
    text("Instrucciones", width/2, height/3 * 2);
  }
  
  void drawSelector(){
    fill(180);
    rect(this.selectorX, this.selectorY, 30, 30);
  }
  
  boolean select(){
    switch(this.getMenuNumber()){
      case 1:
      //Si el selector está en la opción de instrucciones...
      if(this.getSelectorY() == ((height/3)*2)-30){
        this.setMenuNumber(3);
        return true;
      }else{
        return false;
      }
      case 2:
      break;
      case 3:
      break;
    }
    return true;
  }
  
  void up(){
    switch(this.getMenuNumber()){
      case 1:
      this.selectorY -= height/3;
      this.selectorY = (this.selectorY <= 50)? selectorY = ((height/3) * 2)-30 : selectorY;
      break;
      case 2:
      break;
      case 3:
      break;
    }
  }
  void down(){
    switch(this.getMenuNumber()){
      case 1:
      this.selectorY += height/3;
      this.selectorY = (this.selectorY >= height - 50)? selectorY = height/3 - 30 : selectorY;
      break;
      case 2:
      break;
      case 3:
      break;
    }
  }
  void right(){}
  void left(){}
}