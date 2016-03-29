class HUD{
  PImage lives;
  PImage progress;
  int score;
  int time;
  
  public HUD(){
    lives = loadImage(".png");
    progress = loadImage(".png");
    score = 0;
    time = 0;
  }
  
  public HUD(int enemies){
    String path;
    lives = loadImage(".png");
    progress = loadImage(".png");
    score = 0;
    time = 0;
  }
  
  PImage getLives(){
    return lives;
  }
  
  void setLives(PImage lives){    //Aquí puede ser que reciba el path de la imagen en vez de la imagen
    this.lives = lives;
    /*
    this.lives = loadImage(lives);
    */
  }
  
  PImage getProgress(){
    return progress;
  }
  
  void setProgress(PImage progress){
    int i;
    this.progress = progress;
  }
  
  int getScore(){
    return score;
  }
  
  void setScore(int score){
    this.score = score;
  }
  
  int getTime(){
    return time;
  }
  
  void setTime(){
    this.time = time;
  }
  
  void pintate(){
    int interval = 10;
    time = interval - int(millis()/1000);
    text(time, width - 30, 30);
    if(time == 0){
      stop();
    }
  }
  
  void reset(int enemies){
    lives = loadImage(".png");
    progress = loadImage(".png");
    score = 0;
    time = 0;
  }
}