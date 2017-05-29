void button_settings() {
  // button position and size settings
  buttons = new Button [10];
  for (int i = 0; i < 3; i++) {
    buttons[i] = new Button(WORK_WIDTH, i*BUTTON_HEIGHT, UI_WIDTH, BUTTON_HEIGHT, button_name[i]);
  }
  final int THIRD_BUTTON_WIDTH = UI_WIDTH/3;
  buttons[3] = new Button(WORK_WIDTH, 3*BUTTON_HEIGHT, UI_WIDTH, int(BUTTON_HEIGHT*0.4), button_name[3]);
  for (int i = 0; i < 3; i++) {
    buttons[i+4] = new Button(WORK_WIDTH+i*THIRD_BUTTON_WIDTH, int(3.4*BUTTON_HEIGHT), THIRD_BUTTON_WIDTH, int(BUTTON_HEIGHT*0.6), button_name[i+4]);
  }
  final int HALF_BUTTON_WIDTH = UI_WIDTH/2;
  for (int i = 0; i < 2; i++) {
    buttons[i+7] = new Button(WORK_WIDTH+i*HALF_BUTTON_WIDTH, 4*BUTTON_HEIGHT, HALF_BUTTON_WIDTH, BUTTON_HEIGHT, button_name[i+7]);
  }
  buttons[9] = new Button(WORK_WIDTH, 5*BUTTON_HEIGHT, UI_WIDTH, BUTTON_HEIGHT, button_name[9]);

  // button behave settings
  buttons[0].setBehave(new Behavior() {
    public void behave() {
      selectInput("Open image", "imgLoad");
    }
  }
  );
  buttons[1].setBehave(new Behavior() {
    public void behave() {
      MODE = TRANS;
    }
  }
  );
  buttons[2].setBehave(new Behavior() {
    public void behave() {
      MODE = FLOOD_TRANS;
    }
  }
  );
  buttons[4].setBehave(new Behavior() {
    public void behave() {
      AFFORD_DIFF = max(0, --AFFORD_DIFF);
      buttons[5].setTitle(String.valueOf(AFFORD_DIFF));
    }
  }
  );
  buttons[6].setBehave(new Behavior() {
    public void behave() {
      AFFORD_DIFF = min(768, ++AFFORD_DIFF);
      buttons[5].setTitle(String.valueOf(AFFORD_DIFF));
    }
  }
  );
  buttons[7].setBehave(new Behavior() {
    public void behave() {
      graphics = history.undo();
    }
  }
  );
  buttons[8].setBehave(new Behavior() {
    public void behave() {
      graphics = history.redo();
    }
  }
  );
  buttons[9].setBehave(new Behavior() {
    public void behave() {
      selectOutput("Save image as png file", "imgSave");
    }
  }
  );

  // button disanable settings
  buttons[3].setAnable(false);
  buttons[5].setAnable(false);
}