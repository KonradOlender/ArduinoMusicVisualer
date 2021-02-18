class SegmentSlider{
  
  int segments;
  float x,y, sWidth;
  float avg;
  
  int[] cords;
  int j = 0;
  Rect[] rect;  
  
  SegmentSlider(float x, float y, float w, int segments){
    this.x = x;
    this.y = y;
    sWidth = w;
    this.segments = segments;
    cords = new int[segments];
    
    for(int i=segments - 1; i >= 0; i--){
      cords[i] = j;
      j += 9;
    }
    
    rect = new Rect[segments];
    for(int i = 0; i < segments; i++){
      if(i >= (segments / 3) * 2){
        //pushStyle();
        //noStroke();
        //fill(255, 153, 0);
        //rect(sWidth/2 + sWidth/4,cords[i], sWidth/4, 4, 7);
        //rect(sWidth/2 + sWidth/2 + 5,cords[i], sWidth/4, 4, 7);
        //popStyle();

        rect[i] = new Rect(0, 255, 174, 5, cords[i], sWidth - 5, 4,x,y);
      }
      if(i >= (segments/3) * 1 && i < (segments / 3) * 2){
        //pushStyle();
        //noStroke();
        //fill(255, 60, 0);
        //rect(sWidth/2,cords[i], sWidth/2, 4, 7);
        //rect(sWidth/2 + sWidth/2 + 5,cords[i], sWidth/2, 4, 7);
        //popStyle();
        
        rect[i] = new Rect(0, 255, 208, sWidth/2, cords[i], sWidth/2, 4,x,y);
      }
      if(i < (segments/3) * 1){
        //pushStyle();
        //noStroke();
        //fill(255, 0, 43);
        //rect(5,cords[i], sWidth - 5, 4, 7);
        //rect(sWidth + 5,cords[i], sWidth - 5, 4, 7);
        //popStyle();
        rect[i] = new Rect(0, 255, 217, sWidth/2 + sWidth/4, cords[i], sWidth/4, 4,x,y);
      }
    }
  }
  
  void display(float avg){
    
    if(avg > 500){
      for(int i = 0; i < segments ; i++){
        rect[i].setActive(true);
        rect[i].display();
      }
    }
    if(avg > 450 && avg < 500){
      for(int i = 0; i < 11 ; i++){
        rect[i].setActive(true);
        rect[i].display();
      }
    }
    if(avg > 400 && avg < 450){
      for(int i = 0; i < 10 ; i++){
        rect[i].setActive(true);
        rect[i].display();
      }
    }
    if(avg > 350 && avg < 400){
      for(int i = 0; i < 9 ; i++){
        rect[i].setActive(true);
        rect[i].display();
      }
    }
    if(avg > 300 && avg < 350){
      for(int i = 0; i < 8 ; i++){
        rect[i].setActive(true);
        rect[i].display();
      }
    }
    if(avg > 250 && avg < 300){
      for(int i = 0; i < 7 ; i++){
        rect[i].setActive(true);
        rect[i].display();
      }
    }
    if(avg > 200 && avg < 250){
      for(int i = 0; i < 6 ; i++){
        rect[i].setActive(true);
        rect[i].display();
      }
    }
    if(avg > 150 && avg < 200){
      for(int i = 0; i < 5 ; i++){
        rect[i].setActive(true);
        rect[i].display();
      }
    }
    if(avg > 100 && avg < 150){
      for(int i = 0; i < 4 ; i++){
        rect[i].setActive(true);
        rect[i].display();
      }
    }
    if(avg > 50 && avg < 100){
      for(int i = 0; i < 3 ; i++){
        rect[i].setActive(true);
        rect[i].display();
      }
    }
  }
}
