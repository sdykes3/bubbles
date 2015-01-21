public class Bubble {
  float x;
  float y;
  float size;
  float vel;
  boolean popping;
  
  Bubble() {
    size = 30;
    vel = 2;
    x = 250;
    y = 500;
    popping = false;
  }
  
  Bubble(float size, float vel, float x, float y) {
    this.size = size;
    this.vel = vel;
    this.x = x;
    this.y = y;
    popping = false;
  }
  
  void drawSelf() {
    if(!popping) {
      ellipse(x,y,size,size);
    } else {
      //popping, so make bigger then disappear
      float torusSize = size*1.25;
      int i = 10;
      while(i >= 0) {
        size++;
        torusSize--;
        ellipse(x,y,size,size);
        fill(0,200,100);
        ellipse(x,y,torusSize,torusSize);
        fill(255);
        i--;
      }
      //reset after pop
      popping = false;
      size = random(15,50);
      y = random(500+(size/2),800);
    }
  }
  
  void popLines() { //don't use, doesn't look good
    line(x+(size/3), y+(size/3), 
      x+(size/3)+(size/4), y+(size/3)+(size/4));
    line(x+(size/3), y-(size/3), 
      x+(size/3)+(size/4), y-((size/3)+(size/4)));
    line(x-(size/3), y-(size/3), 
      x-((size/3)+(size/4)), y-((size/3)+(size/4)));
    line(x-(size/3), y+(size/3), 
      x-((size/3)+(size/4)), y+((size/3)+(size/4)));
    line(x-(size/2), y, x-(size/2)-(size/4), y);
    line(x+(size/2), y, x+(size/2)+(size/4), y);
    line(x, y-(size/2), x, y-(size/2)-(size/4));
    line(x, y+(size/2), x, y+(size/2)+(size/4));
  }
  
  void pop() {
   popping = true; 
  }
}
