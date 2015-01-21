ArrayList<Bubble> bubbles;

void setup() {
  size(500, 500);
  //noStroke();
  stroke(255);
  bubbles = new ArrayList<Bubble>();
  makeBubbles();
}

void draw() {
  background(0, 200, 200);
  updateBubbles();
  drawBubbles();
}

void makeBubbles() {
  for(int i = 0; i < 25; i++) {
    float size = random(15,50);
    Bubble bub = new Bubble(size, random(.1,1),
      random(0,500-(size/2)), random(500+(size/2),800));
    bubbles.add(bub);
  }
}

void updateBubbles() {
  for (Bubble bubble : bubbles) {
    bubble.y -= bubble.vel;
    if(bubble.y-(bubble.size/2) < 0) {
      bubble.pop();
    }
    if(mouseX >= bubble.x-(bubble.size/2)
      && mouseX <= bubble.x+(bubble.size/2)
      && mouseY >= bubble.y-(bubble.size/2)
      && mouseY <= bubble.y+(bubble.size/2)) {
       bubble.pop();
     }
  }
}

void drawBubbles() {
  for (Bubble bubble : bubbles) {
    bubble.drawSelf();
  }
}

