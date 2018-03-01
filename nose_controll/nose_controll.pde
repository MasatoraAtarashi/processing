import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video; 
OpenCV opencv; 

Rectangle[] noses;

void setup() {
  size(800, 600);
  noStroke();
  fill(255);
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
  for (int i = 0; i < noses.length; i++) {
    ellipse(noses[0].x + 18, noses[0].y + 15, 30, 30);
  }
}

void captureEvent(Capture c) {
  c.read();
}