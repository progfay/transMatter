// evaluate the distance of two colors by Euclid distance on RGB
boolean equals(color c1, color c2) {
  return (abs(red(c1)-red(c2)) + abs(green(c1)-green(c2)) + abs(blue(c1)-blue(c2)) + abs(alpha(c1)-alpha(c2))) <= afford_diff;
}

// display afford_diff(float) format to String
String format(float num) {
  int dig = String.valueOf(int(num)).length();
  return nf(num, dig, 1);
}

int tranlatePositionX(int originX) {
  return int((originX-(WORK_WIDTH-graphics.width*scale)*0.5) / scale);
}

int tranlatePositionY(int originY) {
  return int((originY-(WORK_HEIGHT-graphics.height*scale)*0.5) / scale);
}