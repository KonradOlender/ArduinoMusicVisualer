class Knob{
  
PImage knob, pointer;
float x,y;
float kWidth, kHeight;
float r = 0;
PFont font;
String name;

color c1 = color(0, 255, 217);
color c2 = color(0, 234, 255);

boolean active = false;
boolean pointerB = false;
void setPointer(){
  pointerB = true;
}
void setActive(boolean b){
  active = b;
}

Knob(String k, float x1, float y1, float w, float h, String name){
  knob = loadImage(k);
  x= x1;
  y= y1;
  kWidth = w;
  kHeight = h;
  this.name = name;
  
  font = createFont("CodeSquaredRegular-AYRg.ttf",10);
  
  pointer = loadImage("Pointer.png");
}
 
 void display(){
   pushMatrix();
   imageMode(CENTER);
   translate(x, y);
   
   pushStyle();
   textFont(font);
   fill(255);
   text("" + r, 30, 70);
   text(name, 0 - textWidth(name)/2, -80);
   popStyle();
   
   pushStyle();
   fill(c2);
   noStroke();
   rect(0, -kHeight/3, 1, -8);
   rect(-kWidth/3, 0, -10, 1);
   rect(kWidth/3, 0, 10, 1);
   popStyle();
   
   pushStyle();
   stroke(c1);
   noFill();
   arc(0, 0, kWidth + 8, kHeight + 8, radians(-135) - radians(90), radians(135) - radians(90));
   popStyle();
   
   pushStyle();
   stroke(c2);
   strokeWeight(3);
   noFill();
   arc(0, 0, kWidth + 8, kHeight + 8, radians(-135) - radians(90), r - radians(90));
   popStyle();
   //image(knob, 0, 0, kWidth, kHeight);
   pushStyle();
   noFill();
   stroke(c1);
   ellipse(0,0,kWidth, kHeight);
   ellipse(0,0,kWidth/4 *3, kHeight/4 *3);
   popStyle();
   
   pushStyle();
   noFill();
   stroke(c2);
   ellipse(0,0,kWidth/2, kHeight/2);
   popStyle();
   
   rotate(r);
   if(pointerB == false){
     image(pointer, 0, 0, kWidth, kHeight);
   }
   else if(pointerB == true){
     pushStyle();
     fill(c1);
     //noStroke();
     rect(0, 0 , 2, -20);
     popStyle();
   }
   popMatrix();
 }
 
 void rotateKnob(float i){
   if(pmouseX < mouseX && active && degrees(r) <= 135){
     r += i;
   }
   else if(pmouseX > mouseX && active && degrees(r) >= -135){
     r -= i;
   }
   
 }
 
 boolean isPressed(){
   if(mouseX >= x - kWidth/2 && mouseX <= x + kWidth/2 && mouseY >= y - kHeight/2 && mouseY <= y + kHeight/2 && mousePressed){
     return true;
   }
   return false;
 }
 
 
}
