import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import ddf.minim.ugens.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class drawKeyboard extends PApplet {




Minim minim;
AudioOutput out;

int sizes[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0};
float whiteFreq[] = {65.4064f,73.4162f,82.4069f,87.3071f,97.9989f,110.000f,
123.471f,130.813f,146.832f};
char whiteKey[] = {'a','s','d','f','g','h','j','k','l'};
char blackKey[] = {'w','e','t','y','i','o'};
float blackFreq[] = {69.2957f,77.7817f,92.4986f,103.826f,116.541f,
138.591f};
float[] randPosX = new float[14];
float[] randPosY = new float[14];
int[] randColor = new int[14];


public void setup()
{
  size(500, 500);
  
  minim = new Minim(this);
  
  // use the getLineOut method of the Minim object to get an AudioOutput object
  out = minim.getLineOut(); // Because java library...
  background(255);
  
  for(int n = 0; n < 14; n++){
  randPosX[n] = random(0,500);
  randPosY[n] = random(0,500); 
  randColor[n] = color(random(0,255),random(0,255),random(0,255)); 
}

}

public void draw()
{
 clear();
 for(int i = 0; i < 14; i++){
      stroke(255);
       strokeWeight(5);
       fill(randColor[i]);
       ellipse(randPosX[i],randPosY[i],sizes[i],sizes[i]); 
   
   if(sizes[i] > 1){    
       sizes[i] -= 1; 
}

 }
}

public void keyPressed(){
  for( int i = 0; i < 9; i++){
    if(key == whiteKey[i]){
       out.playNote(whiteFreq[i]);
       sizes[i] +=50;
    } 
  }

  for(int j = 0; j<5; j++){
      if(key == blackKey[j]){
       out.playNote(blackFreq[j]);
       sizes[j] +=50;
    } 
  }  
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#FF0505", "drawKeyboard" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
