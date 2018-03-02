import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video; 
OpenCV opencv; 

PVector location;
PVector velocity;
PVector noseLocationMin;
PVector noseLocationMax;

Rectangle[] noses;

void setup() {
  size(800, 600);
  noStroke();
  fill(255);
  location = new PVector(50, 50);
  velocity = new PVector(10, 10);
  noseLocationMin = new PVector(0,0);
  noseLocationMax = new PVector(0,0);
  video = new Capture(this, 800/2, 600/2);
  opencv = new OpenCV(this, 800/2, 600/2);
  opencv.loadCascade(OpenCV.CASCADE_NOSE);
  video.start();
}

void draw() {
  background(0);
  scale(2);
  opencv.loadImage(video);
  Rectangle[] noses = opencv.detect();
  //if(noses.length == 0) {
  //  noseLocationMin.x = 0;
  //  noseLocationMin.y = 0;
  //  noseLocationMax.x = 0;
  //  noseLocationMax.y = 0;
  //}
  for (int i = 0; i < noses.length; i++) {
    noseLocationMin.x = noses[0].x;
    noseLocationMin.y = noses[0].y;
    noseLocationMax.x = noses[0].width;
    noseLocationMax.y = noses[0].height;
    ellipse(noses[0].x + 18, noses[0].y + 15, 30, 30);
  }
  flow();
}

void captureEvent(Capture c) {
  c.read();
}

void flow() {
  location.add(velocity);
  fill(0, 127, 255); 
  ellipse(location.x, location.y, 20, 20);
  if(location.x > noseLocationMin.x || location.x < noseLocationMax.x) {
    velocity.x = velocity.x * -1;
  }
  if(location.y > noseLocationMin.y || location.y < noseLocationMax.y) {
    velocity.y = velocity.y * -1; 
  }
  if (location.x < 0 || location.x > width/2) {
    velocity.x = velocity.x * -1;
  }
  if (location.y < 0 || location.y > height/2) { 
    velocity.y = velocity.y * -1; 
  }
}