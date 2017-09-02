// flood transparent method
void makeFloodTransImage(int _x, int _y) {
  color target = graphics.get(_x, _y);
  if (target == 0) return;
  ArrayList<Point> point_list = new ArrayList<Point>();
  point_list.add(leftEndpoint(graphics, new Point(_x, _y), target));
  graphics.beginDraw();
  while (point_list.size() > 0) {
    boolean topIsTarget    = false;
    boolean bottomIsTarget = false;
    int X = point_list.get(0).x;
    int Y = point_list.get(0).y;
    point_list.remove(0);
    if (graphics.get(X, Y) == 0) continue;
    while (X < graphics.width) {
      if (!equals(target, graphics.get(X, Y))) break;
      graphics.set(X, Y, 0);
      if (Y > 0) {
        if (!topIsTarget && equals(target, graphics.get(X, Y-1))) {
          point_list.add(leftEndpoint(graphics, new Point(X, Y-1), target));
          topIsTarget = true;
        } else {
          topIsTarget = false;
        }
      }
      if (Y < graphics.height-1) {
        if (!bottomIsTarget && equals(target, graphics.get(X, Y+1))) {
          point_list.add(leftEndpoint(graphics, new Point(X, Y+1), target));
          bottomIsTarget = true;
        } else {
          bottomIsTarget = false;
        }
      }
      X++;
    }
  }
  graphics.endDraw();
  history.save();
}

// Point class only use in makeFloodTransImage method
class Point {
  int x, y;
  Point(int _x, int _y) {
    this.x = _x;
    this.y = _y;
  }
}

// search point that same y and simular color
Point leftEndpoint(PGraphics _graphics, Point onLine, color target) {
  int leftX = onLine.x;
  while (leftX > 0 && equals(target, _graphics.get(leftX-1, onLine.y))) {
    leftX--;
  }
  return new Point(leftX, onLine.y);
}