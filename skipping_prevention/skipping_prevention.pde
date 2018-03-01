import gab.opencv.*;
import processing.video.*;
import java.awt.*;
import processing.sound.*;
SoundFile soundfile;

Capture video; 
OpenCV opencv;
OpenCV opencv2;

void setup() {
  size(640, 480);
  soundfile = new SoundFile(this, "blip01.mp3");
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_EYE);
  opencv2 = new OpenCV(this, 640/2, 480/2);
  opencv2.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  video.start();
}
 
void draw() {
  scale(2);
  opencv.loadImage(video);
  opencv2.loadImage(video);
  image(video, 0, 0 );
  
  Rectangle[] eyes = opencv.detect();
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  for (int i = 0; i < eyes.length; i++) {
    rect(eyes[i].x, eyes[i].y, eyes[i].width, eyes[i].height);
  }
  
  Rectangle[] faces = opencv2.detect();
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  for (int i = 0; i < faces.length; i++) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
  
  if(eyes.length <= 0 && faces.length > 0) {
    soundfile.play();
  }
}
 
void captureEvent(Capture c) {
  c.read();
}