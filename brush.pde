void brushTransImage(PGraphics _graphics, int _x, int _y) {
  if (_graphics == null || _graphics.width == 0 || _graphics.height == 0) return;
  _graphics.beginDraw();
  int x1 = _x - int(ERASER_RADIUS / SCALE);
  int y1 = _y - int(ERASER_RADIUS / SCALE);
  int x2 = _x + int(ERASER_RADIUS / SCALE);
  int y2 = _y + int(ERASER_RADIUS / SCALE);
  for (int i = x1; i < x2; i++) {
    for (int j = y1; j < y2; j++) {
      if(dist(_x, _y, i, j) <= ERASER_RADIUS / SCALE) _graphics.set(i, j, 0);
    }
  }
  _graphics.endDraw();
}