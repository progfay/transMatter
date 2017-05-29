// load and save file methods
void imgLoad(File selection) {
  if (selection == null) return;
  PImage img = loadImage(selection.getAbsolutePath());
  graphics = createGraphics(img.width, img.height, JAVA2D);
  graphics.beginDraw();
  graphics.image(img, 0, 0);
  graphics.endDraw();
  //if (graphics.width > WORK_WIDTH || graphics.height > WORK_HEIGHT) {
  //  float per_width  = graphics.width *1.0/WORK_WIDTH;
  //  float per_height = graphics.height*1.0/WORK_HEIGHT;
  //  if (per_width > per_height) {
  //    img_width = WORK_WIDTH;
  //    img_height = graphics.height / per_height;
  //  } else {
  //    img_width  = graphics.width / per_height;
  //    img_height = WORK_HEIGHT;
  //  }
  //} else {
  //  img_width  = graphics.width;
  //  img_height = graphics.height;
  //}
  history.add(graphics);
}

void imgSave(File selection) {
  if (graphics == null) return;
  if (selection != null) graphics.save(selection.getAbsolutePath() + ".png");
}