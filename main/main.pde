//This is the main sketch


import ddf.minim.*;

Minim minim;
//Creating arrays of instruments
AudioSample [] sbottles;
AudioSample [] stubes;
AudioSample [] sgarbage;
AudioSample [] swater;
//Creating arrays of Simon game samples
//AudioSample [] simonB;
//AudioSample [] simonT;
//AudioSample [] simonG;
//AudioSample [] simonW;

//Creating images 

PImage pwater;
PImage pgarbage;
PImage ptubes;
PImage pbottles;
PImage logo;

//Creating Objects of Instruments
PlayFree water;
PlayFree garbage;
PlayFree bottles;
PlayFree tubes;

//boolean check;




void setup () {
  fullScreen();
  //size(1000, 1000);
  //background(255);

  minim = new Minim(this);

  //adding audio samples to the arrays 
  sbottles = new AudioSample[5];
  sbottles[0] = minim.loadSample("b1.mp3");
  sbottles[1] = minim.loadSample("b2.mp3");
  sbottles[2] = minim.loadSample("b3.mp3");
  sbottles[3] = minim.loadSample("b4.mp3");
  sbottles[4] = minim.loadSample("b5.mp3");

  stubes = new AudioSample[5];
  stubes[0] = minim.loadSample("t1.mp3");
  stubes[1] = minim.loadSample("t2.mp3");
  stubes[2] = minim.loadSample("t3.mp3");
  stubes[3] = minim.loadSample("t4.mp3");
  stubes[4] = minim.loadSample("t5.mp3");

  swater = new AudioSample[5];
  swater[0] = minim.loadSample("w1.mp3");
  swater[1] = minim.loadSample("w2.mp3");
  swater[2] = minim.loadSample("w3.mp3");
  swater[3] = minim.loadSample("w4.mp3");
  swater[4] = minim.loadSample("w5.mp3");

  sgarbage = new AudioSample[5];
  sgarbage[0] = minim.loadSample("g1.mp3");
  sgarbage[1] = minim.loadSample("g2.mp3");
  sgarbage[2] = minim.loadSample("g3.mp3");
  sgarbage[3] = minim.loadSample("g4.mp3");
  sgarbage[4] = minim.loadSample("g5.mp3");

  // adding images

  pwater = loadImage("water.jpg");
  pgarbage = loadImage("garbage.jpg");
  pbottles  = loadImage("bottles.jpg");
  ptubes  = loadImage("tubes.jpg");
  logo = loadImage("logo.jpg");

  //Creating new objects - (X position, Y Position, Width, Height, Image name, Samples array name, background image)
  water = new PlayFree (width*0.20, height*0.20, width*0.3, height*0.25, pwater, swater);
  garbage = new PlayFree (width*0.20, height*0.80, width*0.3, height*0.25, pgarbage, sgarbage);
  bottles  = new PlayFree (width*0.80, height*0.20, width*0.3, height*0.25, pbottles, sbottles);
  tubes = new PlayFree (width*0.80, height*0.80, width*0.3, height*0.25, ptubes, stubes);
}

void draw () {

  screen1();
}
//Function that calls all the methods for the playFree screen
void screen1() {
  background(255);
  imageMode(CENTER);
  image(logo, width/2, height/2);
  water.display();
  water.mouseOver();
  garbage.display();
  garbage.mouseOver();
  bottles.display();
  bottles.mouseOver();
  tubes.display();
  tubes.mouseOver();
}