class Level{
int enemiesNumber;
int levelNumber;
int maxSeconds;

  public Level(){
    enemiesNumber = 10;
    levelNumber = 1;
    maxSeconds = 60;
  }
  
  public Level(int en, int ln, int ms){
    enemiesNumber = en;
    levelNumber = ln;
    maxSeconds = ms;
  }
  
  int enemiesNumber(){
    return enemiesNumber;
  }
  
  int getEnemiesNumber(){
    return enemiesNumber;
  }
  
  void setEnemiesNumber(int en){
     enemiesNumber = en;
  }
  
  int levelNumber(){
    return levelNumber;
  }
  
  void setLevelNumber(int ln){
    levelNumber = ln;
  }
  
  int getLevelNumber(){
    return levelNumber;
  }
  
  int maxSeconds(){
    return maxSeconds;
  }
  
  void maxSeconds(int ms){
    maxSeconds = ms;
  }
  
  
}