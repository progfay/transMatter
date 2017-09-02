// The instance of the Button can notice the bounds and behave when the button pressed
class Button {
  int      posX, posY, width, height;
  int      textSize;
  String   title;
  Behavior behavior;

  boolean  available = true;
  boolean  selected  = false;


  Button(String t, int x, int y, int w, int h, int s, Behavior b) {
    this.title    = t;
    this.posX     = x;
    this.posY     = y;
    this.width    = w;
    this.height   = h;
    this.textSize = s;
    this.behavior = b;
  }

  boolean bounds() {
    return (available && this.posX <= mouseX && mouseX <= this.posX + this.width && 
      this.posY <= mouseY && mouseY <= this.posY + this.height);
  }

  void draw() {
    stroke(0);
    fill(this.bounds() ? #B4B4B4 : #F4F5F7);
    rect(this.posX, this.posY, this.width, this. height);
    fill(#000000);
    textSize(this.textSize);
    text(this.title, this.posX, this.posY, this.width, this.height);
    if (selected) {
      float lineX1 = this.posX+(this.width-textWidth(this.title))*0.5;
      float lineX2 = this.posX+(this.width+textWidth(this.title))*0.5;
      float lineY  = this.posY+this.height*0.5+textAscent()*0.8f;
      strokeWeight(2);
      line(lineX1, lineY, lineX2, lineY);
      strokeWeight(1);
    }
  }

  void pressed() {
    stroke(0);
    fill(#A0A0A0);
    rect(this.posX, this.posY, this.width, this. height);
    fill(0);
    textSize(this.textSize);
    text(this.title, this.posX, this.posY, this.width, this.height);
    this.behavior.behave();
  }

  void setSelected(boolean _selected) {
    this.selected = _selected;
  }

  void setTitle(String _title) {
    this.title = _title;
  }

  void setAvailable(boolean flag) {
    this.available = flag;
  }
}

// This class is setup behave on Button.
class Behavior {
  public void behave() {
  }
}