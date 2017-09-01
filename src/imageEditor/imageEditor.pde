// issue : undo and redo bugs

void settings() {
  // set the screen size
  size(WORK_WIDTH+UI_WIDTH, WORK_HEIGHT);
}

void setup() {
  textFont(createFont("HiraMaruProN-W4-AlphaNum", 30, true));
  textAlign(CENTER, CENTER);
  rectMode(CORNER);
  imageMode(CENTER);

  // setup graphics, history and buttons
  graphics = null;
  history = new History(graphics);
  button_settings();
}

void draw() {
  draw_img();
  for (Button button : buttons.values()) {
    button.draw();
  }

  if (mouseX > WORK_WIDTH) return;

  switch(mode) {
  case BRUSH:
    fill(mousePressed ? 180 : 255);
    stroke(0);
    ellipse(mouseX, mouseY, ERASER_RADIUS*2, ERASER_RADIUS*2);
    if (graphics != null && mousePressed) brushTransImage(tranlatePositionX(mouseX), tranlatePositionY(mouseY));
    break;
  case RECTANGLE:
    if (!mousePressed) return;
    noFill();
    stroke(0);
    rect(rectStartX, rectStartY, mouseX - rectStartX, mouseY - rectStartY);
  }
}