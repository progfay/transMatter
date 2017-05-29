// The instance of History is record the past and future PGraphics
class History {
  ArrayList<PGraphics> historys;
  int currentArg;

  History(PGraphics origin) {
    this.historys = new ArrayList<PGraphics>();
    this.historys.add(origin);
  }

  void add(PGraphics addition) {
    if (this.historys.size() >= ++this.currentArg) {
      while (this.historys.size() > this.currentArg) {
        this.historys.remove(currentArg);
      }
    }
    // cloning the PGraphics method
    PGraphics _clone = createGraphics(addition.width, addition.height, JAVA2D);
    _clone.beginDraw();
    _clone.loadPixels();
    arrayCopy(addition.pixels, _clone.pixels);
    _clone.updatePixels();
    _clone.endDraw();
    this.historys.add(_clone);
  }

  PGraphics undo() {
    currentArg = max(0, --this.currentArg);
    return this.historys.get(currentArg);
  }

  PGraphics redo() {
    currentArg = min(this.historys.size()-1, ++this.currentArg);
    return this.historys.get(currentArg);
  }
}