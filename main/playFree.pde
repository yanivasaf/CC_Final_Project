//I added a playback fuction that the user can play with, by pressing 'p' to play and 's' to stop 
class PlayFree {

  float posx;// X position
  float posy;// Y position
  float wid;// Width
  float heig;// height
  PImage img;// Image
  boolean playing0 = false;
  boolean playing1 = false;
  boolean playing2 = false;
  boolean playing3 = false;
  boolean playing4 = false;
  boolean over = false;
  boolean isplaying = false;
  int startTime = 0;
  String clickpb;
  String clickpb2;
  PFont f;


  color c;// color (for the stroke)
  int str;// (stroke weight)
  AudioSample[] sounds;// Audio samples Array
  AudioPlayer pb;//playback file

  //Setting up the constructor
  PlayFree(float x, float y, float w, float h, PImage inst, AudioSample[] s, AudioPlayer p) {

    posx = x;
    posy = y;
    wid = w;
    heig = h;
    img = inst;
    sounds = s;
    pb = p;
    clickpb = "PRESS 'P' TO TURN THE PLAYBACK ON";
    clickpb2 = "PRESS 'S' TO TURN THE PLAYBACK OFF";
    f = createFont ("Knockout-HTF66-FullFlyweight.otf", 64);
  }

  //Display a rect with an image of the instrument inside
  void display () {
    //Rect with instructions about the playback
    rectMode(CENTER);
    fill(0);
    stroke(100);
    strokeWeight(3);
    rect(width/2, height*0.2, width*0.2, height*0.1);
    fill(220);
    textFont(f);
    textSize(25);
    textAlign(CENTER, CENTER);
    text(clickpb, width/2, height*0.18);
    text(clickpb2, width/2, height*0.18+25);
    //rect with the different instruments
    fill(0);
    strokeWeight(str);
    stroke(c);
    rect(posx, posy, wid, heig);
    image(img, posx, posy, wid, heig);
  }

  // check if the mouse is over an instrument
  void mouseOver() { 
    //If the mouse is over an instrument
    if (mouseX > posx-(wid/2) && mouseX < posx+(wid/2) && mouseY > posy -(heig/2) && mouseY < posy +(heig/2)) {
      str = 10;//increasing stroke weight
      c = color (255, 0, 0);//changing stroke to red
      //use this boolean to know which playback file to play
      over = true;


      if (keyPressed == true) {

        if (key == 'q' || key == 'Q') {
          //making sure that it wouldnt play the same sample 60 times a second.
          if (millis() > startTime + sounds[0].length()) {
            playing0 = false;
          }
          if (!playing0) { 
            sounds[0].trigger();
            startTime = millis();
            playing0 = true;
          }
        }

        if (key == 'w' || key == 'W') {
          if (millis() > startTime + sounds[1].length()) {
            playing1 = false;
          }
          if (!playing1) { 
            sounds[1].trigger();
            startTime = millis();
            playing1 = true;
          }
        }

        if (key == 'e' || key == 'E') {
          if (millis() > startTime + sounds[2].length()) {
            playing2 = false;
          }
          if (!playing2) { 
            sounds[2].trigger();
            startTime = millis();
            playing2 = true;
          }
        }

        if (key == 'r' || key == 'R') {
          if (millis() > startTime + sounds[3].length()) {
            playing3 = false;
          }
          if (!playing3) { 
            sounds[3].trigger();
            startTime = millis();
            playing0 = true;
          }
        }

        if (key == 't' || key == 'T') {
          if (millis() > startTime + sounds[4].length()) {
            playing0 = false;
          }
          if (!playing4) { 
            sounds[4].trigger();
            startTime = millis();
            playing4 = true;
          }
        }
      }
    }

    //if mouse not on instrument
    else {
      str = 5;//deacrising stroke weight
      c = color (100, 100, 100);//changing stroke color to grey
      over = false;
    }
  }
  void playback() {

    if (keyPressed == true && over == true) {
      if (key == 'p' || key == 'P') {
        pb.play();
      } else if (key == 's' || key == 'S') {
        pb.pause();
        pb.rewind();
      }
    }
  }
}