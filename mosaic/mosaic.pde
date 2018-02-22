PImage img;

import controlP5.*;
ControlP5 cp5;

Slider mosaicSize;

void setup() {
  size(800,600);
  background(0);
  img = loadImage("photo.jpg");
  img.resize(width-100,height-100);
  image(img,50,50);
  
  cp5 = new ControlP5(this);
  
  mosaicSize = cp5.addSlider("MOSAIC SIZE")
  .setPosition(20,20)
  .setRange(5,20)
  .setValue(5);
  
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
      rectMode(CORNERS);
      rect(i,j,i+mosaic,j+mosaic);
    }
  }
}