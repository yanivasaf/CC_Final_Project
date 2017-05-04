#include <CapacitiveSensor.h>
//setting up which input&outputs to use
CapacitiveSensor   cs_2_4 = CapacitiveSensor(2, 4);
CapacitiveSensor   cs_2_7 = CapacitiveSensor(2, 7);
CapacitiveSensor   cs_2_8 = CapacitiveSensor(2, 8);
CapacitiveSensor   cs_2_12 = CapacitiveSensor(2, 12);
CapacitiveSensor   cs_2_13= CapacitiveSensor(2, 13); 


void setup()                    
{

     
   Serial.begin(9600);

}

void loop()                    
{
    //create variables for each trigger
    long trigger1 =  cs_2_4.capacitiveSensor(120);
    long trigger2 =  cs_2_7.capacitiveSensor(120);
    long trigger3 =  cs_2_8.capacitiveSensor(120);
    long trigger4 =  cs_2_12.capacitiveSensor(120);
    long trigger5=  cs_2_13.capacitiveSensor(120);
    

   //printing output for each trigger 
    if (trigger1 > 4) {
        Serial.println('1');
    } 
     if (trigger2 > 4) {
        Serial.println('2');
    } 
     if (trigger3 > 4) {
        Serial.println('3');
    } 
     if (trigger4 >4) {
        Serial.println('4');
    } 
     if (trigger5 > 4) {
        Serial.println('5');
    } 
    if (trigger1 < 4 && trigger2 < 5 && trigger3 < 5 && trigger4 < 5 && trigger5 < 5){
        Serial.println('0');
    }
    
             
    delay(5);                             // arbitrary delay to limit data to serial port 
}


