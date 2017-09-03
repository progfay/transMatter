void settings() {
  size(WORK_WIDTH+UI_WIDTH, WORK_HEIGHT);
}

void setup() {
  textFont(createFont("HiraMaruProN-W4-AlphaNum", 30, true));
  textAlign(CENTER, CENTER);
  rectMode(CORNER);
  imageMode(CENTER);

  // setup graphics, history and buttons and so on
  graphics = null;
  history = new History(graphics);
  button_settings();
  dropTarget = new DropTarget(((java.awt.Component) this.surface.getNative()), new ImageDropTargetListener());
  bucket_icon  = loadImage( "bucket.png");
  syringe_icon = loadImage("syringe.png");
}

void draw() {
  draw_img();
  for (Button button : buttons.values()) {
    button.draw();
  }


  // file Dragged
  if (fileDragged) {
    dragAlpha = min(120, dragAlpha+30);
  } else {
    dragAlpha = max(0, dragAlpha-30);
  }
  fill(0, 0, 0, dragAlpha);
  rect(0, 0, width, height);
  if (fileDragged) {
    textSize(50);
    fill(100);
    float textWidth = textWidth("ファイルを開く")*1.1f;
    rect((width-textWidth)*0.5, (height-textAscent()*1.275f)*0.5, textWidth, g.textLeading, 250);
    fill(-1);
    text("ファイルを開く", width*0.5, height*0.5);
    return;
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