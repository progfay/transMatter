// methods relate for image

// draw the image with black edge
void draw_img() {
  // draw the background like chess board before draw image
  background(-1);
  fill(230);
  noStroke();
  for (int i = 0; i <= WORK_WIDTH/BACK_RECT_SIZE; i++) {
    for (int j = 0; j <= WORK_HEIGHT/BACK_RECT_SIZE; j++) {
      if ((i+j)%2==0) rect(i*BACK_RECT_SIZE, j*BACK_RECT_SIZE, BACK_RECT_SIZE, BACK_RECT_SIZE);
    }
  }
  if (graphics.width <= 0 || graphics.height <=0) return;
  image(graphics, WORK_WIDTH/2, WORK_HEIGHT/2, graphics.width*SCALE, graphics.height*SCALE);
  noFill();
  stroke(0);
  rect(WORK_WIDTH*0.5-graphics.width*0.5*SCALE, WORK_HEIGHT*0.5-graphics.height*0.5*SCALE, graphics.width*SCALE, graphics.height*SCALE);
}

// return the mouse cursor on the image
boolean on_img() {
  return WORK_WIDTH*0.5-graphics.width*0.5*SCALE < mouseX
    && mouseX < WORK_WIDTH*0.5+graphics.width*0.5*SCALE
    && WORK_HEIGHT*0.5-graphics.height*0.5*SCALE < mouseY
    && mouseY < WORK_HEIGHT*0.5+graphics.height*0.5*SCALE;
}