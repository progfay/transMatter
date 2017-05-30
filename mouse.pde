void mousePressed() {
  // button is pressed
  for (Button button : buttons) {
    if (button.bounds()) {
      button.behavior.behave();
      return;
    }
  }
  // image is pressed
  if (on_img()) {
    PGraphics processed;
    switch(MODE) {
    case TRANS:
      processed = makeTransparencyImage(graphics, get(mouseX, mouseY));
      if (processed == null) break;
      graphics = processed;
      history.add(graphics);
      break;
    case FLOOD_TRANS:
      processed = makeFloodTransImage(graphics, 
        int((mouseX-(WORK_WIDTH-graphics.width*SCALE)*0.5) / SCALE), 
        int((mouseY-(WORK_HEIGHT-graphics.height*SCALE)*0.5) / SCALE));
      if (processed == null) break;
      graphics = processed;
      history.add(graphics);
      break;
    default:
      break;
    }
  }
}