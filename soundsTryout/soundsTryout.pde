// This project is to try and play the different instruments while switching between them.

import ddf.minim.*;

Minim minim;

//Creating arrays of samples for each instrument
AudioSample [] bottles;
AudioSample [] tubes;
AudioSample [] garbage;
AudioSample [] water;

//variable that change the instrument
int count;

void setup () {
  size(300, 300);
  minim = new Minim(this);

  //Loading files into the arrays
  bottles = new AudioSample[5];
  bottles[0] = minim.loadSample("b1.mp3");
  bottles[1] = minim.loadSample("b2.mp3");
  bottles[2] = minim.loadSample("b3.mp3");
  bottles[3] = minim.loadSample("b4.mp3");
  bottles[4] = minim.loadSample("b5.mp3");

  tubes = new AudioSample[5];
  tubes[0] = minim.loadSample("t1.mp3");
  tubes[1] = minim.loadSample("t2.mp3");
  tubes[2] = minim.loadSample("t3.mp3");
  tubes[3] = minim.loadSample("t4.mp3");
  tubes[4] = minim.loadSample("t5.mp3");

  water = new AudioSample[5];
  water[0] = minim.loadSample("w1.mp3");
  water[1] = minim.loadSample("w2.mp3");
  water[2] = minim.loadSample("w3.mp3");
  water[3] = minim.loadSample("w4.mp3");
  water[4] = minim.loadSample("w5.mp3");

  garbage = new AudioSample[5];
  garbage[0] = minim.loadSample("g1.mp3");
  garbage[1] = minim.loadSample("g2.mp3");
  garbage[2] = minim.loadSample("g3.mp3");
  garbage[3] = minim.loadSample("g4.mp3");
  garbage[4] = minim.loadSample("g5.mp3");
}




void draw () {
  //Making sure the count will stay between 0-3
  if (count > 3){
    count = 0;
  }
  if (count < 0){
    count = 3;
  }
}

void keyPressed() {
  // 'p' 'o' change instrument
  // 'q' 'w' 'e' 'r' 't' playing the different samples

  if (key == 'p') {
    count+=1;
  }
if (key == 'o') {
    count-=1;
  }
  //if count == 0 --- Tubes
  if (count == 0) {
    if (key == 'q') {
      tubes[0].trigger();
    }
    if (key == 'w') {
      tubes[1].trigger();
    }
    if (key == 'e') {
      tubes[2].trigger();
    }
    if (key == 'r') {
      tubes[3].trigger();
    }
    if (key == 't') {
      tubes[4].trigger();
    }
  }

  //if count == 1 --- water
  if (count == 1) {
    if (key == 'q') {
      water[0].trigger();
    }
    if (key == 'w') {
      water[1].trigger();
    }
    if (key == 'e') {
      water[2].trigger();
    }
    if (key == 'r') {
      water[3].trigger();
    }
    if (key == 't') {
      water[4].trigger();
    }
  }
  //if count ==2  --- garbage
  if (count == 2) {
    if (key == 'q') {
      garbage[0].trigger();
    }
    if (key == 'w') {
      garbage[1].trigger();
    }
    if (key == 'e') {
      garbage[2].trigger();
    }
    if (key == 'r') {
      garbage[3].trigger();
    }
    if (key == 't') {
      garbage[4].trigger();
    }
  }
  
    //if count == 3 --- bottles
  if (count == 3) {
    if (key == 'q') {
      bottles[0].trigger();
    }
    if (key == 'w') {
      bottles[1].trigger();
    }
    if (key == 'e') {
      bottles[2].trigger();
    }
    if (key == 'r') {
      bottles[3].trigger();
    }
    if (key == 't') {
      bottles[4].trigger();
    }
  }
}