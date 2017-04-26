// I got some problems in this class:
// 1) after i hover an instrument, it leaves some red on the stroke
// 2) when im triggering sound they dont sound good, like i trigger few toghther (didnt happen in my sound tryout project)
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
  int startTime = 0;
  
  color c;// color (for the stroke)
  int str;// (stroke weight)
  AudioSample[] sounds;// Audio samples Array

  //Setting up the constructor
  PlayFree(float x, float y, float w, float h, PImage inst, AudioSample[] s) {

    posx = x;
    posy = y;
    wid = w;
    heig = h;
    img = inst;
    sounds = s;
    
  }

  //Display a rect with an image of the instrument inside
  void display () {
    rectMode(CENTER);
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

      
      if (keyPressed == true) {
        
        if (key == 'q' || key == 'Q') {
          if (millis() > startTime + sounds[0].length()) {
            playing0 = false;
          }
          if (!playing0) { 
            sounds[0].trigger();
            startTime = millis();
            playing0 = true;
          }
          
          //sounds[0].trigger();
          //playing = true;
        } else if (key == 'w' || key == 'W') {
          sounds[1].trigger();
        } else if (key == 'e' || key == 'E') {
          sounds[2].trigger();
        } else if (key == 'r' || key == 'R') {
          sounds[3].trigger();
        } else if (key == 't' || key == 'T') {
          sounds[4].trigger();
        }
      }
    }
  
    //if mouse not on instrument
    else {
      str = 5;//deacrising stroke weight
      c = color (100, 100, 100);//changing stroke color to grey
    }
  }
}