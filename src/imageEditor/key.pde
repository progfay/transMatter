void keyPressed() {
  if ((platform == MACOSX && this.keyEvent.isMetaDown())
    || (platform == WINDOWS && this.keyEvent.isControlDown())) {
    switch(keyCode) {
    case 79 : // o
      buttons.get("open").pressed();
      break;
    case 83 : // s
      buttons.get("save").pressed();
      break;
    case 90 : // z
      buttons.get(!this.keyEvent.isShiftDown() ? "undo" : "redo").pressed();
      break;
    }
  }
}