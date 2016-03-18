class Menu{
  int menuNumber;
  int selectorX;
  int selectorY;
  
  Menu(){
    menuNumber = 1;
    selectorX = 50;
    selectorY = 50;
  }
  
  Menu(int menuNumber, int x, int y){
    this.menuNumber = menuNumber;
    this.selectorX = x;
    this.selectorY = y;
  }
}