class Rect{
  
  int r,g,b;
  float x,y,w,h;
  float xx, yy;
  boolean active = false;
  void setActive(boolean b){
    if(b == true){
      active = true;
    }
    else if(b == false){
      active = false;
    }
  }
  
  Rect(int r, int g, int b, float x, float y, float w, float h, float xx, float yy){
    this.r = r;
    this.g = g;
    this.b = b;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.xx = xx;
    this.yy = yy;
    
  }
  
  void display(){
    if(active){
      pushMatrix();
      translate(xx,yy);
      pushStyle();
      noStroke();
      fill(r,g,b);
      rect(x,y,w,h,7);
      popStyle();
      popMatrix();
    }
  }
  
  
}
