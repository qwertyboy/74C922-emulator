/*

This is a program to emulate the 74C922 16-key encoder. The goal
is to create an *almost* drop-in compatible. Note however, that
the attiny2313 is a 20-pin device, and the power and ground pins
are not in the same locations. THIS IS NOT DIRECTLY COMPATIBLE
WITH EXISTING DESIGNS!!! For those who are making new designs, or
cannot source an original 74C922, then this may work for you. You
WILL have to make a custom adapter if replacing an existing chip.

The aim is to provide the same features as the original chip, so
using this replacement in a new design should be the same as using
the old one.

Uses the Arduino Keypad library
Link: http://arduino.cc/playground/Code/Keypad

~nathan duprey / qwertyboy~

*/
#include <Keypad.h>

#define dataAvail 11  //Associate dataAvail with 11
#define OE 12         //Associate OE (output enable) with 12

const byte ROWS = 4;  //Number of rows
const byte COLS = 4;  //Number of columns

char keys[ROWS][COLS] = {  //Build a keymap
  {1,2,3,4},
  {5,6,7,8},
  {9,10,11,12},
  {13,14,15,16}
  };
  
byte rowPins[ROWS] = {17, 0, 1, 2};  //Connect to the row pins
byte colPins[COLS] = {10, 9, 6, 5};  //Connect to the column pins

Keypad keypad = Keypad(makeKeymap(keys), rowPins, colPins, ROWS, COLS);  //Start Keypad library

byte outputPins[] = {dataAvail, 13, 14, 15, 16};  //Array to store output pins

void setup()
{
  for(byte i = 0; i < 5; i++){
    pinMode(outputPins[i], OUTPUT);
    digitalWrite(outputPins[i], LOW);
  }
  
  pinMode(OE, INPUT);
}

void loop()
{
  while(digitalRead(OE) == 0){
    BCDwrite();
  }
}

void BCDwrite()
{
  byte key = keypad.getKey();  //Returns key pressed
  
  if(key){
    digitalWrite(dataAvail, HIGH);
  }
  else{
    digitalWrite(dataAvail, LOW);
  }
  
  byte keyPressed = (key - 1);
  

    for(byte i = 3; i > 0; i--){
      byte x = ((keyPressed >> i) & 1);
        for(byte i = 13; i < 16; i++){
          digitalWrite(i, x);
        }
    }
}
