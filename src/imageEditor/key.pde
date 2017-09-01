void keyPressed() {
  if ((platform == MACOSX && this.keyEvent.isMetaDown())
    || (platform == WINDOWS && this.keyEvent.isControlDown())) {
    switch(keyCode) {
    case 79 : // o
      buttons.get("open").pressed();
      return;
    case 83 : // s
      buttons.get("save").pressed();
      return;
    case 90 : // z
      if (this.keyEvent.isShiftDown()) {
        buttons.get("redo").pressed();
      } else {
        buttons.get("undo").pressed();
      }
      return;
    }
  }
}