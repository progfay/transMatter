PGraphics rectangleTransImage(PGraphics _graphics, int _x1, int _y1, int _x2, int _y2) {
  if (_graphics == null || _graphics.width == 0 || _graphics.height == 0) return null;

  int x1 = constrain(_x1, 0, _graphics.width);
  int y1 = constrain(_y1, 0, _graphics.height);
  int x2 = constrain(_x2, 0, _graphics.width);
  int y2 = constrain(_y2, 0, _graphics.height);
  if (x1 > x2) {
    int temp = x1;
    x1 = x2;
    x2 = temp;
  }
  if (y1 > y2) {
    int temp = y1;
    y1 = y2;
    y2 = temp;
  }

  _graphics.beginDraw();
  for (int i = x1; i <= x2; i++) {
    for (int j = y1; j <= y2; j++) {
      _graphics.set(i, j, 0);
    }
  }
  _graphics.endDraw();
  return _graphics;
}