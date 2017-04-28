//This is the main sketch
//***Click the mouse to start the project***


//bugs:
//when going from the instrument page back to the opening screen - it change the scale and position
//of the background


import ddf.minim.*;
import processing.video.*;
import processing.serial.*;

Serial serial;

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

int titleChoose1;
int titleChoose2;
int titleChoose3;
int button;

boolean open;
boolean play;
boolean who;
boolean simon;

Movie intro;
Movie about;


void setup () {
  //fullScreen();
  size(1080, 720);
  //background(255);

  titleChoose1 = 1;
  titleChoose1 = 2;
  titleChoose1 = 3;

  intro = new Movie(this, "intro.mp4");//intro movie
  about = new Movie(this, "aboutMayumana.mp4");//About mayumana movie

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

  //Creating new objects for instruments - (X position, Y Position, Width, Height, Image name, Samples array name, background image)
  water = new PlayFree (width*0.20, height*0.20, width*0.3, height*0.25, pwater, swater, waterPB);
  garbage = new PlayFree (width*0.20, height*0.80, width*0.3, height*0.25, pgarbage, sgarbage,garbagePB);
  bottles  = new PlayFree (width*0.80, height*0.20, width*0.3, height*0.25, pbottles, sbottles, bottlesPB);
  tubes = new PlayFree (width*0.80, height*0.80, width*0.3, height*0.25, ptubes, stubes, tubesPB);

  //Creating new objects for open screen - (X position, Y Position, Width, Height, Image name, video intro, video about)

  title1 = new OpenScreen (width*0.1, height*0.8, width*0.25, height*0.1, choose2);
  title2 = new OpenScreen (width*0.4, height*0.8, width*0.25, height*0.1, choose1);
  title3 = new OpenScreen (width*0.7, height*0.8, width*0.25, height*0.1, choose3);
  
  //used to choose screens
  button = 0;

  //used for state machine
  open =false;
  play= false;
  who= false;
  simon=false;
}

void draw () {

  if (open == true) {
    openscreen();
  }
  if (play == true) {
    playfree();
  }
  if (who == true) {
    aboutMayumana();
  }
  if (simon == true);
  {
    //simon();

  }
}
  //Function that calls all the methods for the playFree screen
  void playfree() {
    background(255);
    imageMode(CENTER);
    image(logo, width/2, height/2);
    water.display();
    water.mouseOver();
    water.playback();
    garbage.display();
    garbage.mouseOver();
    garbage.playback();
    bottles.display();
    bottles.mouseOver();
    bottles.playback();
    tubes.display();
    tubes.mouseOver();
    tubes.playback();
    
    back2menu();
  }
  //Function that calls all the methods for openscreen
  void openscreen() {
    //movie at the background
    image(intro, 0, 0, width, height);
    intro.loop();
    
    //displaying the titles
    title1.display();
    title2.display();
    title3.display();
    
    //checking if the mouse is over a title
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
  
  //load the "about Mayumana" video
  void aboutMayumana() {
    about.play();
    image(about, 0, 0, width, height);
    back2menu();
  }




  void mousePressed() {
    
    //when the mouse is pressed it pass the button var to the switch
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
  }
  // reading movies
  void movieEvent(Movie m) {
    m.read();
  }
  
//creating a back to menu button
void back2menu(){
  image (menu, width/2,height*0.9, width*0.05,width*0.05);
  if (mouseX > width/2 && mouseX< width/2+100 && mouseY >height-100 && mouseY<height){
    button = 0;
    image (menu, width/2,height*0.9, width*0.08,width*0.08);
    
  }
}
    
    
    


  void keyReleased() {

    //sending a boolean when the key released to make sure it the sample doesnt play 60 times a second
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
  }