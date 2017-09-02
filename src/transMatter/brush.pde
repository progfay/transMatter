void brushTransImage(int _x, int _y) {
  float radius = BRUSH_RADIUS / SCALE;
  int x1 = _x - int(radius);
  int y1 = _y - int(radius);
  int x2 = _x + int(radius);
  int y2 = _y + int(radius);
  graphics.beginDraw();
  for (int i = x1; i <= x2; i++) {
    for (int j = y1; j <= y2; j++) {
      if (dist(_x, _y, i, j) <= radius) {
        if(!isBrushed) {
          if (graphics.get(i, j) != 0) isBrushed = true;
        }
        graphics.set(i, j, 0);
      }
    }
  }
  graphics.endDraw();
}