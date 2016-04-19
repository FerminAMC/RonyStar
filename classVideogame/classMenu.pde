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
      this.selectorY = 2;
      break;
      case 3:
      break;
    }
  }
  
  void coordenadaY(float y){
    this.selectorY = y;
  }
  
  void coordenadaX(float x){
    this.selectorX = x;
  }
  
  float getSelectorY(){
    return this.selectorY;
  }
  
  void pintate(){
    switch(this.menuNumber){
      case 1:
      //Menu Start
      buffer.background(0);
      
      start.pintate();
      drawStart();
      drawSelector();
      break;
      case 2:
      buffer.background(0);
      drawPause();
      drawSelector();
      break;
      case 3:
      buffer.background(0);
      drawInstructions();
      drawSelector();
      break;
    }
  }
  
  void drawStart(){
    buffer.fill(90);
    buffer.textSize(40);
    buffer.textAlign(CENTER);
    buffer.text("Rony Star", width/2.0 , 50);
    buffer.textSize(30);
    buffer.textAlign(LEFT);
    buffer.text("Empezar juego", width/2.0, height/3.0);
    buffer.text("Instrucciones", width/2.0, height/3.0 * 2);
  }
  
  void drawInstructions(){
    imageMode(CORNER);
    fill(90);
    textSize(40);
    textAlign(CENTER);
    text("¿Cómo jugar?", width/2.0, 50);
    textSize(30);
    text("Para moverte usa:", width/5.0 , height/3.0 - 30);
    image(wasd, width/5.0-150, height/3.0);
    text("Para disparar usa:", width/3.0 * 2, height/3.0 - 30);
    image(space, width/3.0 * 2-150, height/3.0);
    fill(90);
    text("¡A jugar!", width/2, height/3*2);
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
    buffer.fill(255);
    buffer.rect(this.selectorX, this.selectorY, 30, 30);
  }
  
  boolean select(Videogame v){
    switch(this.getMenuNumber()){
      case 1:
      //Si el selector está en la opción de instrucciones...
      if(this.getSelectorY() == ((height/3.0)*2)-30){
        this.setMenuNumber(3);
        this.coordenadaX(width/2-110);
        return true;
      }else{
        this.coordenadaY(height/5);
        return false;
      }
      case 2:
      //Menu pausa
      if(this.getSelectorY() == height/5){
        return false;
      }else if(this.getSelectorY() == ((height/5*2))){
        v.restart();
        return false;
      }else if(this.getSelectorY() ==(height/5*3)){
        this.setMenuNumber(3); 
        coordenadaX(width/2-110);
        coordenadaY((height/3.0 * 2)-30);
        return true;
      }else if(this.getSelectorY() ==(height/5*4)){
        setup();
        draw();
        this.setMenuNumber(1);
        return true ;
      }
      break;
      case 3:
        if(this.getSelectorX() == width/2-110){
         draw();
         coordenadaX(width/2-50);
         coordenadaY(height/5);           return false;
        }
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
      this.selectorY = (this.selectorY <= 100)? selectorY = ((height/5) * 4) : selectorY;
      
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
      this.selectorY = (this.selectorY >= height - 50)? selectorY = height/3-90 : selectorY;
      
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