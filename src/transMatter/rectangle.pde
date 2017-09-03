void rectangleTransImage(int _x1, int _y1, int _x2, int _y2) {
  int x1 = constrain(min(_x1, _x2), 0, graphics.width);
  int x2 = constrain(max(_x1, _x2), 0, graphics.width);
  int y1 = constrain(min(_y1, _y2), 0, graphics.height);
  int y2 = constrain(max(_y1, _y2), 0, graphics.height);

  boolean isTransed = false;  

  graphics.beginDraw();
  for (int i = x1; i <= x2; i++) {
    for (int j = y1; j <= y2; j++) {
      if (graphics.get(i, j) == 0) continue;
      isTransed = true;
      graphics.set(i, j, 0);
    }
  }
  graphics.endDraw();
  if(isTransed) history.save();
}