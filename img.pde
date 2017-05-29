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
  image(graphics, WORK_WIDTH/2, WORK_HEIGHT/2, graphics.width, graphics.height);
  // image(graphics, WORK_WIDTH/2, WORK_HEIGHT/2, 500, 500);  ← make like it(rescale drawing image to easy operation)
  noFill();
  stroke(0);
  rect(WORK_WIDTH/2-graphics.width/2, WORK_HEIGHT/2-graphics.height/2, graphics.width, graphics.height);
}

// return the mouse cursor on the image
boolean on_img() {
  return WORK_WIDTH/2-graphics.width/2 < mouseX
    && mouseX < WORK_WIDTH/2+graphics.width/2
    && WORK_HEIGHT/2-graphics.height/2 < mouseY
    && mouseY < WORK_HEIGHT/2+graphics.height/2;
}