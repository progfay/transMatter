// load and save file methods

void imgOpen(File selection) {
  if (selection == null) return;
  imgOpen(selection.getAbsolutePath());
}

void imgOpen(String path) {
  String extension = getExtension(path);
  if  (!extension.equals("png") && !extension.equals("jpg") && !extension.equals("jpeg")
    && !extension.equals("gif") && !extension.equals("tif") && !extension.equals("tiff")
    && !extension.equals("tga")) {
    warningDialog("対応していないファイル形式です", "illigal extension file is selected");
    return;
  }

  PImage img = loadImage(path);
  graphics = createGraphics(img.width, img.height, JAVA2D);
  graphics.beginDraw();
  graphics.image(img, 0, 0);
  graphics.endDraw();
  setScale();
  history.save();
}

void imgSave(File selection) {
  if (graphics == null) return;
  if (selection != null) {
    String path = selection.getAbsolutePath();
    String extension = getExtension(path);
    if  (!extension.equals("png") && !extension.equals("gif") && !extension.equals("tga")) path += ".png";
    graphics.save(path);
  }
}