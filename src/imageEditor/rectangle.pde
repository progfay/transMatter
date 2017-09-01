void rectangleTransImage(int _x1, int _y1, int _x2, int _y2) {
  int x1 = constrain(_x1, 0, graphics.width);
  int y1 = constrain(_y1, 0, graphics.height);
  int x2 = constrain(_x2, 0, graphics.width);
  int y2 = constrain(_y2, 0, graphics.height);
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

  graphics.beginDraw();
  for (int i = x1; i <= x2; i++) {
    for (int j = y1; j <= y2; j++) {
      graphics.set(i, j, 0);
    }
  }
  graphics.endDraw();
  history.save();
}