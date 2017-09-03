void settings() {
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
  dropTaret_settings();
  bucket_icon  = loadImage( "bucket.png");
  syringe_icon = loadImage("syringe.png");
  java.awt.Dimension bucket_dim  = ((java.awt.Component)surface.getNative()).getToolkit().getBestCursorSize(bucket_icon.width, bucket_icon.height);
  java.awt.Dimension syringe_dim = ((java.awt.Component)surface.getNative()).getToolkit().getBestCursorSize(syringe_icon.width, syringe_icon.height);
  bucket_icon.resize(bucket_dim.width, bucket_dim.height);
  syringe_icon.resize(syringe_dim.width, syringe_dim.height);
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
    ellipse(mouseX, mouseY, BRUSH_RADIUS*2, BRUSH_RADIUS*2);
    if (graphics != null && mousePressed) brushTransImage(tranlatePositionX(mouseX), tranlatePositionY(mouseY));
    break;
  case RECTANGLE:
    if (!mousePressed) return;
    noFill();
    stroke(0);
    rect(rectStartX, rectStartY, mouseX - rectStartX, mouseY - rectStartY);
  }
}