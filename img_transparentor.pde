// issue : undo, redoに原因不明のバグ有り(履歴の順序が異なる等)

void settings() {
  // set the screen size
  size(WORK_WIDTH+UI_WIDTH, WORK_HEIGHT);
}

void setup() {
  textFont(createFont("Ricty Discord", 48, false));
  frameRate(-1);
  textAlign(CENTER, CENTER);
  rectMode(CORNER);
  imageMode(CENTER);
  textSize(30);

  // setup graphics, history and buttons
  graphics = createGraphics(0, 0, JAVA2D);
  history = new History(graphics);
  button_settings();
}

void draw() {
  draw_img();
  if (MODE == ERASER && mouseX < WORK_WIDTH) {
    fill(mousePressed ? 180 : 255);
    stroke(0);
    ellipse(mouseX, mouseY, ERASER_RADIUS*2, ERASER_RADIUS*2);
  }
  if (mousePressed && mouseX < WORK_WIDTH) {
    switch(MODE) {
    case ERASER:
      graphics = ellipseEraserTransImage(graphics, tranlatePositionX(mouseX), tranlatePositionY(mouseY));
      break;
    case RECTANGLE:
      noFill();
      stroke(0);
      rect(rectStartX, rectStartY, mouseX - rectStartX, mouseY - rectStartY);
    }
  }
  for (Button button : buttons) {
    button.draw();
  }
}