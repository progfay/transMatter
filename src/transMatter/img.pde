// methods relate for image

// draw the image with black edge
void draw_img() {
  // draw the background like chess board before draw image
  background(#FFFFFF);
  fill(#DDDDDD);
  noStroke();
  int beginPos = - BACK_RECT_SIZE + frameCount % BACK_RECT_SIZE;
  for (int i = beginPos; i <= WORK_WIDTH; i++) {
    for (int j = beginPos; j <= WORK_HEIGHT/BACK_RECT_SIZE; j++) {
      if ((i+j)%2==0) rect(beginPos+i*BACK_RECT_SIZE, beginPos+j*BACK_RECT_SIZE, BACK_RECT_SIZE, BACK_RECT_SIZE);
    }
  }
  if (graphics == null || graphics.width == 0 || graphics.height == 0) return;
  image(graphics, WORK_WIDTH/2, WORK_HEIGHT/2, graphics.width*scale, graphics.height*scale);
  noFill();
  stroke(0);
  rect(WORK_WIDTH*0.5-graphics.width*0.5*scale, WORK_HEIGHT*0.5-graphics.height*0.5*scale, graphics.width*scale, graphics.height*scale);
}

// return the mouse cursor on the image
boolean on_img(int x, int y) {
  return WORK_WIDTH*0.5-graphics.width*0.5*scale < x
    && x < WORK_WIDTH*0.5+graphics.width*0.5*scale
    && WORK_HEIGHT*0.5-graphics.height*0.5*scale < y
    && y < WORK_HEIGHT*0.5+graphics.height*0.5*scale;
}

void setScale() {
  if (graphics == null || graphics.width == 0 || graphics.height == 0) return;
  if (graphics.width > WORK_WIDTH) {
    scale = WORK_WIDTH / graphics.width;
    if (graphics.height > WORK_HEIGHT) scale = min(scale, WORK_HEIGHT / graphics.height);
  } else if (graphics.width < WORK_WIDTH*0.5) {
    scale = WORK_WIDTH/2 / graphics.width;
    if (graphics.height < WORK_HEIGHT*0.5) scale = (WORK_HEIGHT*0.5) / graphics.height;
  }
  if (graphics.height > WORK_HEIGHT || graphics.height < WORK_HEIGHT*0.5) scale = (WORK_HEIGHT*0.5) / graphics.height;
}