void brushTransImage(int _x, int _y) {
  int x1 = _x - int(ERASER_RADIUS / SCALE);
  int y1 = _y - int(ERASER_RADIUS / SCALE);
  int x2 = _x + int(ERASER_RADIUS / SCALE);
  int y2 = _y + int(ERASER_RADIUS / SCALE);
  if(!isBrushed && !on_img(x1, y1) && !on_img(x1, y2) && !on_img(x2, y1) && !on_img(x2, y2)) return;
  isBrushed = true;
  graphics.beginDraw();
  for (int i = x1; i < x2; i++) {
    for (int j = y1; j < y2; j++) {
      if(dist(_x, _y, i, j) <= ERASER_RADIUS / SCALE) graphics.set(i, j, 0);
    }
  }
  graphics.endDraw();
}