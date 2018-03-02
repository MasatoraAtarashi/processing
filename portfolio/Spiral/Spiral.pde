void setup(){
  size(800, 800);
  background(0);
  fill(255);
  textSize(30);
}
 
void draw(){
   translate(width/2, height/2);
}

int keyCount = 0;
void keyPressed() {
  keyCount++;
  change();
  fill(random(255),random(255),random(255));
  text(key, 0, 0);
}

void change() {
   rotate(PI/16*keyCount);
   translate(2*keyCount,1*keyCount);
}