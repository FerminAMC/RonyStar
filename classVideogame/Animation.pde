class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  float xpos, ypos;
  
  Animation(String imagePrefix, int count, float xpos, float ypos) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".gif";
      images[i] = loadImage(filename);
    }
    
    this.xpos = xpos;
    this.ypos = ypos;
  }
  
  boolean turnOff(){
    return frame == imageCount - 1;
  }
  
  void pintate() {
      frame = (frame+1) % imageCount;
      image(images[frame], xpos, ypos - images[frame].height/2);
  }
  
  int getWidth() {
    return images[0].width;
  }
}