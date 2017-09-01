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
  graphics = createGraphics(0, 0, JAVA2D);
  history = new History(graphics);
  button_settings();
}

void draw() {
  draw_img();
  if (mode == BRUSH && mouseX < WORK_WIDTH) {
    fill(mousePressed ? 180 : 255);
    stroke(0);
    ellipse(mouseX, mouseY, ERASER_RADIUS*2, ERASER_RADIUS*2);
  }
  if (mousePressed && mouseX < WORK_WIDTH) {
    switch(mode) {
    case BRUSH:
      brushTransImage(graphics, tranlatePositionX(mouseX), tranlatePositionY(mouseY));
      break;
    case RECTANGLE:
      noFill();
      stroke(0);
      rect(rectStartX, rectStartY, mouseX - rectStartX, mouseY - rectStartY);
    }
  }


  for (Button button : buttons.values()) {
    button.draw();
  }
}