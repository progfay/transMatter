// button[ 0] : 開く
// button[ 1] : 透過
// button[ 2] : 塗りつぶし透過
// button[ 3] : 消しゴム
// button[ 4] : 矩形選択
// button[ 5] : 透過度表示
// button[ 6] : -0.1
// button[ 7] : -1
// button[ 8] : -5
// button[ 9] : -10
// button[10] : +0.1
// button[11] : +1
// button[12] : +5
// button[13] : +10
// button[14] : 戻る
// button[15] : 進む
// button[16] : 保存

void button_settings() {
  // button position and size settings
  buttons = new Button [17];
  
  // button position initialize 0
  buttons[0] = new Button(WORK_WIDTH, 0, UI_WIDTH, BUTTON_HEIGHT, button_name[0]);
  
  // button position initialize 1 and 2
  final int TWO_THIRDS_BUTTON_HEIGHT = BUTTON_HEIGHT / 3 * 2;
  for (int i = 0; i < 2; i++) {
    buttons[i+1] = new Button(WORK_WIDTH, BUTTON_HEIGHT+i*TWO_THIRDS_BUTTON_HEIGHT, UI_WIDTH, TWO_THIRDS_BUTTON_HEIGHT, button_name[i+1]);
  }
  // button position initialize 3 and 4
  for (int i = 0; i < 2; i++) {
    buttons[i+3] = new Button(WORK_WIDTH+UI_WIDTH/2*i, BUTTON_HEIGHT+2*TWO_THIRDS_BUTTON_HEIGHT, UI_WIDTH/2, TWO_THIRDS_BUTTON_HEIGHT, button_name[i+3]);
  }
  
  // button position initialize 5
  final int QUARTER_BUTTON_WIDTH = UI_WIDTH/4;
  buttons[5] = new Button(WORK_WIDTH, 3*BUTTON_HEIGHT, UI_WIDTH, int(BUTTON_HEIGHT*0.4), button_name[5]);
  // button position initialize 6 to 13
  for (int i = 0; i < 8; i++) {
    buttons[i+6] = new Button(WORK_WIDTH+(i%4)*QUARTER_BUTTON_WIDTH, int((3.4+(i/4)*0.3)*BUTTON_HEIGHT), QUARTER_BUTTON_WIDTH, int(BUTTON_HEIGHT*0.3), button_name[i+6]);
  }
  // button position initialize 14 and 15
  final int HALF_BUTTON_WIDTH = UI_WIDTH/2;
  for (int i = 0; i < 2; i++) {
    buttons[i+14] = new Button(WORK_WIDTH+i*HALF_BUTTON_WIDTH, 4*BUTTON_HEIGHT, HALF_BUTTON_WIDTH, BUTTON_HEIGHT, button_name[i+14]);
  }
  // button position initialize 16
  buttons[16] = new Button(WORK_WIDTH, 5*BUTTON_HEIGHT, UI_WIDTH, BUTTON_HEIGHT, button_name[16]);


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
      buttons[3].selected = false;
      buttons[4].selected = false;
    }
  }
  );
  buttons[2].setBehave(new Behavior() {
    public void behave() {
      MODE = FLOOD_TRANS;
      buttons[1].selected = false;
      buttons[2].selected = true;
      buttons[3].selected = false;
      buttons[4].selected = false;
    }
  }
  );
  buttons[3].setBehave(new Behavior() {
    public void behave() {
      MODE = ERASER;
      buttons[1].selected = false;
      buttons[2].selected = false;
      buttons[3].selected = true;
      buttons[4].selected = false;
    }
  }
  );
  buttons[4].setBehave(new Behavior() {
    public void behave() {
      MODE = RECTANGLE;
      buttons[1].selected = false;
      buttons[2].selected = false;
      buttons[3].selected = false;
      buttons[4].selected = true;
    }
  }
  );
  buttons[6].setBehave(new Behavior() {
    public void behave() {
      AFFORD_DIFF = max(0, AFFORD_DIFF-0.1);
      buttons[3].setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  );
  buttons[7].setBehave(new Behavior() {
    public void behave() {
      AFFORD_DIFF = max(0, AFFORD_DIFF-1);
      buttons[3].setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  );
  buttons[8].setBehave(new Behavior() {
    public void behave() {
      AFFORD_DIFF = max(0, AFFORD_DIFF-5);
      buttons[3].setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  );
  buttons[9].setBehave(new Behavior() {
    public void behave() {
      AFFORD_DIFF = max(0, AFFORD_DIFF-10);
      buttons[3].setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  );
  buttons[10].setBehave(new Behavior() {
    public void behave() {
      AFFORD_DIFF = min(999.9, AFFORD_DIFF+0.1);
      buttons[3].setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  );
  buttons[11].setBehave(new Behavior() {
    public void behave() {
      AFFORD_DIFF = min(999.9, AFFORD_DIFF+1);
      buttons[3].setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  );
  buttons[12].setBehave(new Behavior() {
    public void behave() {
      AFFORD_DIFF = min(999.9, AFFORD_DIFF+5);
      buttons[3].setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  );
  buttons[13].setBehave(new Behavior() {
    public void behave() {
      AFFORD_DIFF = min(999.9, AFFORD_DIFF+10);
      buttons[3].setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  );
  buttons[14].setBehave(new Behavior() {
    public void behave() {
      graphics = history.undo();
      setScale();
    }
  }
  );
  buttons[15].setBehave(new Behavior() {
    public void behave() {
      graphics = history.redo();
      setScale();
    }
  }
  );
  buttons[16].setBehave(new Behavior() {
    public void behave() {
      selectOutput("Save image as png file", "imgSave");
    }
  }
  );

  // button disanable settings
  buttons[5].setAnable(false);
  
  // button first state settings
  buttons[1].behavior.behave();
}