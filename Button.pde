// The instance of the Button can notice the bounds and behave when the button pressed
class Button {
  int    posX, posY, width, height;
  String   title    = "";
  boolean anable    = true;
  boolean selected  = false;
  Behavior behavior = new Behavior();

  Button(int x, int y, int w, int h, String t) {
    this.posX   = x;
    this.posY   = y;
    this.width  = w;
    this.height = h;
    this.title  = t;
  }

  void draw() {
    stroke(0);
    fill(this.bounds() ? 180 : selected ? 235 : 255);
    rect(this.posX, this.posY, this.width, this. height);
    fill(0);
    text(this.title, this.posX, this.posY, this.width, this.height);
  }

  boolean bounds() {
    return (anable && this.posX <= mouseX && mouseX <= this.posX + this.width && 
      this.posY <= mouseY && mouseY <= this.posY + this.height);
  }

  void setBehave(Behavior _newBehavior) {
    this.behavior = _newBehavior;
  }

  void setTitle(String _title) {
    this.title = _title;
  }

  void setAnable(boolean flag) {
    this.anable = flag;
  }

  void pressed() {
    stroke(0);
    fill(180);
    rect(this.posX, this.posY, this.width, this. height);
    fill(0);
    text(this.title, this.posX, this.posY, this.width, this.height);
    this.behavior.behave();
  }
}

// This class is setup behave on Button.
class Behavior {
  public void behave() {
  }
}