final int WORK_WIDTH     = 960;
final int WORK_HEIGHT    = 720;
final int UI_WIDTH       = 240;
final int BUTTON_HEIGHT  = 120;
final int BACK_RECT_SIZE =  12;
final int   BRUSH_RADIUS =   8;

final int ANOTHER        =   0;
final int TRANS          =   1;
final int FLOOD_TRANS    =   2;
final int BRUSH          =   3;
final int RECTANGLE      =   4;

int   mode        =   0;
float scale       =   1;
float afford_diff = 100;

PGraphics                 graphics;
HashMap<String, Button>    buttons;
History                    history;
JPanel                      jPanel;
DropTarget              dropTarget;

PImage  bucket_icon;
PImage syringe_icon;

boolean mouseEntered = false;

// for dragging file
boolean fileDragged  = false;
int     dragAlpha    = 0;

// for BRUSH mode
boolean isBrushed = false;

// for RECTANGLE mode
int rectStartX = -1;
int rectStartY = -1;