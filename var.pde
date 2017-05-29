final int WORK_WIDTH     = 960;
final int WORK_HEIGHT    = 720;
final int UI_WIDTH       = 240;
final int BUTTON_HEIGHT  = 120;

final int BACK_RECT_SIZE =  10;

final int ANOTHER        =   0;
final int TRANS          =   1;
final int FLOOD_TRANS    =   2;

PGraphics graphics;
int MODE = 0;
//float img_width  = 0;
//float img_height = 0;
int AFFORD_DIFF = 50;

Button[] buttons;
String[] button_name =
  {
  "開く(O)", 
  "透過", 
  "塗りつぶし透過", 
  "許容値", 
  "-", 
  String.valueOf(AFFORD_DIFF), 
  "+", 
  "戻る", 
  "進む", 
  "保存(S)"
};

History history;