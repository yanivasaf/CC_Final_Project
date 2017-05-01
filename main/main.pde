//This is the main sketch
//***Click the mouse to start the project***

import ddf.minim.*;
import processing.video.*;
import processing.serial.*;

Serial myserial;

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
//playbacks to play with
AudioPlayer bottlesPB;
AudioPlayer waterPB;
AudioPlayer garbagePB;
AudioPlayer tubesPB;


//Creating images 

PImage pwater;
PImage pgarbage;
PImage ptubes;
PImage pbottles;
PImage logo;
PImage choose1;
PImage choose2;
PImage choose3;
PImage menu;

//Creating Objects of Instruments
PlayFree water;
PlayFree garbage;
PlayFree bottles;
PlayFree tubes;

//creating objects of titles for open screen
OpenScreen title1;
OpenScreen title2;
OpenScreen title3;


int button;
int inst;


boolean open;
boolean play;
boolean who;
boolean simon;

boolean trig1;
boolean trig2;
boolean trig3;
boolean trig4;
boolean trig5;

boolean playwater;
boolean playbottles;
boolean playgarbage;
boolean playtubes;


Movie intro;
Movie about;
Movie teasWater;
Movie teasTubes;
Movie teasBottles;
Movie teasGarbage;

//-------------------------------------------------------------------------

void setup () {
  fullScreen();
  //size(1080, 720);
  
  //creating a derial that connected to the arduino
  myserial = new Serial (this, "/dev/cu.usbmodem1411", 9600);

  intro = new Movie(this, "intro.mp4");//intro movie
  about = new Movie(this, "aboutMayumana.mp4");//About mayumana movie

  //teasers movies
  teasWater = new Movie(this, "teaserWater.mp4");//water teaser
  teasTubes = new Movie(this, "teaserTubes.mp4");//tubes teaser
  teasBottles = new Movie(this, "teaserBottles.mp4");//bottles teaser
  teasGarbage = new Movie(this, "teaserGarbage.mp4");//garbage teaser

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

  //loading playbacks
  bottlesPB = minim.loadFile("pbottles.mp3");
  waterPB = minim.loadFile("pwater.mp3");
  garbagePB = minim.loadFile("pgarbage.mp3");
  tubesPB = minim.loadFile("ptubes.mp3");


  // adding images

  pwater = loadImage("water.jpg");
  pgarbage = loadImage("garbage.jpg");
  pbottles  = loadImage("bottles.jpg");
  ptubes  = loadImage("tubes.jpg");
  logo = loadImage("logo.jpg");
  choose1 = loadImage("choose1.jpg");
  choose2 = loadImage("choose2.jpg");
  choose3 = loadImage("choose3.jpg");
  menu = loadImage ("menu.jpg");

  //Creating new objects for instruments - (X position, Y Position, Width, Height, Image name, Samples array name, playback file)
  water = new PlayFree (width*0.20, height*0.20, width*0.3, height*0.25, pwater, swater, waterPB);
  garbage = new PlayFree (width*0.20, height*0.80, width*0.3, height*0.25, pgarbage, sgarbage, garbagePB);
  bottles  = new PlayFree (width*0.80, height*0.20, width*0.3, height*0.25, pbottles, sbottles, bottlesPB);
  tubes = new PlayFree (width*0.80, height*0.80, width*0.3, height*0.25, ptubes, stubes, tubesPB);

  //Creating new objects for open screen - (X position, Y Position, Width, Height, Image name, video intro, video about)

  title1 = new OpenScreen (width/2-width*0.3, height*0.8, width*0.25, height*0.1, choose2);
  title2 = new OpenScreen (width/2, height*0.8, width*0.25, height*0.1, choose1);
  title3 = new OpenScreen (width/2+width*0.3, height*0.8, width*0.25, height*0.1, choose3);

  //used to choose screens
  button = 0;
  //used to choose instrument
  inst = 0;

  //used for state machine
  open =false;
  play= false;
  who= false;
  simon=false;

  //used to play the right instrument
  playwater = false;
  playbottles = false;
  playtubes = false;
  playgarbage = false;

  //setting the variables that control the triggers
  trig1=false;
  trig2=false;
  trig3=false;
  trig4=false;
  trig5=false;
}

//-------------------------------------------------------------------------------

void draw () {
  
  //getting data from the arduino
  arduino();

//using the state machine - call the proper function
  //if choose open screen
  if (open == true) {
    openscreen();
  }
  //if choose to play the instruments
  if (play == true) {
    playfree();
    
    if (playwater == true) {//if choose the water instrument
    //reset other teasers videos
      teasTubes.stop();
      teasBottles.stop();
      teasGarbage.stop();
      //play teaser video
      teasWater.play();
      imageMode(CORNER);
      image(teasWater, 0, 0, width, height);
      if (teasWater.available() == false) {//when the movie is over - run the rest of the methods
        imageMode(CENTER);
        back2menu();//back to open screen logo
        water.display(trig1, trig2, trig3, trig4, trig5);
        tubes.display(trig1, trig2, trig3, trig4, trig5);
        bottles.display(trig1, trig2, trig3, trig4, trig5);
        garbage.display(trig1, trig2, trig3, trig4, trig5);
        water.playinstrument();
        water.playback();
      }
    } else if (playtubes == true) {
      teasWater.stop();
      teasBottles.stop();
      teasGarbage.stop();
      teasTubes.play();
      imageMode(CORNER);
      image(teasTubes, 0, 0, width, height);
      if (teasTubes.available() == false) {
        back2menu();
        imageMode(CENTER);
        water.display(trig1, trig2, trig3, trig4, trig5);
        tubes.display(trig1, trig2, trig3, trig4, trig5);
        bottles.display(trig1, trig2, trig3, trig4, trig5);
        garbage.display(trig1, trig2, trig3, trig4, trig5);
        tubes.playinstrument();
        tubes.playback();
      }
    } else if (playbottles == true) {
      teasWater.stop();
      teasTubes.stop();
      teasGarbage.stop();
      teasBottles.play();
      imageMode(CORNER);
      image(teasBottles, 0, 0, width, height);
      if (teasBottles.available() == false) {
        back2menu();
        imageMode(CENTER);
        water.display(trig1, trig2, trig3, trig4, trig5);
        tubes.display(trig1, trig2, trig3, trig4, trig5);
        bottles.display(trig1, trig2, trig3, trig4, trig5);
        garbage.display(trig1, trig2, trig3, trig4, trig5);
        bottles.playinstrument();
        bottles.playback();
      }
    } else if (playgarbage == true) {
      teasWater.stop();
      teasTubes.stop();
      teasBottles.stop();
      teasGarbage.play();
      imageMode(CORNER);
      image(teasGarbage, 0, 0, width, height);
      if (teasGarbage.available() == false) {
        back2menu();
        imageMode(CENTER);
        water.display(trig1, trig2, trig3, trig4, trig5);
        tubes.display(trig1, trig2, trig3, trig4, trig5);
        bottles.display(trig1, trig2, trig3, trig4, trig5);
        garbage.display(trig1, trig2, trig3, trig4, trig5);
        garbage.playinstrument();
        garbage.playback();
      }
    }
  }
  //if choose the "Mayumana who" 
  if (who == true) {
    aboutMayumana();
  }
  // if choose the simon game (not working)
  if (simon == true);
  {
    //simon();
  }
}

//--------------------------------------------------------------------------

//Function that calls all the methods for the playFree screen
void playfree() {
  background(255);
  imageMode(CENTER);
  image(logo, width/2, height/2);//background image
  
  //the trig1-5 are the boolean which tell the class which trigger is playing
  water.display(trig1, trig2, trig3, trig4, trig5);
  garbage.display(trig1, trig2, trig3, trig4, trig5);
  bottles.display(trig1, trig2, trig3, trig4, trig5);
  tubes.display(trig1, trig2, trig3, trig4, trig5);
  //checking if the mouse is over an instrument and sending the proper int
  if (water.mouseOver()==true) {
    inst =1;
  } else if (tubes.mouseOver()==true) {
    inst = 2;
  } else if (bottles.mouseOver()==true) {
    inst = 3;
  } else if (garbage.mouseOver()==true) {
    inst = 4;
  } else {
    inst = 0;
  }
  back2menu();//  back to the opening screen option
}

//------------------------------------------------------------------------------

//Function that calls all the methods for openscreen
void openscreen() {
  //movie at the background
  imageMode(CORNER);
  image(intro, 0, 0, width, height);
  intro.loop();

  //displaying the titles
  title1.display();
  title2.display();
  title3.display();

  //checking if the mouse is over a title and sending the proper int
  if (title1.mouseOver() == true) {
    button = 1;
  }  
  if (title2.mouseOver() == true) 
  {
    button = 2;
  } 
  if (title3.mouseOver() == true)
  {
    button = 3;
  }
}

//---------------------------------------------------------------------------

//load the "about Mayumana" video
void aboutMayumana() {
  imageMode(CORNER);
  about.play();
  image(about, 0, 0, width, height);
  back2menu();//back to open screen option
}

//---------------------------------------------------------------------------

//creating a back to menu button
void back2menu() {
  imageMode(CENTER);
  image (menu, width/2, height*0.9, width*0.05, width*0.05);//red logo
  if (mouseX > width/2-width*0.025 && mouseX< width/2+width*0.025 && mouseY >height*0.9-width*0.025 && mouseY<height*0.9+width*0.025){// if the mouse is over the logo
    button = 0;//send the proper int
    image (menu, width/2, height*0.9, width*0.08, width*0.08);//make the logo a bit larger
  }
}

//---------------------------------------------------------------------------------------

//Reading the data from the arduino
void arduino() {

  //while getting data from arduino
  while (myserial.available()>0) {

    char data = myserial.readChar();//variable which holds data char from arduino
    
    //switch that call the right trigger to play
    switch(data) {

    case '0':
      trig1 = false;
      trig2 = false;
      trig3 = false;
      trig4 = false;
      trig5 = false;
      //The playing booleans are telling the function when the user dont touch the sensor anymore
      bottles.playing0 = false;
      bottles.playing1 = false;
      bottles.playing2 = false;
      bottles.playing3 = false;
      bottles.playing4 = false;
      water.playing0 = false;
      water.playing1 = false;
      water.playing2 = false;
      water.playing3 = false;
      water.playing4 = false;
      garbage.playing0 = false;
      garbage.playing1 = false;
      garbage.playing2 = false;
      garbage.playing3 = false;
      garbage.playing4 = false;
      tubes.playing0 = false;
      tubes.playing1 = false; 
      tubes.playing2 = false; 
      tubes.playing3 = false; 
      tubes.playing4 = false;
      break;

    case '1':
      trig1 = true;
      trig2 = false;
      trig3 = false;
      trig4 = false;
      trig5 = false;
      break;

    case '2':
      trig1 = false;
      trig2 = true;
      trig3 = false;
      trig4 = false;
      trig5 = false;
      break;

    case '3':
      trig1 = false;
      trig2 = false;
      trig3 = true;
      trig4 = false;
      trig5 = false;
      break;

    case '4':
      trig1 = false;
      trig2 = false;
      trig3 = false;
      trig4 = true;
      trig5 = false;
      break;

    case '5':
      trig1 = false;
      trig2 = false;
      trig3 = false;
      trig4 = false;
      trig5 = true;
      break;
    }
  }
}

//--------------------------------------------------------------------------

void mousePressed() {

  //when the mouse is pressed it pass the button var to the switch
  // state machine  - navigate between the pages
  switch (button) {
  case 0:
    background(0);
    open = true;
    play = false;
    who = false;
    simon = false;
    about.stop();
    bottles.pb.pause();
    garbage.pb.pause();
    water.pb.pause();
    tubes.pb.pause();
    break;

  case 1:
    open = false;
    play = true;
    who = false;
    simon = false;
    intro.stop();
    break;

  case 2:
    open = false;
    play = false;
    who = true;
    simon = false;
    intro.stop();
    break;

  case 3:
    open = false;
    play = false;
    who = false;
    simon = true;
    break;
  }
  //when the mouse is pressed it choosing the selected instrument
  switch (inst) {
  case 0:
    playwater = false;
    playtubes = false;
    playbottles = false;
    playgarbage = false;
    //reseting teasers videos
    teasWater.stop();
    teasTubes.stop();
    teasBottles.stop();
    teasGarbage.stop();
    break;

  case 1:
    playwater = true;
    playtubes = false;
    playbottles = false;
    playgarbage = false;
    break;
  case 2:
    playwater = false;
    playtubes = true;
    playbottles = false;
    playgarbage = false;
    break;
  case 3:
    playwater = false;
    playtubes = false;
    playbottles = true;
    playgarbage = false;
    break;
  case 4:
    playwater = false;
    playtubes = false;
    playbottles = false;
    playgarbage = true;
    break;
  }
}

//---------------------------------------------------------------------------

// reading movies
void movieEvent(Movie m) {
  m.read();
}