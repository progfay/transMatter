// load and save file methods
void imgLoad(File selection) {
  if (selection == null) return;
  PImage img = loadImage(selection.getAbsolutePath());
  graphics = createGraphics(img.width, img.height, JAVA2D);
  graphics.beginDraw();
  graphics.image(img, 0, 0);
  graphics.endDraw();
  // set scale by image size
  if (img.width > WORK_WIDTH) {
    SCALE = WORK_WIDTH / img.width;
    if (img.height > WORK_HEIGHT) SCALE = min(SCALE, WORK_HEIGHT / img.height);
  } else if (img.width < WORK_WIDTH*0.5) {
    SCALE = WORK_WIDTH*0.5 / img.width;
    if (img.height < WORK_HEIGHT*0.5) SCALE = (WORK_HEIGHT*0.5) / img.height;
  }
  if (img.height > WORK_HEIGHT || img.height < WORK_HEIGHT*0.5) SCALE = (WORK_HEIGHT*0.5) / img.height;
  history.add(graphics);
}

void imgSave(File selection) {
  if (graphics == null) return;
  if (selection != null) graphics.save(selection.getAbsolutePath() + ".png");
}