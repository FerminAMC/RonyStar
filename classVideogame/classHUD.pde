int timeElapsed, timePaused;
class HUD {
  PImage lives;
  int score;
  int time;
  int livesText = 3;

  HUD() {
    score = 0;
    time = 0;
  }

  HUD(int enemies) {
    score = 0;
    time = 0;
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

  void setLivesText(int livesText) {
    this.livesText = livesText;
  }

  void pintate() {


    if (timer.getTimeLeftUntilFinish()/1000 > 9) {

      buffer.fill(255);
      buffer.text("Time: " + timer.getTimeLeftUntilFinish()/1000, width-500, 30);
    } else {

      buffer.textSize(40);
      buffer.fill(255, 0, 50);
      buffer.text("Time: " + timer.getTimeLeftUntilFinish()/1000, width-510, 35);

      player.close();
      playerCount.play();

      textSize(40);
      fill(255, 0, 50);
      text("Time: " + timer.getTimeLeftUntilFinish()/1000, width-510, 35);
    }
    buffer.fill(255);
    buffer.textSize(28);
    buffer.text("Score: " +rony.score, width-200, 30);
    buffer.text("Lives: " +livesText, width -800, 30); 
    if (timer.getTimeLeftUntilFinish()/1000 == 0) {
      buffer.textSize(58);
      buffer.fill(0);
      buffer.text("Game Over", 278, 400);
      //stop();
      playerCount.close();
      isRunning = false;
    }
  }

  void reset(int enemies) {
    score = 0;
    time = 0;
  }
}