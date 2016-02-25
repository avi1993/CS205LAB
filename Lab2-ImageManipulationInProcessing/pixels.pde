void setup() {
  size(200,200);  
  loadPixels();
  //print(pixels.length);
}

void draw() {
  for(int i = 0; i < pixels.length; i++){
    float rand = random(255);
    color c = color(rand);
    pixels[i] = c;
  }
  
  updatePixels();

}