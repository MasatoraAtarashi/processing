int NUM;
Circle circle;
void setup() {
  size(800,600);
  frameRate(60);
  circle = new Circle();
}

int num = 120;
void draw() {
  background(255);
  stroke(0,127,255);
  fill(255,255,255,0);
  circle.draw();
}

void mousePressed(MouseEvent  event) {
  circle.x = event.getX();
  circle.y = event.getY();
  circle.diameter = 100;
}

class Circle {
  float diameter = 100;
  float x = width/2;
  float y = height/2;
  Circle() {}
  
  void draw() {
    if(diameter < 1000){
      ellipse(x,y,diameter,diameter);
      diameter += 20;
    }
  }
}