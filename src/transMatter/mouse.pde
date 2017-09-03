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
  if (graphics == null || graphics.width == 0 || graphics.height == 0) return;
  if (on_img(mouseX, mouseY)) {
    switch(mode) {
    case TRANS:
      makeTransparencyImage(tranlatePositionX(mouseX), tranlatePositionY(mouseY));
      break;
    case FLOOD_TRANS:
      makeFloodTransImage(tranlatePositionX(mouseX), tranlatePositionY(mouseY));
      break;
    default:
      break;
    }
  }
}

void mouseReleased() {
  if (graphics == null || graphics.width == 0 || graphics.height == 0) return;
  switch(mode) {
  case BRUSH:
    if (!isBrushed) break;
    history.save();
    isBrushed = false;
    break;
  case RECTANGLE:
    if (rectStartX == -1 || rectStartY == -1) break;
    rectangleTransImage(tranlatePositionX(rectStartX), tranlatePositionY(rectStartY), tranlatePositionX(mouseX), tranlatePositionY(mouseY));
    rectStartX = -1;
    rectStartX = -1;
    break;
  }
}

void mouseMoved() {
  if (mouseX > WORK_WIDTH && pmouseX <= WORK_WIDTH) cursor(ARROW);
  else if (mouseX < WORK_WIDTH && pmouseX >= WORK_WIDTH) {
    switch(mode) {
    case TRANS:
      cursor(syringe_icon, 0, syringe_icon.height-1);
      break;
    case FLOOD_TRANS:
      cursor(bucket_icon, bucket_icon.width-1, bucket_icon.height-2);
      break;
    case BRUSH:
      noCursor();
      break;
    case RECTANGLE:
      cursor(CROSS);
      break;
    default: 
      cursor(ARROW);
      break;
    }
  }
}

void mouseEntered() {
  mouseEntered = true;

  if (mouseX > WORK_WIDTH) {
    cursor(ARROW);
    return;
  }
  switch(mode) {
  case TRANS:
    cursor(syringe_icon, 0, syringe_icon.height-1);
    break;
  case FLOOD_TRANS:
    cursor(bucket_icon, bucket_icon.width-1, bucket_icon.height-2);
    break;
  case BRUSH:
    noCursor();
    break;
  case RECTANGLE:
    cursor(CROSS);
    break;
  default: 
    cursor(ARROW);
    break;
  }
}

void mouseExited() {
  mouseEntered = false;
}