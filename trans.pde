// transparent method
PGraphics makeTransparencyImage(PImage _graphics, color target) {
  if (target == 0 || _graphics == null || _graphics.width == 0 || _graphics.height == 0) return null;
  PGraphics _g = createGraphics(_graphics.width, _graphics.height, JAVA2D);
  _g.beginDraw();
  for (int i = 0; i < _graphics.width; i++) {
    for (int j = 0; j < _graphics.height; j++) {
      color point = _graphics.get(i, j);
      if (equals(point, target)) point = 0;
      _g.set(i, j, point);
    }
  }
  _g.endDraw();
  return _g;
}