import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video; 
OpenCV opencv; 

Rectangle[] noses;

void setup() {
  size(800, 600);
  background(0);
  video = new Capture(this, 800/2, 600/2);
  opencv = new OpenCV(this, 800/2, 600/2);
  opencv.loadCascade(OpenCV.CASCADE_NOSE);
  video.start();
}

void draw() {
  scale(2);
  opencv.loadImage(video);
  Rectangle[] noses = opencv.detect();
  for (int i = 0; i < noses.length; i++) {
    strokeWeight(random(5,15));
    stroke(random(255),random(255),random(255));
    point(noses[0].x + 18, noses[0].y + 15);
  }
}

void captureEvent(Capture c) {
  c.read();
}