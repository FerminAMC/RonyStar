/*
1 - Menu Start
2 - Menu Pausa
3 - Instrucciones
*/

class Menu{
  int menuNumber;   
  float selectorX;
  float selectorY;
  private PImage wasd, space;
  
  public Menu(){
    menuNumber = 1;
    setSelectorX();
    setSelectorY();
  }
  
  public Menu(int menuNumber, PImage wasd, PImage space){
    this.menuNumber = menuNumber;
    setSelectorX();
    setSelectorY();
    
    this.wasd = wasd;
    this.space = space;
    space.resize(250, 50);
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
      this.selectorX = width/2.0 - 50;
      break;
      case 2:
      this.selectorX = width/3 * 2 -30;
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
      this.selectorY = height/3.0 - 30;
      break;
      case 2:
      this.selectorY = height/3-50;
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
      break;
      case 2:
      drawPause();
      drawSelector();
      break;
      case 3:
      background(0);
      drawInstructions();
      drawSelector();
      break;
    }
  }
  
  void drawStart(){
    fill(90);
    textSize(40);
    textAlign(CENTER);
    text("Rony Star", width/2.0 , 50);
    textSize(30);
    textAlign(LEFT);
    text("Empezar juego", width/2.0, height/3.0);
    text("Instrucciones", width/2.0, height/3.0 * 2);
  }
  
  void drawInstructions(){
    
    fill(90);
    textSize(40);
    textAlign(CENTER);
    text("¿Cómo jugar?", width/2.0, 50);
    textSize(30);
    text("Para moverte usa:", width/6.0, height/3.0 - 30);
    text("Para disparar usa:", width/3.0 * 2, height/3.0 - 30);
    image(wasd, width/6.0, height/3.0);
    image(space, width/3.0 * 2, height/3.0);
  }
  
  void drawPause(){
    fill(180);
    textSize(40);
    textAlign(CENTER);
    text("Rony Star", width/2, 50);
    textSize(30);
    textAlign(LEFT);
    text("Reanudar", width/2, height/5 +30);
    text("Reiniciar nivel", width/2, (height/5*2)+30);
    text("Ayuda", width/2, (height/5*3)+30);
    text("Salir", width/2, (height/5*4)+30);
    
  }
  
  void drawSelector(){
    fill(255);
    rect(this.selectorX, this.selectorY, 30, 30);
  }
  
  boolean select(){
    switch(this.getMenuNumber()){
      case 1:
      //Si el selector está en la opción de instrucciones...
      if(this.getSelectorY() == ((height/3.0)*2)-30){
        this.setMenuNumber(3);
        return true;
      }else{
        return false;
      }
      case 2:
      //Menu pausa
      if(this.getSelectorY() == height/5 +30){
        return false;
      }else if(this.getSelectorY() == ((height/5*2)+30)){
        return false;
      }else if(this.getSelectorY() ==(height/5*3)+30){
        this.setMenuNumber(3); 
      }else if(this.getSelectorY() ==(height/5*4)+30){
        
      }else{
        return false;
      }
      break;
      case 3:
      break;
    }
    return true;
  }
  
  void up(){
    switch(this.getMenuNumber()){
      case 1:
      this.selectorY -= height/3.0;
      this.selectorY = (this.selectorY <= 50)? selectorY = ((height/3.0) * 2)-30 : selectorY;
      break;
      case 2:
      this.selectorY -= height/5;
      this.selectorY = (this.selectorY <= 50)? selectorY = ((height/5) * 4) : selectorY;
      
      break;
      case 3:
      break;
    }
  }
  void down(){
    switch(this.getMenuNumber()){
      case 1:
      this.selectorY += height/3.0;
      this.selectorY = (this.selectorY >= height - 50)? selectorY = height/3.0 - 30 : selectorY;
      break;
      case 2:
      this.selectorY += height/5;
      this.selectorY = (this.selectorY >= height - 50)? selectorY = height/3-50 : selectorY;
      
      break;
      case 3:
      break;
    }
  }
  
  void right(){
    switch(this.getMenuNumber()){
      case 1:
      break;
      case 2:
      break;
      case 3:
      break;
    }
  }
  
  void left(){
    switch(this.getMenuNumber()){
      case 1:
      break;
      case 2:
      break;
      case 3:
      break;
    }
  }
}