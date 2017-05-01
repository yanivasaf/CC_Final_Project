//This is the class for the open screen of the project

class OpenScreen {

  float posx;// X position
  float posy;// Y position
  float wid;// Width
  float heig;// height
  PImage img;// Image
  color c;// color (for the stroke)
  int str;// (stroke weight)
  int choose;

  OpenScreen(float x, float y, float w, float h, PImage title) {
    posx = x;
    posy = y;
    wid = w;
    heig = h;
    img = title; 
   
  }
  
  //Display a rect with a titleinside
  void display () {
    fill(0);
    strokeWeight(str);
    stroke(c);
    rectMode(CENTER);
    rect(posx, posy, wid, heig);
    imageMode(CENTER);
    image(img, posx, posy, wid, heig);
  }
  
  // check if the mouse is over a title
  boolean mouseOver() { 
    //If the mouse is over a title
    if (mouseX > posx-wid/2 && mouseX < posx+wid/2 && mouseY > posy-heig/2 && mouseY < posy +heig/2) {
      str = 10;//increasing stroke weight
      c = color (255, 0, 0);//changing stroke to red
      return true; // 
  }
    //if mouse not over a titlet
    else {
      str = 5;//deacrising stroke weight
      c = color (100, 100, 100);//changing stroke color to grey
      return false;
    }
  }
}