String format(float num) {
  int dig = String.valueOf(int(num)).length();
  return nf(num, dig, 1);
}