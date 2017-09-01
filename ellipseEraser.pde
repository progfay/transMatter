PGraphics ellipseEraserTransImage(PGraphics _graphics, int _x, int _y) {
  if (_graphics == null || _graphics.width == 0 || _graphics.height == 0) return null;
  _graphics.beginDraw();
  int x1 = _x - ERASER_RADIUS;
  int y1 = _y - ERASER_RADIUS;
  int x2 = _x + ERASER_RADIUS;
  int y2 = _y + ERASER_RADIUS;
  for (int i = x1; i < x2; i++) {
    for (int j = y1; j < y2; j++) {
      if(dist(_x, _y, i, j) <= ERASER_RADIUS) _graphics.set(i, j, 0);
    }
  }
  _graphics.endDraw();
  return _graphics;
}