class Button {
 float x;
 float y;
 float w;
 float h;
 boolean hover;

 char label;

 color normalColor;
 color hoverColor;

 button(float x, float y, float w, float h,
         char label, color normalColor, color hoverColor) {

    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    hover = false;

    this.label = label;

    this.normalColor = normalColor;
    this.hoverColor = hoverColor;
  }

  void display() {

    if (hover()) {
      fill(hoverColor);
    } else {
      fill(normalColor);
    }

    stroke(10,10,10);
    strokeWeight(2);
    rect(x, y, w, h, 10);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(22);
    text(label, x + w / 2, y + h / 2);
  }

  boolean hover() {
    return mouseX >= x &&
           mouseX <= x + w &&
           mouseY >= y &&
           mouseY <= y + h;
  }
  
  void mouseOver(float tempX, float tempY) {
    if(tempX > x-w/2 && tempX < x+w/2 && tempY > y-h/2 && tempY < y+h/2) {
      hover = true;
    } else {
      hover = false;
    }
  }
}
