PImage img;

import controlP5.*;
ControlP5 cp5;

Slider mosaicSize;

void setup() {
  size(800,600);
  background(0);
  
  img = loadImage("photo.jpg");
  img.resize(width,height);
  image(img,0,0);
  
  cp5 = new ControlP5(this);
  
  int myColor = color(0,255,0);
  mosaicSize = cp5.addSlider("MOSAIC SIZE")
  .setPosition(20,20)
  .setRange(5,20)
  .setValue(10)
  .setColorForeground(myColor);
}

void draw() {
  noStroke();
}

int rectXStart;
int rectYStart;
void mousePressed(MouseEvent  event) {
  rectXStart = event.getX();
  rectYStart = event.getY();
}

void mouseReleased(MouseEvent  event) {
  int mosaic = int(mosaicSize.getValue());
  int rectXEnd = event.getX();
  int rectYEnd = event.getY();
  for(int j = rectYStart; j < rectYEnd; j = j + mosaic) {
    for(int i = rectXStart; i < rectXEnd; i = i + mosaic) {
      color c = img.get(i,j);
      fill(c);
      rect(i,j,mosaic,mosaic);
    }
  }
}