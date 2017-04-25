import ddf.minim.*;

Minim minim;
//Creating arrays of instruments
AudioSample [] sbottles;
AudioSample [] stubes;
AudioSample [] sgarbage;
AudioSample [] swater;
//Creating arrays of Simon game samples
AudioSample [] simonB;
AudioSample [] simonT;
AudioSample [] simonG;
AudioSample [] simonW;

AudioSample applause;
AudioSample tryAgain;

boolean answer;

void setup() {
  //fullScreen();
  size(100,100);
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

  simonB = new AudioSample[8];
  simonB[0] = minim.loadSample("sb_1.mp3");
  simonB[1] = minim.loadSample("sb_2.mp3");
  simonB[2] = minim.loadSample("sb_3.mp3");
  simonB[3] = minim.loadSample("sb_4.mp3");
  simonB[4] = minim.loadSample("sb_5.mp3");
  simonB[5] = minim.loadSample("sb_6.mp3");
  simonB[6] = minim.loadSample("sb_7.mp3");
  simonB[7] = minim.loadSample("sb_8.mp3");

  simonT = new AudioSample[8];
  simonT[0] = minim.loadSample("st_1.mp3");
  simonT[1] = minim.loadSample("st_2.mp3");
  simonT[2] = minim.loadSample("st_3.mp3");
  simonT[3] = minim.loadSample("st_4.mp3");
  simonT[4] = minim.loadSample("st_5.mp3");
  simonT[5] = minim.loadSample("st_6.mp3");
  simonT[6] = minim.loadSample("st_7.mp3");
  simonT[7] = minim.loadSample("st_8.mp3");

  simonG = new AudioSample[8];
  simonG[0] = minim.loadSample("sg_1.mp3");
  simonG[1] = minim.loadSample("sg_2.mp3");
  simonG[2] = minim.loadSample("sg_3.mp3");
  simonG[3] = minim.loadSample("sg_4.mp3");
  simonG[4] = minim.loadSample("sg_5.mp3");
  simonG[5] = minim.loadSample("sg_6.mp3");
  simonG[6] = minim.loadSample("sg_7.mp3");
  simonG[7] = minim.loadSample("sg_8.mp3");

  simonW = new AudioSample[8];
  simonW[0] = minim.loadSample("sw_1.mp3");
  simonW[0] = minim.loadSample("sw_1.mp3");
  simonW[0] = minim.loadSample("sw_1.mp3");
  simonW[0] = minim.loadSample("sw_1.mp3");
  simonW[0] = minim.loadSample("sw_1.mp3");
  simonW[0] = minim.loadSample("sw_1.mp3");
  simonW[0] = minim.loadSample("sw_1.mp3");
  simonW[0] = minim.loadSample("sw_1.mp3");

  applause = minim.loadSample("applause.mp3");
  tryAgain = minim.loadSample("tryAgain.mp3");

  answer = false;
}

void draw() {
  simonG[1].trigger();
  while (answer == false) {
    
    if (keyPressed) {
      if (key == 'q' || key == 'Q') {
        if (key == 'w' || key == 'W') { 
          if (key == 'q' || key == 'Q') {
            if (key == 'w' || key == 'W') {
              answer = true;
            }
          }
        }
      }
    } // end of 1st trigger
    else {
      simonG[1].trigger();
      answer= false;
    }
  }
  answer = false;
  simonG[2].trigger();
  while (answer == false) {
    
    if (keyPressed) {
      if (key == 'q' || key == 'Q') {
        if (key == 'w' || key == 'W') { 
          if (key == 'q' || key == 'Q') {
            if (key == 'w' || key == 'W') {
              if (key == 'q' || key == 'Q') {
                if (key == 'w' || key == 'W') { 
                  if (key == 'q' || key == 'Q') {
                    if (key == 'w' || key == 'W') {
                      answer = true;
                    }
                  }
                }
              }
            }
          }
        }
      }
    } else {
      simonG[2].trigger();
      answer = false;
    }
  }
  answer = false;
}

void keyPressed() {
  if (key == 'q') {
    sgarbage[0].trigger();
  }
  if (key == 'w') {
    sgarbage[1].trigger();
  }
  if (key == 'e') {
    sgarbage[2].trigger();
  }
  if (key == 'r') {
    sgarbage[3].trigger();
  }
  if (key == 't') {
    sgarbage[4].trigger();
  }
}