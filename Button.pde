class Button{
  
  float x,y,w,h;
  
  color c1 = color(0, 255, 217);
  color c2 = color(0, 234, 255);
  
  String s;
  
  Button(float x , float y, float w, float h, String s){
    this.x =x;
    this.y =y;
    this.w =w;
    this.h =h;
    this.s = s;
  }
  
  void display(){
    pushMatrix();
    translate(x,y);
    
    pushStyle();
    noFill();
    stroke(c1);
    ellipse(0,0,w, h);
    ellipse(0,0,w/4 *3, h/4 *3);
    popStyle();
   
    pushStyle();
    noFill();
    stroke(c2);
    ellipse(0,0,w/2, h/2);
    popStyle();
    popMatrix();
  }
  
  void displayRect(){
    pushMatrix();
    translate(x,y);
    pushStyle();
    noFill();
    stroke(c2);
    text(s, w/2 - textWidth(s), h/2);
    rect(0,0,w,h);
    popStyle();
    popMatrix();
  }
}
