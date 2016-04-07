PImage mapa1;
PImage mapa2;
PImage mapa3;
PGraphics combinacion;

void setup(){
size(2228, 668);
mapa1 = loadImage("../lvl_1.png");
mapa2 = loadImage("../lvl_2.png");
mapa3 = loadImage("../lvl_3.png");

combinacion = createGraphics(2228, 668, JAVA2D);

combinacion.beginDraw();
combinacion.image(mapa1, 0,0);
combinacion.image(mapa2, 980, 0);
combinacion.image(mapa3,1959,0);
combinacion.endDraw();

}

void draw(){

background(combinacion);


}