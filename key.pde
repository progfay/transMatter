void keyPressed() {
  if ((platform == MACOSX && this.keyEvent.isMetaDown())
    || (platform == WINDOWS && this.keyEvent.isControlDown())) {
    switch(keyCode) {
    case 79 : // o
      buttons[0].pressed();
      return;
    case 83 : // s
      buttons[9].pressed();
    case 90 : // z
      if (this.keyEvent.isShiftDown()) {
        buttons[8].pressed();
      } else {
        buttons[7].pressed();
      }
      return;
    }
  }
}