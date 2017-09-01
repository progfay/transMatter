void mousePressed() {
  // button is pressed
  for (Button button : buttons.values()) {
    if (button.bounds()) {
      button.behavior.behave();
      return;
    }
  }

  // work spase is pressed
  if (mode == RECTANGLE) {
    rectStartX = mouseX;
    rectStartY = mouseY;
    return;
  }

  // image is pressed
  if (on_img()) {
    PGraphics processed;
    switch(mode) {
    case TRANS:
      processed = makeTransparencyImage(graphics, get(mouseX, mouseY));
      if (processed == null) break;
      graphics = processed;
      history.add(graphics);
      break;
    case FLOOD_TRANS:
      processed = makeFloodTransImage(graphics, tranlatePositionX(mouseX), tranlatePositionY(mouseY));
      if (processed == null) break;
      graphics = processed;
      history.add(graphics);
      break;
    default:
      break;
    }
  }
}

void mouseReleased() {
  switch(mode) {
  case BRUSH:
    if (graphics == null || graphics.width == 0 || graphics.height == 0) return;
    history.add(graphics);
  case RECTANGLE:
    if (rectStartX == -1 || rectStartY == -1) return;
    PGraphics processed = rectangleTransImage(graphics, tranlatePositionX(rectStartX), tranlatePositionY(rectStartY), tranlatePositionX(mouseX), tranlatePositionY(mouseY));
    if (processed == null) break;
    history.add(graphics);
    graphics = processed;
    rectStartX = -1;
    rectStartX = -1;
    break;
  }
}

int tranlatePositionX(int originX) {
  return int((originX-(WORK_WIDTH-graphics.width*SCALE)*0.5) / SCALE);
}

int tranlatePositionY(int originY) {
  return int((originY-(WORK_HEIGHT-graphics.height*SCALE)*0.5) / SCALE);
}