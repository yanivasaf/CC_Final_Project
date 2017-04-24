//This project is checking the communication b/w arduino&processing
import processing.serial.*;
Serial serial;

void setup (){
  size(300,300);
  //setting matching port to the Arduino and choosing the correct USB port
  serial = new Serial (this, "/dev/cu.usbmodem142121", 9600);
}
void draw (){
  //if getting data from arduino
  if (serial.available()> 0){
    //print "hello"
    println("hello");
    
  }
  
  
}