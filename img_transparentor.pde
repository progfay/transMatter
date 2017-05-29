// issue : undo, redo時にimg_width,img_heightが変更されていない
// issue : img_width,img_heightの削除
// issue : UI上での画像の拡大(実際の画像は拡大しないが、操作性向上の為)
// issue : 許容値増減ボタンの追加(±10など)
// issue : undo, redoに原因不明のバグ有り(履歴の順序が異なる等)
// issue : targetのLabインスタンスを毎度作り直しているので効率が悪い

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