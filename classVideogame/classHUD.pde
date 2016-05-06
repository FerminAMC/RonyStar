int cont = 0;
int timeElapsed, timePaused;
class HUD {
  PImage lives;
  PImage progress[];
  int score;
  int time;
  int livesText = 3;

  HUD() {
    String path;
    //lives = loadImage(".png");
    for (int i = 0; i < 100; i++) {
      path = "" + i + ".png";
      // progress[i] = loadImage(path);
    }
    score = 0;
    time = 0;
  }

  HUD(int enemies) {
    String path;
    //lives = loadImage(".png");
    for (int i = 0; i < 100; i++) {
      path = "" + (100/enemies)*i + ".png";
      progress[i] = loadImage(path);
    }
    score = 0;
    time = 0;
  }
  /*
  PImage getLives(){
   return lives;
   }
   
   void setLives(PImage lives){    //Aquí puede ser que reciba el path de la imagen en vez de la imagen
   this.lives = lives;
   
   this.lives = loadImage(lives);
   
   }*/

  PImage[] getProgress() {
    return progress;
  }

  void setProgress(PImage progress[]) {
    int i;
    for (i = 0; i < progress.length; i++) {
      this.progress[i] = progress[i];
    }
  }

  int getScore() {
    return score;
  }

  void setScore(int score) {
    this.score = score;
  }

  int getTime() {
    return time;
  }

  void setTime() {
    this.time = time;
  }

  int getLivesText() {
    return livesText;
  }

  void setLivesText() {
    this.livesText = livesText;
  }

  void pintate() {
    int interval = 60;

    if (isRunning) {
     
      if (cont%2 == 0){
   
        interval = interval - int(millis()/1000 - (timePaused));  
      }
      else{
 
        interval = interval - int(millis()/1000 +(timePaused)); 
        
      }
      timeElapsed = interval;
      println("Timer:" +interval);
    } else if (isRunning == false) {
      cont++;
      if(cont % 2 == 0){
      
      println("cont %2 :"+cont);
        timePaused = int (millis()/1000 - (+timePaused));
      
      }else{
       cont++;
      println("cont :"+cont);
      timePaused = int (millis()/1000 - (timePaused));
      
      }
      if (timePaused >= 60)
        timePaused -= 60;
      println("Paused" + timePaused);
    }


    if (interval > 9) {

      buffer.fill(255);
      buffer.text("Time: " + interval, width-500, 30);
    } else {

      buffer.textSize(40);
      buffer.fill(255, 0, 50);
      buffer.text("Time: " + interval, width-510, 35);

      player.close();
      playerCount.play();

      textSize(40);
      fill(255, 0, 50);
      text("Time: " + interval, width-510, 35);
    }
    buffer.fill(255);
    buffer.textSize(28);
    buffer.text("Score: " +rony.score, width-200, 30);
    buffer.text("Lives: " +livesText, width -800, 30); 
    if (interval == 0) {
      buffer.textSize(58);
      buffer.fill(0);
      buffer.text("Game Over", 278, 400);
      //stop();
      playerCount.close();

      textSize(58);
      fill(0);
      text("Game Over", 278, 400);
      stop();
      isRunning = false;
    }
  }

  void reset(int enemies) {
    String path;
    //lives = loadImage(".png");
    for (int i = 0; i < 100; i++) {
      path = "" + (100/enemies)*i + ".png";
      //progress[i] = loadImage(path);
    }
    score = 0;
    time = 0;
  }
}