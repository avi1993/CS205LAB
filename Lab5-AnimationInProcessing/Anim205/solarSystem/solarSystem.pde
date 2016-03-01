float scale = .5;


void setup(){
 size(int(scale*3000),int(scale*2000)); 
  background(0,0,0);
  
}

void draw(){

  int solPos = 1000;
  
  
noStroke();
  
fill(#FFEB08);  
ellipse(scale*solPos,scale*solPos,50*scale,50*scale);  

fill(#CEBFBB);
ellipse(scale*(solPos+100), scale*(solPos+100), 5*scale,5*scale);

fill(#DE671D);
ellipse(scale*(solPos+150),scale*(solPos+150),10*scale,10*scale);

fill(#6DAA59);
ellipse(scale*(solPos+250),scale*(solPos+250),10*scale,10*scale);

fill(#F04005);
ellipse(scale*(solPos+350),scale*(solPos+350),10*scale,10*scale);

fill(#CECB68);
ellipse(scale*(solPos+500),scale*(solPos+500),40*scale,40*scale);

fill(#6DAA59);
ellipse(scale*(solPos+600),scale*(solPos+600),35*scale,35*scale);

fill(#19306A);
ellipse(scale*(solPos+700),scale*(solPos+700),20*scale,20*scale);

fill(#4066C1);
ellipse(scale*(solPos+800),scale*(solPos+800),20*scale,20*scale);
  
}
