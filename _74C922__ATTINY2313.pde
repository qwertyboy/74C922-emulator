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

~nathan duprey / qwertyboy~

*/
byte inputPins[] = {17, 0, 1, 2, 5, 6, 9, 10, 12};  //Array to store input pins
byte outputPins[] = {11, 13, 14, 15, 16};           //Array to store output pins

byte xColumn[4];     //Initialize an array for the columns
byte yRow[4];        //Initialize an array for the rows
byte output[4];      //Initialize an array for the output
byte dataAvail = 0;  //Variable for data available output
byte outEnable = 0;  //Variable for output enable input

void setup()
{
  //Serial.begin(9600);  //We are using the serial pins on the attiny, so this won't work
  
  for(byte i = 0; i < 9; i++){    //Set the input pins according to
    pinMode(inputPins[i], INPUT); //the array defined at the top
  }
  
  for(byte i = 0; i < 5; i++){      //Same deal as above, bit with
    pinMode(outputPins[i], OUTPUT); //output pins this time
  }
}

void loop()
{
}
