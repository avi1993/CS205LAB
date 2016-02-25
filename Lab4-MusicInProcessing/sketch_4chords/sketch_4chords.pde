import ddf.minim.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
Minim minim;
AudioOutput out;
AudioRecorder recorder;

IIRFilter filt;
 
int dtime = 500;
float noteLength = float(dtime)/500; 

float bass[] = {65,98,82,87};
float chords[] = {
  262,330,392, //C,E,G
  392,494,294, //G,B,D
  440,262,330, //A,C,E
  349,440,262 //F,A,C
};

void setup()
{
  minim = new Minim(this); // because java library
  // use the getLineOut method of the Minim object to get an AudioOutput object
  out = minim.getLineOut();
  recorder = minim.createRecorder(out, "myrecording.wav");

}

void draw()
{
  
    //filt = new NotchFilter(400, 100, out.sampleRate());


  for(int i = 0; i < 2; i++){
    playChords(1,4);
  }
}


void playChords(float shift, int reps){
 for(int i = 0; i < 4; i++){
 for(int j = 0; j < reps; j++){
 out.playNote(0,noteLength,shift*bass[i]);
 out.playNote(0,noteLength,shift*chords[i*3]);
 out.playNote(0,noteLength,shift*chords[(i*3)+1]);
 out.playNote(0,noteLength,shift*chords[(i*3)+2]);
 delay(dtime);
 }
}
  
  
  
}
void keyReleased()
{
  if ( key == 'r' ) 
  {
    // to indicate that you want to start or stop capturing audio data, you must call
    // beginRecord() and endRecord() on the AudioRecorder object. You can start and stop
    // as many times as you like, the audio data will be appended to the end of the buffer 
    // (in the case of buffered recording) or to the end of the file (in the case of streamed recording). 
    if ( recorder.isRecording() ) 
    {
      recorder.endRecord();
    }
    else 
    {
      recorder.beginRecord();
    }
  }
  if ( key == 's' )
  {
    // we've filled the file out buffer, 
    // now write it to the file we specified in createRecorder
    // in the case of buffered recording, if the buffer is large, 
    // this will appear to freeze the sketch for sometime
    // in the case of streamed recording, 
    // it will not freeze as the data is already in the file and all that is being done
    // is closing the file.
    // the method returns the recorded audio as an AudioRecording, 
    // see the example  AudioRecorder >> RecordAndPlayback for more about that
    recorder.save();
    println("Done saving.");
  }
}



