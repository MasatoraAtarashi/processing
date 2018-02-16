 int i;
 
 size(800, 600);
 background(0);
 colorMode(HSB, 360, 100, 100);
 noStroke();
 
 for(i=0; i<height; i++){
   fill(i*40.0/800.0,100,100);
   rect(0, height-i, width, 1);
 }
 
 fill(0,100,30);
 rect(0, height-180, width, 180);
 
 for(i=50; i<100; i++){
   //two line below are i=0;i<100
   //fill(i*400.0/160.0,100,100);//beautiful
   //fill(i*i,100,100);//beautiful
   fill(i*0.4,100,100);
   arc(width/2, height-180, 150-i, 150-i, -PI, 0);
 }