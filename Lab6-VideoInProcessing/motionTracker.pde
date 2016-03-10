import processing.video.*;

// Variable for capture device
Capture video;

// A variable for the color we are searching for.
color trackColor; 

void setup() {
  size(320, 240);
  video = new Capture(this, width, height);
  video.start();

// Start off tracking for red
  trackColor = color(255, 0, 0);
}

void captureEvent(Capture video) {
// Read image from the camera
  video.read();
}


void draw() {
  image(video, 0, 0);
  trackPixels();
  
  
}

void trackPixels(){
  video.loadPixels();
  float peak = 500;
  int closestX = 0;
  int closestY = 0;
  // Begin loop to walk through every pixel
  // we will find the currently selected pixel (as defined in the mousePressed()
  // routine)
  
  for (int x = 0; x < video.width; x ++ ) { //looping through x
    for (int y = 0; y < video.height; y ++ ) { //looping through y
  
      int loc = x + y*video.width; // update the location 
      
      color currentColor = video.pixels[loc]; // get current color of current pixel
      
      float r1 = red(currentColor); // get red value for current 
      float g1 = green(currentColor); // get green value for current
      float b1 = blue(currentColor); // get blue value for current
      
      float r2 = red(trackColor); // get red value of tracked
      float g2 = green(trackColor); // get green value of tracked
      float b2 = blue(trackColor); // get blue value of tracked
   
   // Using euclidean distance to compare colors
    float d = dist(r1, g1, b1, r2, g2, b2);
    if (d < peak) { //check if the color distance is less than the previous closest one
        peak = d; //re-assign the peak distance
        closestX = x; //get the x position of our new distance
        closestY = y; //get the y position of our new distance
      }
  }   
}

  //only draw a point if the peak value is closer than 10
  if (peak < 10) { 
    drawPoint(closestX, closestY);
  }
}

void drawPoint(int closX, int closY){
     // Draw a circle at the tracked pixel
    fill(#000000);
    strokeWeight(4.0);
    stroke(0);
    ellipse(closX, closY, 16, 16); 
}


void mousePressed() {
  // Save color where the mouse is clicked in trackColor variable
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
}

