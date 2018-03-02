int pressCount1p = 0;
int pressCount2p = 0;
boolean inputMode = true;

void setup() {
  size(800,600);
}

void draw() {
  background(0);
  initialize();
  drawGauge();
  if(pressCount1p >= height) {
    win1p();
  }
  if(pressCount2p >= height) {
    win2p();
  }
}

void initialize() {
  stroke(255);
  line(width/2, 0, width/2, height);
  textSize(30);
  fill(255,0,0);
  text("1p", width/4-15, 50);
  fill(0,0,255);
  text("2p", width/4*3-15, 50);
  textSize(15);
  fill(255);
  text("hit A key continuously", width/4-80, height/2);
  text("hit L key continuously", width/4*3-80, height/2);
}

void drawGauge() {
  noStroke();
  rectMode(CORNERS);
  fill(255,0,0);
  rect(0, height-pressCount1p, width/2-1, height);
  fill(0,0,255);
  rect(width/2+1, height-pressCount2p, width, height);
}

void keyPressed() {
  if(inputMode) {
    if(key == 'a') {
      pressCount1p += 5;
    }
    if(key == 'l') {
      pressCount2p += 5;
    }
    
    //cheat
    if(key == 's') {
      pressCount1p += 6;
    }
    if(key == 'k') {
      pressCount2p += 6;
    }
  }
  
  //reset
  if(key == 'r') {
     reset();
  }
}

void win1p() {
  inputMode = false;
  background(255);
  fill(0);
  text("1p win!! you have the golden finger!!", width/2-140, height/2);
  text("press R key to reset", width/2-80, height/2+50);
}

void win2p() {
  inputMode = false;
  background(255);
  fill(0);
  text("2p win!! you have the golden finger!!", width/2-140, height/2);
  text("press R key to reset", width/2-80, height/2+50);
}

void reset() {
   pressCount1p = 0;
   pressCount2p = 0;
   inputMode = true;
   initialize();
}