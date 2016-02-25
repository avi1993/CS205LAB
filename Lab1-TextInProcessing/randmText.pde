void setup(){
  size(800,600);
  background(51);
}

void draw(){
  PFont f;
  f = loadFont("ComicSansMS-Bold-48.vlw");

    if(keyPressed){
      textFont(f, random(0,100));
      rotate(random(0,360));
      fill(random(0,255),random(0,255),random(0,255));
      text(key,random(0,800), random(0,600));
  }
}
