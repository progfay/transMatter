void cut() {
  int x1, y1, x2, y2;

  for (x1 = 0; lineTrans(x1); x1++);
  if (x1 == graphics.height) {
    graphics = null;
    history.save();
    return;
  }

  for (y1 = 0; lineTrans(y1); y1++);
  for (x2 = graphics.width; rowTrans(x2); x2--);
  for (y2 = graphics.height; lineTrans(y2); y2--);

  PImage origin = graphics.get();

  graphics = createGraphics(x2-x1, y2-y1);
  graphics.beginDraw();
  for (int i = x1; i < x2; i++) {
    for (int j = y1; j < y2; j++) {
      graphics.set(i, j, origin.get(x1+i, y1+j));
    }
  }
  graphics.endDraw();
  history.save();
}

boolean lineTrans(int line) {
  if (line < 0 || line >= graphics.height) return false;
  for (int row = 0; row < graphics.height; row++) {
    if (graphics.get(line, row) != 0) return false;
  }
  return true;
}

boolean rowTrans(int row) {
  if (row < 0 || row == graphics.width) return false;
  for (int line = 0; line < graphics.width; line++) {
    if (graphics.get(line, row) != 0) return false;
  }
  return true;
}