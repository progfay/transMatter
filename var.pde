final int WORK_WIDTH     = 960;
final int WORK_HEIGHT    = 720;
final int UI_WIDTH       = 240;
final int BUTTON_HEIGHT  = 120;
final int BACK_RECT_SIZE =  10;
final int ANOTHER        =   0;
final int TRANS          =   1;
final int FLOOD_TRANS    =   2;

PGraphics graphics;
int MODE        = 0;
float SCALE     = 1;
float AFFORD_DIFF = 100;


Button[] buttons;
String[] button_name =
  {
  "開く(O)", 
  "透過", 
  "塗りつぶし透過", 
  "許容値 " + String.valueOf(AFFORD_DIFF), 
  "-0.1", 
  "-1", 
  "-5", 
  "-10", 
  "+0.1", 
  "+1", 
  "+5", 
  "+10", 
  "戻る", 
  "進む", 
  "保存(S)"
};

History history;