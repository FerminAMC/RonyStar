import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import processing.sound.*;
import com.dhchoi.CountdownTimer;
import com.dhchoi.CountdownTimerService;


CountdownTimer timer;
Animation start, transition, transitionFinal;
Map mapa;
Videogame vid;
ArrayList <Bullet> bala;
Character rony;
ArrayList <Enemy> enemy;
ArrayList<Animation> animacion;
HUD hud;
Level l;
Menu menu;
Sprite ronyw;

int enemies = 0;

float right, left, up;    // lvl 1
boolean MENU;
String timerCallbackInfo = "";
int ln;
int tamX = 50, tamY = 20;
//int WIDTH = 2200/tamX;     //Se generan en base al nivel
int WIDTH = 8700/tamX;
int HEIGHT = 650/tamY;
int[][] screen = new int[HEIGHT][WIDTH];
int lastBulletRony = 0;

PImage iRony, iEnemy, iBullet, shipBullet, iShip, iBoss, bossBullet,RonySprite;

PImage iRonySR, iRonySL;

PImage wasd, space, icon;
PFont fuente;
boolean isRunning, onTransition;


PGraphics buffer;
PImage mapa1;
PImage mapa2;
PImage mapa3;
PImage mapalvl2;
PImage mapaBoss;
PGraphics combinacion;

//tipo de archivos necesarios para el audio
AudioPlayer flush;
//objetos minim
Minim minim;
Minim s2min;


AudioPlayer player;
Minim back;

AudioPlayer playerCount;
Minim count;

AudioPlayer playerNasa;
Minim Nasa;

AudioPlayer playerEx;
Minim Explosion;

PApplet sketchPApplet;
int offset;

void onTickEvent(CountdownTimer t, long timeLeftUntilFinish) {
  timerCallbackInfo = "[tick] - timeLeft: " + timeLeftUntilFinish/1000 + "ms";
}

void onFinishEvent(CountdownTimer t) {
  timerCallbackInfo = "[finished]";
}

//cargar archivos
void setup(){
    sketchPApplet=this;
    size(800, 650);
    iRonySR = loadImage("../Characters/RonyNA_new.png"); 
    iRonySR.resize(50,50);
    iRony = loadImage("../Characters/sprite_sheet_ronyA.png");
    iRony.resize(200, 41);
    ronyw = new Sprite();
    RonySprite = loadImage("../Characters/sprite_1.png");
    RonySprite.resize(50,50);
    timer = CountdownTimerService.getNewCountdownTimer(this);
    mapalvl2 = loadImage("../Sprites/lvl2_rony.png");   //lvl 2
    mapa1 = loadImage("../Sprites/lvl_1.png");   //lvl 1
    mapa2 = loadImage("../Sprites/lvl_2.png");   //lvl 1
    mapa3 = loadImage("../Sprites/lvl_3.png");   //lvl 1
    mapaBoss = loadImage("../Sprites/boss_level.png");
   //iRony = loadImage("../Characters/R_estar.png");
   
   iEnemy = loadImage("../Characters/robot.png");
   
   iEnemy.resize(50, 50);
   iBullet = loadImage("../Sprites/bullet.png");
   iBullet.resize(50,50);
   shipBullet = loadImage("../Sprites/shipBullet.png");
   shipBullet.resize(50,50);
   iShip = loadImage("../Characters/Nave1.gif");
   iShip.resize(50,50);
   iBoss = loadImage("../Characters/Boss1.png");
   iBoss.resize(310, 140);
   bossBullet = loadImage("../Sprites/missile.png");
   bossBullet.resize(50, 40);
   
   wasd = loadImage("../Sprites/wasd.png");
   space = loadImage("../Sprites/spaceKey.png");
   
   buffer = createGraphics(width, height);
   
   start = new Animation("../Sprites/menuinicio/menuinicio", 89, width/2, height, width, height);
   onTransition = false;
   transition = new Animation("../Sprites/transition_good/frame", 27, width/2, height, width, height);
   transitionFinal = new Animation("../Sprites/transition/frame", 25, width/2, height, width, height);
   
   fuente = createFont("../fonts/majorforce.ttf", 32);
   //fuente = createFont("../fonts/justice.ttf", 32);
   vid = new Videogame();
   vid.startLevel();
   animacion = new ArrayList();
   MENU = true;
   isRunning = false;
   minim = new Minim(this);
   s2min = new Minim(this);
   Nasa = new Minim(this);
   Explosion = new Minim(this);
   flush = minim.loadFile("bullet.mp3");
   
   back = new Minim(this);
   count = new Minim(this);
   player = back.loadFile("piratas.mp3",2048);
   playerNasa = back.loadFile("countdownasa.mp3", 2048);
   playerCount = count.loadFile("countdown.mp3", 2048);
   playerEx = count.loadFile("explosion.mp3", 2048);
   player.loop();   
   offset = 0;

}


//ejecutar juego
void draw(){
  
  buffer.beginDraw();
  buffer.textFont(fuente);
  mapa.drawboard((int)(rony.getPosX()));    // Esto tiene que ir dentro del vid.pintate y validar que rony exista
  vid.pintate();
  if(onTransition){
    frameRate(5);
    MENU = true;
    if(l.getLevelNumber() == 2){
      if(transition.turnOff()){
        player.play();
        onTransition = false;
        MENU = false;
        frameRate(60);
        playerNasa.close();
      }else{
        playerCount.pause();
        player.pause();
        transition.pintate();
        playerNasa.play();
      }
    }else if(l.getLevelNumber() == 3){
      if(transitionFinal.turnOff()){
        player.play();
        onTransition = false;
        MENU = false;
        frameRate(60);
        playerEx.close();
      }else{
        playerCount.pause();
        player.pause();
        transitionFinal.pintate();
        playerEx.play();
      }
    }
  }

  if(!MENU){
  
    if(left != 0)
    ronyw.check();
    else{
      if (right == 0)
    rony.pintate();
    }
    
    if(right != 0)
    ronyw.check();
    else{
      if(left == 0)
    rony.pintate();
    }
    
    if(rony.getPosX() > 95 && rony.getPosX() < 105){
      offset = int(offset - rony.getXSpeed());
    }
    vid.move(right, left, up, l.getGravity());

    timer.start();

    isRunning = true;
    //vid.move(right, left, up, gravity);
    for(Animation anim : animacion){
      if(anim.turnOff()){
        animacion.remove(anim);
        break;
      }else{
        anim.pintate();
      }
    }
    buffer.noStroke();
    
    for ( int ix = 0; ix < WIDTH; ix++ ) {
      for ( int iy = 0; iy < HEIGHT; iy++ ) {
        if(iy == l.getSuelo()){             //lvl 1
        //if(iy == 31){             //lvl 2
          screen[iy][ix] = 1;
        }else{
          buffer.fill(240,200,50);
          switch(screen[iy][ix]) {
            case 1: buffer.rect(ix * tamX - offset,iy*tamY,tamX,tamY); // Cambio de signo
          }
        }
      }
    }
  }else{
    timer.stop(CountdownTimer.StopBehavior.STOP_AFTER_INTERVAL);
    isRunning = false;
  }
  buffer.endDraw();
  image(buffer.get(0, 0, buffer.width, buffer.height), 0, 0);
 }

boolean place_free(int xx, int yy){
  //checks if a given point (xx,yy) is free (no block at that point) or not
  yy = int(floor((float)yy/tamY));
  xx += offset; // Cambio signo
  //xx += abs(offset);
  xx = int(floor((float)xx/tamX));
  //if ( xx > -1 && xx < screen[0].length && yy > -1 && yy < screen.length ) {
    if ( xx > -1 && xx < l.getGraphicsSize()/tamX && yy > -1 && yy < screen.length ) {
    if ( screen[yy][xx] == 0 ) {
      return true;
    }
  }
  return false;
}  

  void keyPressed(){
  if(keyPressed == true){
    if(key == 'w' || key == 'W'){
      if(MENU == true){
        menu.up();
      }
      else{
        up = 1;
      }
    }
    if(key == 's' || key == 'S'){
      if(MENU == true){
        menu.down();
      }
    }
    if(key == 'd' || key == 'D'){
      if(MENU == true){
        menu.left();
      }else{
        right = 1;
        rony.setDirection(1);
     
      }
    }
    if(key == 'a' || key == 'A'){
      if(MENU == true){
        menu.right();
      }else{
        left = 1;
        rony.setDirection(-1);
        //iRony.translate(rony.getPosX(), rony.getPosY());
      }
    }
    
    if(key == ' ' && millis() - lastBulletRony > 500){
      if(!MENU){
        flush.rewind();
        flush.play();
        lastBulletRony = millis();
        bala.add(new Bullet(iBullet, -rony.getDirection(), rony.getPosX() , rony.getPosY(), 0, 20 * rony.getDirection(),  0, "rony"));
        //  public Bullet(PImage image, float direction, PVector pos, int damage, float spX, float spY, String tipo){

      }
    }
    
    if(keyCode == ENTER){
      if(MENU == true){
        MENU = menu.select(vid);
      }
    }
    
    if(key == 'p' || key == 'P'){
      isRunning = !isRunning;
      if(!isRunning)
      player.pause();
      
      
      if(MENU == true && menu.menuNumber == 2){
          MENU = false;
          player.play();
        }
        right = 0;
        left = 0;
        up = 0;
        MENU = true;
        menu.setMenuNumber(2);
        
    }
  }
 }
  
  void keyReleased(){
    if(key == 'd' || key == 'D'){
      if(!MENU)
      right = 0;
    }
    if(key == 'a' || key == 'A'){
      if(!MENU)
      left = 0;
    }
    if(key == 'w' || key == 'W'){
      if(!MENU)
      up = 0;
    }
    if(key == ' '){
      if(!MENU)
      lastBulletRony = 0;
    }
}

class Videogame{
  
  public Videogame(){

    l = new Level(25,1,90,.25, 1100, -274, 25, 2112, 2200);
      //public Level(int en, int ln, int ms, float gravity, int limScrIzq, int limScrDer, int suelo, int winPt, int graphicsSize )

    enemy = new ArrayList();
    rony = new Character(RonySprite, 5, 0, false, 100, 450, 15, 2);
    bala = new ArrayList();
    menu = new Menu(1, wasd, space);

    //public Enemy(PImage image, int resistance, int value, float posX, float posY,
    //float jumpSpeed, float walkSpeed, int direction,  String tipo){
    enemy.add(new Enemy(iEnemy, 2, 100, -100000, 1000000, 20, 0,1, "equis"));
    hud = new HUD();
  }
  
  void startLevel(){
    right = 0;
    left = 0;
    up = 0;
    timer.configure(100, l.getMaxSeconds() * 1000);
    
    combinacion = createGraphics(l.getGraphicsSize(), 650, JAVA2D);  //lvl 1
    //combinacion = createGraphics(8700, 650, JAVA2D);   // lvl 2
    
    combinacion.beginDraw();
    if(l.getLevelNumber() == 1){
      combinacion.image(mapa1, 0,0);     //lvl 1
      combinacion.image(mapa2, 611, 0);   //lvl 1
      combinacion.image(mapa3,1221,0);    // lvl 1
    }else if(l.getLevelNumber() == 2){
      combinacion.image(mapalvl2,0, 0);   //lvl luna
    }else if(l.getLevelNumber() == 3){
      combinacion.image(mapaBoss, 0, 0);  //Boss lvl
    }
    combinacion.endDraw();
    mapa = new Map(combinacion, 0);
  }
  void restart(){

    enemy.clear();
    enemies = 0;
    enemy.add(new Enemy(iEnemy, 2, 100, -100000, 1000000, 20, 0,1, "equis"));
    if(l.getLevelNumber() == 3){
      enemy.add(new Enemy(iBoss, 150, 10000, width-iBoss.width/2, 150, 20, .7, -1, "boss"));
      enemies++;
    }
    rony.icon = RonySprite; // Depende del nivel
    rony.lives = 5;

    playerCount.pause();
    player.pause();
    player.rewind();
    player.play();
    

    rony.score = 0;
    rony.x = 100;
    rony.y = 400;
    rony.jumpSpeed = 20;
    rony.walkSpeed = 2;
    bala.clear();
    animacion.clear();

    offset = 0;
    timer.reset(CountdownTimer.StopBehavior.STOP_AFTER_INTERVAL);
    for ( int ix = 0; ix < WIDTH; ix++ ) {
      for ( int iy = 0; iy < HEIGHT; iy++ ) {
        if(iy == l.getSuelo()){ 
          screen[iy][ix] = 1;
        }else{
          screen[iy][ix] = 0;
        }
      }
    }
}
  
  void move(float right, float left, float up, float gravity){

    if(!MENU){
      for(Enemy e : enemy){
        e.move(gravity, rony);
        if(millis() % 30 == 0){
          if(e.getTipo() == "boss"){
            bala.add(new Bullet(bossBullet, -e.getDirection(), e.getPosX()+50 - offset, e.getPosY(), 0, 10 * e.getDirection(), 0, "normalEnemy"));
            flush.rewind();
            flush.play();
          }
        }
        if(e.getTiempoVida() % 103 == 0){
         
          if(e.getTipo() == "volador"){
            bala.add(new Bullet(shipBullet, e.getDirection(), e.getPosX() - offset, e.getPosY(), 0, 0, 20 * e.getDirection(), "shipEnemy")); // Cambio de signo
            flush.rewind();
            flush.play();
          }else if(e.getTipo() == "normal"){
            bala.add(new Bullet(iBullet, -e.getDirection(), e.getPosX()+50 - offset, e.getPosY(), 0, 10 * e.getDirection(), 0, "normalEnemy")); // Cambio de signo
            flush.rewind();
            flush.play();
          }
        }
      }
      rony.move(left, right, up, l.getGravity());
    }
  }
  
  void pintate(){
   //mapa.pintate(rony);
   
    if(MENU == true){
     
      menu.pintate();
    }
    else{
      //rony.pintate();
      if(isRunning == true)
      hud.pintate();
      hud.setScore(rony.score);
      hud.setLivesText(rony.lives);
      for(Enemy e : enemy){
        e.pintate();
        if(e.die()){
          enemy.remove(e);
          rony.score +=100;
          rony.lives++;
          break;
        }
      }
      if(rony.lives < 1){
        MENU = true;
        menu = new Menu(1, wasd, space);
        isRunning = false; 
        rony.lives = 5;
        right = 0;
        left = 0;
        up = 0;
        rony.x = 100;
        rony.y = 400;
        rony.jumpSpeed = 20;
        rony.walkSpeed = 2;
        enemy.clear();
        bala.clear();
        enemies = 0;
        offset = 0;
        timer.reset(CountdownTimer.StopBehavior.STOP_AFTER_INTERVAL);
      }
      int interval = 5;
      int spawnT = interval - int(millis()/10);
      
     if (enemies < l.getEnemiesNumber()){
      
      if(spawnT % 103 == 0){
        enemy.add(new Enemy(iEnemy, 1, 100, width + offset, 450, 20, 2, -1, "normal"));
        enemies++;
      }
      if(spawnT % 203 == 0){
        enemy.add(new Enemy(iEnemy, 1, 100, width + offset, 450, 20, 2, -1, "brincador"));
        enemies++;
      }
      if(spawnT % 303 == 0){
        enemy.add(new Enemy(iShip, 2, 100, width + offset, 100, 20, 2, -1, "volador"));
        enemies++;
      }
     }
      boolean aux = false;
      for(Bullet b : bala){
        b.pintate();
        if(b.hitRony(rony)){
          animacion.add(new Animation("../Sprites/bulletHit/bulletHit", 25, b.position.x, b.position.y));
          bala.remove(b);
          aux = true;
        }
        for(Enemy e : enemy){
          if(b.hit(e)){
            animacion.add(new Animation("../Sprites/bulletHit/bulletHit", 25, b.position.x, b.position.y));
            bala.remove(b);
            aux = true;
            break;
          }
        }
        if(aux)break;
      }
      //Has ganado debería ser una función de vidgame porque hace más acciones
    if(rony.getPosX() + offset >= l.getWinPt() && enemy.size()==1){ 
        buffer.text("Has ganado", height/2, width/2);
        timer.stop(CountdownTimer.StopBehavior.STOP_IMMEDIATELY);
        timer = CountdownTimerService.getNewCountdownTimer(sketchPApplet);
        if(l.getLevelNumber() == 1){
          l = new Level(50,2,180,.12, 4350, -2957, 31, 8000, 8700);
        }else if(l.getLevelNumber() == 2){
          l = new Level(1,3, 180 , .20 , 536, 281, 29, 0, 1080);
        }
        
        startLevel();
        restart();
        onTransition = true;
     }
    }
  }
}

void mousePressed() {
//Left click creates/destroys a block
  if ( mouseButton == LEFT ) {
    screen[int(floor((float)mouseY/tamY))][int(floor((float)(mouseX + offset)/ tamX))] ^= 1;
  }
}