// The instance of History is record the past and future PGraphics
import java.util.LinkedList;

class History {
  LinkedList<PGraphics> historys;
  int currentArg;

  History(PGraphics origin) {
    this.historys = new LinkedList<PGraphics>();
    this.historys.add(origin);
  }

  void save() {
    if (this.historys.size() > ++this.currentArg) {
      this.historys.subList(currentArg, this.historys.size()).clear();
    }
    this.historys.add(copy(graphics));
  }

  void undo() {
    currentArg = max(0, this.currentArg-1);
    graphics = copy(this.historys.get(currentArg));
    setScale();
  }

  void redo() {
    currentArg = min(this.historys.size()-1, this.currentArg+1);
    graphics = copy(this.historys.get(currentArg));
    setScale();
  }
}

// copy the PGraphics method
PGraphics copy(PGraphics origin) {
  if (origin == null) return null;
  PGraphics copy = createGraphics(origin.width, origin.height, JAVA2D);
  copy.beginDraw();
  copy.loadPixels();
  arrayCopy(origin.pixels, copy.pixels);
  copy.updatePixels();
  copy.endDraw();
  return copy;
}