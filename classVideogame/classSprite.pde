class Sprite{
 PImage cell[];
  int cnt = 0, step = 0, dir = 0;
 
  Sprite() {
    cell = new PImage[4];
    for (int y = 0; y < 1; y++)
      for (int x = 0; x < 4; x++)
        cell[y*3+x] = iRony.get(x*50,y*41,50,41);
  }
 
  void turn(int _dir) {
    if (_dir >= 0 && _dir < 4) dir = _dir;
    println (dir);
  }
 
  void check() {
    if (cnt++ > 4) {
      cnt = 0;
      step++;
      if (step >= 3)
        step = 0;
    }
    int idx = dir*2 + (step == 3 ? 1 : step);
    buffer.image(cell[idx], rony.getPosX(), rony.getPosY());
    //println("Estoy pintando sprites");
  }
}