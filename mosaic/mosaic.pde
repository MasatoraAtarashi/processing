PImage img;

void setup() {
  size(800,600);
  img = loadImage("photo.jpg");
  img.resize(width,height);
  image(img,0,0);
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

int mosaic = 5;
void mouseReleased(MouseEvent  event) {
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