int NUM = 7;
PVector[] size = new PVector[NUM];
PVector[] location = new PVector[NUM];
PVector[] velocity = new PVector[NUM];
void setup() {
  size(800,600);
  frameRate(900);
  for(int i = 0; i < NUM; i++) {
     size[i] = new PVector(20,20);
     location[i] = new PVector(random(width),random(height));
     velocity[i] = new PVector(1,1);
  }
}

void draw() {
  background(255);
  stroke(0,127,255);
  fill(255,255,255,0);
  for(int i = 1; i < NUM; i++) {
    float max = random(30,50);
    if(size[i].x < max) {
      size[i].add(velocity[i]);
      ellipse(location[i].x,location[i].y,size[i].x,size[i].y);
    } else {
      location[i] = new PVector(random(width),random(height));
      size[i] = new PVector(20,20);
    }
  }
}