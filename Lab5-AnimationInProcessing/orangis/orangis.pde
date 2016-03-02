float i = 0;
int sizex = 200;
int sizey = 200;
void setup(){
  size(sizex,sizey);
  
}



void draw(){
  clear();
  background(#CCE1EA); 
  drawOrangi(sizex/2,50+100*pow(sin(i),2),#F57520);
  i+=0.1;
}


void drawOrangi(float posx, float posy, color Color){
 drawLimbs(posx,posy);
 
 strokeWeight(2);
 fill(Color);
 ellipse(posx,posy,50,50); 
 fill(#000000);
 ellipse(posx,posy,10,10); 
 //line(posx,posy,posx+25,posy); //test line
 
 drawEye(posx,posy);
 
}

void drawEye(float eyex, float eyey){
   float blink = random(0,10);
   println(blink);
   fill(#000000);
   if(blink > 7){
     ellipse(eyex,eyey,0,0);
   }
   else{
   ellipse(eyex,eyey,10,10); 
}
}

void drawLimbs(float px, float py){
  strokeWeight(2);
  float l = 50;
  float rs = px+25; //right shoulder
  float ls = px-25; //left shoulder
  line(rs,py,rs+l*pow(cos(i),2),py+l*pow(sin(i),2));
  line(ls,py,ls-l*pow(cos(i),2),py+l*pow(sin(i),2));
  
  
}
