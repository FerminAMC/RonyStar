class Level{
int enemiesNumber;
int levelNumber;
int maxSeconds;
float gravity;
int limScrIzq, limScrDer;
int suelo, winPt, graphicsSize;

  public Level(){
    enemiesNumber = 10;
    levelNumber = 1;
    maxSeconds = 60;
  }
  
  public Level(int en, int ln, int ms, float gravity, int limScrIzq, int limScrDer, int suelo, int winPt, int graphicsSize ){
    enemiesNumber = en;
    levelNumber = ln;
    maxSeconds = ms;
    this.gravity = gravity;
    this.limScrIzq = limScrIzq;
    this.limScrDer = limScrDer;
    this.suelo = suelo;
    this.winPt = winPt;
    this.graphicsSize = graphicsSize;
  }
  float getGravity(){
    return this.gravity;
  }
  int getLimScrIzq(){
    return limScrIzq;
  }
  int getLimScrDer(){
    return limScrDer;
  }
  int getSuelo(){
    return suelo;
  }
  int getWinPt(){
    return winPt;
  }
  int getGraphicsSize(){
    return this.graphicsSize;
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
  
  int getLevelNumber(){
    return levelNumber;
  }
  
  void setLevelNumber(int ln){
    levelNumber = ln;
  }
  
  int getMaxSeconds(){
    return maxSeconds;
  }
  
  void maxSeconds(int ms){
    maxSeconds = ms;
  }
  
  
}