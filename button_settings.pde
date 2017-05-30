// button[ 0] : 開く
// button[ 1] : 透過
// button[ 2] : 塗りつぶし透過
// button[ 3] : 透過度表示
// button[ 4] : -0.1
// button[ 5] : -1
// button[ 6] : -5
// button[ 7] : -10
// button[ 8] : +0.1
// button[ 9] : +1
// button[10] : +5
// button[11] : +10
// button[12] : 戻る
// button[13] : 進む
// button[14] : 保存

void button_settings() {
  // button position and size settings
  buttons = new Button [15];
  for (int i = 0; i < 3; i++) {
    buttons[i] = new Button(WORK_WIDTH, i*BUTTON_HEIGHT, UI_WIDTH, BUTTON_HEIGHT, button_name[i]);
  }
  final int QUARTER_BUTTON_WIDTH = UI_WIDTH/4;
  buttons[3] = new Button(WORK_WIDTH, 3*BUTTON_HEIGHT, UI_WIDTH, int(BUTTON_HEIGHT*0.4), button_name[3]);
  for (int i = 0; i < 8; i++) {
    buttons[i+4] = new Button(WORK_WIDTH+(i%4)*QUARTER_BUTTON_WIDTH, int((3.4+(i/4)*0.3)*BUTTON_HEIGHT), QUARTER_BUTTON_WIDTH, int(BUTTON_HEIGHT*0.3), button_name[i+4]);
  }
  final int HALF_BUTTON_WIDTH = UI_WIDTH/2;
  for (int i = 0; i < 2; i++) {
    buttons[i+12] = new Button(WORK_WIDTH+i*HALF_BUTTON_WIDTH, 4*BUTTON_HEIGHT, HALF_BUTTON_WIDTH, BUTTON_HEIGHT, button_name[i+12]);
  }
  buttons[14] = new Button(WORK_WIDTH, 5*BUTTON_HEIGHT, UI_WIDTH, BUTTON_HEIGHT, button_name[14]);


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
      buttons[1].selected = true;
      buttons[2].selected = false;
    }
  }
  );
  buttons[2].setBehave(new Behavior() {
    public void behave() {
      MODE = FLOOD_TRANS;
      buttons[1].selected = false;
      buttons[2].selected = true;
    }
  }
  );
  buttons[4].setBehave(new Behavior() {
    public void behave() {
      AFFORD_DIFF = max(0, AFFORD_DIFF-0.1);
      buttons[3].setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  );
  buttons[5].setBehave(new Behavior() {
    public void behave() {
      AFFORD_DIFF = max(0, AFFORD_DIFF-1);
      buttons[3].setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  );
  buttons[6].setBehave(new Behavior() {
    public void behave() {
      AFFORD_DIFF = max(0, AFFORD_DIFF-5);
      buttons[3].setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  );
  buttons[7].setBehave(new Behavior() {
    public void behave() {
      AFFORD_DIFF = max(0, AFFORD_DIFF-10);
      buttons[3].setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  );
  buttons[8].setBehave(new Behavior() {
    public void behave() {
      AFFORD_DIFF = min(999.9, AFFORD_DIFF+0.1);
      buttons[3].setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  );
  buttons[9].setBehave(new Behavior() {
    public void behave() {
      AFFORD_DIFF = min(999.9, AFFORD_DIFF+1);
      buttons[3].setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  );
  buttons[10].setBehave(new Behavior() {
    public void behave() {
      AFFORD_DIFF = min(999.9, AFFORD_DIFF+5);
      buttons[3].setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  );
  buttons[11].setBehave(new Behavior() {
    public void behave() {
      AFFORD_DIFF = min(999.9, AFFORD_DIFF+10);
      buttons[3].setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  );
  buttons[12].setBehave(new Behavior() {
    public void behave() {
      graphics = history.undo();
      setScale();
    }
  }
  );
  buttons[13].setBehave(new Behavior() {
    public void behave() {
      graphics = history.redo();
      setScale();
    }
  }
  );
  buttons[14].setBehave(new Behavior() {
    public void behave() {
      selectOutput("Save image as png file", "imgSave");
    }
  }
  );

  // button disanable settings
  buttons[3].setAnable(false);
}