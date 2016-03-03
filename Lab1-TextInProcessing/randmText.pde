/*randmText.pde
Author: Trevor Tomesh, University of Regina
Course: CS 205 Lab
Contact: tmtomesh@gmail.com
Copyright: do whatever you want with it.
*/


/*
First, we need to do a "set-up" function. 
In processing, "setup()" runs the code within once upon
starting.
*/ 
void setup(){
  size(800,600); //"size" indicated the number of pixels tall wide and tall our "canvas" will be. 
  background(51); // Set a background color
}

void draw(){
  PFont f; //We must define an instance of PFont (a font in processing)
  
//before we can use a font, however, we need to create it and load it
//to create a font go to "tools > create font". 
//Dont forget to include the .vlw extension below!
  f = loadFont("ComicSansMS-Bold-48.vlw");

    if(keyPressed){ //This will run whenever a key is pressed
      textFont(f, random(0,100)); //get a font of a random size. 
      rotate(random(0,360)); //rotate the font to a random angle
      fill(random(0,255),random(0,255),random(0,255)); //fill the font with a random color
      text(key,random(0,800), random(0,600)); //draw the key pressed at a random position. 
  }
}
