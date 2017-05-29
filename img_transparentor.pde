// issue : 許容値増減ボタンの追加(±10など)
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
  for (Button button : buttons) {
    button.draw();
  }
}