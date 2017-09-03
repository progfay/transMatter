// transparent method
void makeTransparencyImage(int x, int y) {
  color target = graphics.get(x, y);
  if (target == 0) return;
  g.beginDraw();
  for (int i = 0; i < graphics.width; i++) {
    for (int j = 0; j < graphics.height; j++) {
      color point = graphics.get(i, j);
      if (equals(point, target)) point = 0;
      graphics.set(i, j, point);
    }
  }
  graphics.endDraw();
  history.save();
}