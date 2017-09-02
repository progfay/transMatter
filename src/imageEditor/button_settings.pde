/*
 button[ open] : "開く(O)"
 button[trans] : "透過"
 button[flood] : "塗りつぶし透過"
 button[brush] : "ブラシ"
 button[ rect] : "矩形"
 button[param] : "許容値 " + String.valueOf(AFFORD_DIFF)
 button[ -0.1] : "-0.1"
 button[ -  1] : "-1"
 button[ -  5] : "-5"
 button[ - 10] : "-10"
 button[ +0.1] : "+0.1"
 button[ +  1] : "+1"
 button[ +  5] : "+5"
 button[ + 10] : "+10"
 button[ undo] : "戻る"
 button[ redo] : "進む"
 button[ save] : "保存(S)"
 */

void button_settings() {
  // fontSize valiables
  int bigFontSize   = 30;
  int smallFontSize = 20;

  // button position and size settings
  buttons = new HashMap<String, Button>();

  // open image
  buttons.put("open", new Button("開く(O)", WORK_WIDTH, 0, UI_WIDTH, BUTTON_HEIGHT, bigFontSize, 
    new Behavior() {
    public void behave() {
      selectInput("Open image", "imgOpen");
    }
  }
  ));

  // function button that make transparent
  buttons.put("trans", new Button("透過", WORK_WIDTH, BUTTON_HEIGHT, UI_WIDTH, BUTTON_HEIGHT * 2 / 3, bigFontSize, 
    new Behavior() {
    public void behave() {
      mode = TRANS;
      buttons.get("trans").setSelected( true);
      buttons.get("flood").setSelected(false);
      buttons.get("brush").setSelected(false);
      buttons.get( "rect").setSelected(false);
    }
  }
  ));

  // function button that make flood transparent
  buttons.put("flood", new Button("塗りつぶし透過", WORK_WIDTH, BUTTON_HEIGHT * 5 / 3, UI_WIDTH, BUTTON_HEIGHT * 2 / 3, bigFontSize, 
    new Behavior() {
    public void behave() {
      mode = FLOOD_TRANS;
      buttons.get("trans").setSelected(false);
      buttons.get("flood").setSelected( true);
      buttons.get("brush").setSelected(false);
      buttons.get( "rect").setSelected(false);
    }
  }
  ));

  // function button that use brush
  buttons.put("brush", new Button("ブラシ", WORK_WIDTH, BUTTON_HEIGHT * 7 / 3, UI_WIDTH/2, BUTTON_HEIGHT * 2 / 3, bigFontSize, 
    new Behavior() {
    public void behave() {
      mode = BRUSH;
      buttons.get("trans").setSelected(false);
      buttons.get("flood").setSelected(false);
      buttons.get("brush").setSelected( true);
      buttons.get( "rect").setSelected(false);
    }
  }
  ));

  // function button that use rectangle selection
  buttons.put("rect", new Button("矩形", WORK_WIDTH+UI_WIDTH/2, BUTTON_HEIGHT * 7 / 3, UI_WIDTH/2, BUTTON_HEIGHT * 2 / 3, bigFontSize, 
    new Behavior() {
    public void behave() {
      mode = RECTANGLE;
      buttons.get("trans").setSelected(false);
      buttons.get("flood").setSelected(false);
      buttons.get("brush").setSelected(false);
      buttons.get( "rect").setSelected( true);
    }
  }
  ));

  // param display area
  buttons.put("param", new Button("許容値 "+String.valueOf(AFFORD_DIFF), WORK_WIDTH, BUTTON_HEIGHT * 3, UI_WIDTH, int(BUTTON_HEIGHT*0.4), bigFontSize, 
    new Behavior() {
    public void behave() {
    }
  }
  ));
  buttons.get("param").setAvailable(false);

  // up or down param buttons
  final int BUTTON_WIDTH = UI_WIDTH / 4;

  buttons.put("-0.1", new Button("-0.1", WORK_WIDTH, int(3.4*BUTTON_HEIGHT), BUTTON_WIDTH, int(BUTTON_HEIGHT*0.3), smallFontSize, 
    new Behavior() {
    public void behave() {
      AFFORD_DIFF = max(0.0f, AFFORD_DIFF-0.1);
      buttons.get("param").setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  ));
  buttons.put("-1", new Button("-1", WORK_WIDTH+BUTTON_WIDTH, int(3.4*BUTTON_HEIGHT), BUTTON_WIDTH, int(BUTTON_HEIGHT*0.3), smallFontSize, 
    new Behavior() {
    public void behave() {
      AFFORD_DIFF = max(0.0f, AFFORD_DIFF-1);
      buttons.get("param").setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  ));
  buttons.put("-5", new Button("-5", WORK_WIDTH+BUTTON_WIDTH*2, int(3.4*BUTTON_HEIGHT), BUTTON_WIDTH, int(BUTTON_HEIGHT*0.3), smallFontSize, 
    new Behavior() {
    public void behave() {
      AFFORD_DIFF = max(0.0f, AFFORD_DIFF-5);
      buttons.get("param").setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  ));
  buttons.put("-10", new Button("-10", WORK_WIDTH+BUTTON_WIDTH*3, int(3.4*BUTTON_HEIGHT), BUTTON_WIDTH, int(BUTTON_HEIGHT*0.3), smallFontSize, 
    new Behavior() {
    public void behave() {
      AFFORD_DIFF = max(0.0f, AFFORD_DIFF-10);
      buttons.get("param").setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  ));

  buttons.put("+0.1", new Button("+0.1", WORK_WIDTH, int(3.7*BUTTON_HEIGHT), BUTTON_WIDTH, int(BUTTON_HEIGHT*0.3), smallFontSize, 
    new Behavior() {
    public void behave() {
      AFFORD_DIFF = min(765.0f, AFFORD_DIFF+0.1);
      buttons.get("param").setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  ));
  buttons.put("+1", new Button("+1", WORK_WIDTH+BUTTON_WIDTH, int(3.7*BUTTON_HEIGHT), BUTTON_WIDTH, int(BUTTON_HEIGHT*0.3), smallFontSize, 
    new Behavior() {
    public void behave() {
      AFFORD_DIFF = min(765.0f, AFFORD_DIFF+1);
      buttons.get("param").setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  ));
  buttons.put("+5", new Button("+5", WORK_WIDTH+BUTTON_WIDTH*2, int(3.7*BUTTON_HEIGHT), BUTTON_WIDTH, int(BUTTON_HEIGHT*0.3), smallFontSize, 
    new Behavior() {
    public void behave() {
      AFFORD_DIFF = min(765.0f, AFFORD_DIFF+5);
      buttons.get("param").setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  ));
  buttons.put("+10", new Button("+10", WORK_WIDTH+BUTTON_WIDTH*3, int(3.7*BUTTON_HEIGHT), BUTTON_WIDTH, int(BUTTON_HEIGHT*0.3), smallFontSize, 
    new Behavior() {
    public void behave() {
      AFFORD_DIFF = min(765.0f, AFFORD_DIFF+10);
      buttons.get("param").setTitle("許容値 " + format(AFFORD_DIFF));
    }
  }
  ));

  // undo button
  buttons.put("undo", new Button("戻す", WORK_WIDTH, BUTTON_HEIGHT*4, UI_WIDTH/2, BUTTON_HEIGHT, bigFontSize, 
    new Behavior() {
    public void behave() {
      history.undo();
    }
  }
  ));

  // redo button
  buttons.put("redo", new Button("進む", WORK_WIDTH+UI_WIDTH/2, BUTTON_HEIGHT*4, UI_WIDTH/2, BUTTON_HEIGHT, bigFontSize, 
    new Behavior() {
    public void behave() {
      history.redo();
    }
  }
  ));

  // save image button
  buttons.put("save", new Button("保存(S)", WORK_WIDTH, BUTTON_HEIGHT*5, UI_WIDTH, BUTTON_HEIGHT, bigFontSize, 
    new Behavior() {
    public void behave() {
      selectOutput("Save image as png file", "imgSave");
    }
  }
  ));

  // button first state settings
  buttons.get("trans").behavior.behave();
}