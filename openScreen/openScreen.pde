import processing.video.*;

PImage choose1;
PImage choose2;
PImage choose3;

Movie intro; 

void setup() { 
  fullScreen();
  //size(500,500);
  
  intro = new Movie(this, "intro.mp4");
  
  choose1 = loadImage("choose1.jpg");
  choose2 = loadImage("choose2.jpg");
  choose3 = loadImage("choose3.jpg");
}

void movieEvent(Movie m) {
  m.read();
}
void draw(){
  intro.loop();
  image(intro,0,0,width, height);
  fill(0);
  stroke(100,100,100);
  strokeWeight(5);
  rect(width*0.1,height*0.8,width*0.25, height*0.1);
  rect(width*0.4,height*0.8,width*0.25, height*0.1);
  rect(width*0.7,height*0.8,width*0.25, height*0.1);
  image(choose1,width*0.4,height*0.8,width*0.25, height*0.1);
  image(choose2,width*0.1,height*0.8,width*0.25, height*0.1);
  image(choose3,width*0.7,height*0.8,width*0.25, height*0.1);
}