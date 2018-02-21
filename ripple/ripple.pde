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

class Circle {
  float diameter = 100;
  Circle() {}
  
  void draw() {
    if(diameter < 1000){
      ellipse(width/2,height/2,diameter,diameter);
      diameter += 20;
    }
  }
}