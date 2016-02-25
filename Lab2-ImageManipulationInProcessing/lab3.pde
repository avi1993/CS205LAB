PImage img; //Declare a variable of type PImage
PImage img2; 

void setup(){
  img = loadImage("penguin.jpg"); 
  img.loadPixels();
  
  size(img.width, img.height); //for processing 2.x
  //print(img.width,img.height);
  //size(640,692); //for processing 3.x or..
  //surface.SetSize(img.width, img.height); //for processing 3.x
  //img.filter(INVERT);
  

}

void draw(){
 //myFilter();
 spliceImages();
 image(img,0,0);
 saveImage();

}

void myFilter(){
  for(int i = 0; i < (img.width*img.height); i++){
    img.pixels[i] = img.pixels[i] + color(100,100,100);  
  } 
  img.updatePixels();  
}

void saveImage(){
 PImage output = createImage(img.width, img.height, RGB);
 output = img.get(); 
 output.save("/Users/tomesh2t/Desktop/lab3/out.jpg"); 
}

void spliceImages(){
  img2 = loadImage("tiger.jpg");
  img2.loadPixels();
  img2.resize(img.width, img.height);  
  for(int i = 0; i < (img.width*img.height);  i+=2){
   img.pixels[i] = img2.pixels[i];  
  }
  img.updatePixels();
  
}
