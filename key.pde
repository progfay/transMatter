void keyPressed() {
  if ((platform == MACOSX && this.keyEvent.isMetaDown())
    || (platform == WINDOWS && this.keyEvent.isControlDown())) {
    switch(keyCode) {
    case 79 : // o
      buttons[0].pressed();
      return;
    case 83 : // s
      buttons[16].pressed();
    case 90 : // z
      if (this.keyEvent.isShiftDown()) {
        buttons[15].pressed();
      } else {
        buttons[14].pressed();
      }
      return;
    }
  }
}