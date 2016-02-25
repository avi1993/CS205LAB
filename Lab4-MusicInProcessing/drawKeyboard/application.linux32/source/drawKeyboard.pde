
import ddf.minim.*;
import ddf.minim.ugens.*;
Minim minim;
AudioOutput out;

int sizes[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0};
float whiteFreq[] = {65.4064,73.4162,82.4069,87.3071,97.9989,110.000,
123.471,130.813,146.832};
char whiteKey[] = {'a','s','d','f','g','h','j','k','l'};
char blackKey[] = {'w','e','t','y','i','o'};
float blackFreq[] = {69.2957,77.7817,92.4986,103.826,116.541,
138.591};
float[] randPosX = new float[14];
float[] randPosY = new float[14];
color[] randColor = new color[14];


void setup()
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

void draw()
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

void keyPressed(){
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
