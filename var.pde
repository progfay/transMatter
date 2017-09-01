final int WORK_WIDTH     = 960;
final int WORK_HEIGHT    = 720;
final int UI_WIDTH       = 240;
final int BUTTON_HEIGHT  = 120;
final int BACK_RECT_SIZE =  10;

final int ANOTHER        =   0;
final int TRANS          =   1;
final int FLOOD_TRANS    =   2;
final int BRUSH          =   3;
final int RECTANGLE      =   4;

PGraphics graphics;
int mode        = 0;
float SCALE     = 1;

float AFFORD_DIFF   = 100;
int   ERASER_RADIUS = 8;

HashMap<String, Button> buttons;

History history;

// for RECTANGLE mode
int rectStartX = -1;
int rectStartY = -1;