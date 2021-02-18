import processing.serial.*;

import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.signals.*;


Serial myPort;

Knob knob, knob2, knob3, knob4, spectrum;
SegmentSlider segmentSlider;
Button button,button2,button3,button4;
PImage backround;

color c = color(0, 217, 255);

float sensitivity = 600;

Minim minim;
//AudioPlayer jingle;
AudioOutput out;
AudioInput in;
FFT fft;


 
void setup()
{
  size(1000, 512);
  backround = loadImage("backround2.png");
  knob = new Knob("KnobBig.png", width/2, 135, 130, 130, "Sensitivity");
  spectrum = new Knob("KnobBig.png", width/2 - 250, 155, 100, 100, "Spectrum");
  knob2 = new Knob("KnobBig.png", width/2 + 250, 155, 100, 100, "b");
  knob3 = new Knob("KnobBig.png", width/2 + 100, height/2 + 70, 100, 100, "g");
  knob4 = new Knob("KnobBig.png", width/2 - 100, height/2 + 70, 100, 100, "r");
  
  segmentSlider = new SegmentSlider(width - 100, 20, 50, 40);
  
  button = new Button(25,70,130,50, "button");
  button2 = new Button(25,125,130,50, "button");
  button3 = new Button(25,180,130,50, "button");
  button4 = new Button(25,235,130,50, "button");
  
  knob.setPointer();
  spectrum.setPointer();
  knob2.setPointer();
  knob3.setPointer();
  knob4.setPointer();

  myPort = new Serial(this, "COM3", 9600);
  //myPort.bufferUntil('\n');
  
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  
  fft = new FFT(in.bufferSize(), 512);
  
}
 
void draw()
{
  int j = 0;
  background(0);  
  //image(backround,width/2,height/2);

  pushStyle();
  stroke(30,30,30);
  for(int i = 0; i < 1000; i += 35){
    line(i , 0, i, height);
  }
  for(int i = 0; i < 512; i += 35){
    line(0, i, width, i);
  }
  popStyle();
  
  pushStyle();
  stroke(70,70,70);
  line(width/2 - 370, 10, width/2 + 370, 10);
  line(width/2 + 370, 10, width/2 + 100, height/2 + 70);
  line(width/2 - 370, 10, width/2 - 100, height/2 + 70);
  line(width/2 - 100, height/2 + 70, width/2 + 100, height/2 + 70);
  
  line(width - 10, 10, width - 10, height - 10);
  line(width - 10, height - 10, width/2 + 375, height - 10);
  line(width/2 + 375, height - 10, width/2 + 375, 10);
  line(width/2 + 375, 10, width - 10, 10);
  
  noFill();
  rect(10, 10, 110, 495);
  popStyle();
  
  pushStyle();
  noFill();
  stroke(c);
  ellipse(width/2, 512, 600, 150);
  popStyle();
  
  knob.display();
  spectrum.display();
  knob2.display();
  knob3.display();
  knob4.display();
  
  segmentSlider.display(fft.calcAvg(0, 100000000) * sensitivity);
  
  button.displayRect();
  button2.displayRect();
  button3.displayRect();
  button4.displayRect();
  
  pushStyle();
  fill(255);
  text("Avg ",width - 40, 400);
  text(fft.calcAvg(0, 16000)*sensitivity,width - 80, 420);
  popStyle();
  
  // perform a forward FFT on the samples in jingle's left buffer
  // note that if jingle were a MONO file, 
  // this would be the same as using jingle.right or jingle.left
  fft.forward(in.mix);
  
  if(fft.getBand(2)*50 >= 400){
    myPort.write('1');
    //delay(100);
  }
  else if(fft.getBand(2)*50 >= 350 && fft.getBand(2)*50 < 400){
    myPort.write('2');
    //delay(100);
  }
  else if(fft.getBand(2)*50 >= 300 && fft.getBand(2)*50 < 350){
    myPort.write('3');
    //delay(100);
  }
  else if(fft.getBand(2)*50 >= 250 && fft.getBand(2)*50 < 300){
    myPort.write('4');
    //delay(100);
  }
  else if(fft.getBand(2)*50 >= 200 && fft.getBand(2)*50 < 250){
    myPort.write('5');
    //delay(100);
  }
  else if(fft.getBand(2)*50 >= 150 && fft.getBand(2)*50 < 200){
    myPort.write('6');
    //delay(100);
  }
  else if(fft.getBand(2)*50 >= 100 && fft.getBand(2)*50 < 150){
    myPort.write('7');
    //delay(100);
  }
  if(fft.getBand(2)*50 >= 50 && fft.getBand(2)*50 < 100){
    myPort.write('8');
   //delay(100);
  }
  
  pushStyle();
  fill(c);
  noStroke();
  rect(0 + width/4 - 6, height, 2, -fft.getBand(0)*2);
  rect(2 + width/4 - 6, height, 2, -fft.getBand(1)*2);
  rect(4 + width/4 - 6, height, 2, -fft.getBand(2)*2);
  popStyle();
  
  
  for(int i = 3; i < fft.specSize(); i++)
  {
    // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
    pushStyle();
    fill(c);
    noStroke();
    rect(j + width/4 - 6, height, 2, -fft.getBand(i)*10);
    popStyle();
    j += 2;
  }
  
  for(int i = 0; i < fft.specSize(); i++)
  {
   // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
   pushStyle();
   fill(c);
   noStroke();
    rect(width - 45, 375, 5, -fft.calcAvg(0, 100000000)*150);
    popStyle();
  }
  
  if(knob.isPressed()){
    knob.setActive(true);
  }
  if(spectrum.isPressed()){
    spectrum.setActive(true);
  }
  if(knob2.isPressed()){
    knob2.setActive(true);
  }
  if(knob3.isPressed()){
    knob3.setActive(true);
  }
  if(knob4.isPressed()){
    knob4.setActive(true);
  }
  knob.rotateKnob(0.15);
  knob2.rotateKnob(0.15);
  knob3.rotateKnob(0.15);
  knob4.rotateKnob(0.15);
  spectrum.rotateKnob(radians(1));
}

void mouseReleased() {
  knob.setActive(false);
  spectrum.setActive(false);
  knob2.setActive(false);
  knob3.setActive(false);
  knob4.setActive(false);
}
