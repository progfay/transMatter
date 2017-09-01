// flood transparent method
PGraphics makeFloodTransImage(PGraphics _graphics, int _x, int _y) {
  if (_graphics == null || _graphics.width == 0 || _graphics.height == 0) return null;
  color target = _graphics.get(_x, _y);
  if (target == 0) return null;
  ArrayList<Point> point_list = new ArrayList<Point>();
  point_list.add(leftEndpoint(_graphics, new Point(_x, _y), target));
  _graphics.beginDraw();
  while (point_list.size() > 0) {
    boolean topIsTarget    = false;
    boolean bottomIsTarget = false;
    int X = point_list.get(0).x;
    int Y = point_list.get(0).y;
    point_list.remove(0);
    if (_graphics.get(X, Y) == 0) continue;
    while (X < _graphics.width) {
      if (!equals(target, _graphics.get(X, Y))) break;
      _graphics.set(X, Y, 0);
      if (Y > 0) {
        if (!topIsTarget && equals(target, _graphics.get(X, Y-1))) {
          point_list.add(leftEndpoint(_graphics, new Point(X, Y-1), target));
          topIsTarget = true;
        } else {
          topIsTarget = false;
        }
      }
      if (Y < _graphics.height-1) {
        if (!bottomIsTarget && equals(target, _graphics.get(X, Y+1))) {
          point_list.add(leftEndpoint(_graphics, new Point(X, Y+1), target));
          bottomIsTarget = true;
        } else {
          bottomIsTarget = false;
        }
      }
      X++;
    }
  }
  _graphics.endDraw();
  return _graphics;
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