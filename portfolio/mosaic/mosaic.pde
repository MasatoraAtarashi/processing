PImage img;

import controlP5.*;
ControlP5 slider;
ControlP5 button;

Slider mosaicSize;
Slider mosaicRange;

boolean clickMode = true;

int myColor = color(0,255,0);

void setup() {
  size(800,600);
  background(0);
  
  img = loadImage("photo.jpg");
  img.resize(width,height);
  image(img,0,0);
  
  slider = new ControlP5(this);
  
  mosaicSize = slider.addSlider("MOSAIC_SIZE")
  .setPosition(20,20)
  .setRange(1,20)
  .setValue(5)
  .setColorForeground(myColor);
  
  mosaicRange = slider.addSlider("MOSAIC_RANGE")
  .setPosition(20,40)
  .setRange(1,100)
  .setValue(20)
  .setColorForeground(myColor);
  
  button = new ControlP5(this);
  button.addButton("mode")
  .setLabel("Mode Change")
  .setPosition(20,60)
  .setSize(100,40);
}

void draw() {
  noStroke();
}

int rectXStart;
int rectYStart;
void mousePressed(MouseEvent  event) {
  if(clickMode) {
    int mosaic = int(mosaicSize.getValue());
    int range = int(mosaicRange.getValue());
    int rectX = event.getX();
    int rectY = event.getY();
    for(int j = rectY-range; j < rectY+range; j = j + mosaic) {
      for(int i = rectX-range; i < rectX+range; i = i + mosaic) {
        color c = img.get(i,j);
        fill(c);
        rect(i,j,mosaic,mosaic);
      }
    }
  } else { 
    rectXStart = event.getX();
    rectYStart = event.getY();
  }
}

void mouseReleased(MouseEvent  event) {
  if(!clickMode) {
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
}

void mode() {
  if(clickMode) {
    clickMode = false;
  } else {
    clickMode = true;
  }
}