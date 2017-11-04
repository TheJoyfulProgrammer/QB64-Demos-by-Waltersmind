DIM WindowWidth AS _UNSIGNED INTEGER
DIM WindowHeight AS _UNSIGNED INTEGER
DIM MainWindow AS LONG
DIM MainWheel AS LONG
DIM CenterDecal AS LONG
DIM WheelCover AS LONG
DIM WheelAngle AS INTEGER
DIM BackgroundImage AS LONG
DIM BackgroundImageTexture AS LONG


'  DEFINE THE WIDTH AND HEIGHT OF THE WINDOW
WindowWidth = 800
WindowHeight = 700

'  CREATE IMAGE FOR MAIN WINDOW
MainWindow = _NEWIMAGE(WindowWidth, WindowHeight, 32)

'  CREATE IMAGE FOR BACKGROUND
BackgroundImage = _NEWIMAGE(WindowWidth, WindowHeight, 32)

'  LET'S TELL QB64 TO DRAW TO THE BACKGROUND IMAGE
_DEST BackgroundImage
_SOURCE BackgroundImage

'  CLEAR THE IMAGE WITH A COLOR
'CLS _RGB(255, 216, 99)
LINE (0, 0)-(WindowWidth, WindowHeight), _RGB(255, 216, 99), BF

'  CONVERT THE BACKGROUND INTO A HARDWARE TEXTURE
BackgroundImageTexture = _COPYIMAGE(BackgroundImage, 33)

SCREEN MainWindow
CenterWindow MainWindow

_DISPLAYORDER _HARDWARE , _GLRENDER , _HARDWARE1 , _SOFTWARE

_TITLE "Spinning RGB Sub-Pixel Color Wheel Demo - By: The Joyful Programmer"

'  LET'S LOAD THE NEEDED IMAGES AS HARDWARE IMAGES
MainWheel = _LOADIMAGE("RGB-Sub-Pixel-Color-Wheel-MAIN-WHEEL.png", 33)
CenterDecal = _LOADIMAGE("RGB-Sub-Pixel-Color-Wheel-CENTER-DECAL.png", 33)
WheelCover = _LOADIMAGE("RGB-Sub-Pixel-Color-Wheel-WHEEL-COVER.png", 33)


' START OUR MAIN GAME LOOP
DO

    '  LET'S LIMNIT THE NUMBER OF FRAMES PER SECOND
    _LIMIT 15

    '  DRAW OUR IMAGES
    DisplayImage BackgroundImageTexture, 0, 0, 0, 1
    DisplayImage MainWheel, WindowWidth / 2, WindowHeight / 2, WheelAngle, 0
    DisplayImage CenterDecal, WindowWidth / 2, WindowHeight / 2, 0, 0
    DisplayImage WheelCover, WindowWidth / 2, WindowHeight / 2, 0, 0


    '  DO SOME MAGIC WITH THE ANGLE OF THE WHEEL
    WheelAngle = (WheelAngle - 10) MOD 360

    '  TELL QB64 TO DISPLAY THE CURRENT FRAME
    _DISPLAY

    IF _KEYHIT = 27 THEN SYSTEM '  IF THE ESC KEY IS PRESSED THEN EXIT

LOOP



SUB DisplayImage (Image AS LONG, x AS INTEGER, y AS INTEGER, angle AS SINGLE, mode AS _BYTE)
'Image is the image handle which we use to reference our image.
'x,y is the X/Y coordinates where we want the image to be at on the screen.
'angle is the angle which we wish to rotate the image.
'mode determines HOW we place the image at point X,Y.
'Mode 0 we center the image at point X,Y
'Mode 1 we place the Top Left corner of our image at point X,Y
'Mode 2 is Bottom Left
'Mode 3 is Top Right
'Mode 4 is Bottom Right


DIM px(3) AS INTEGER, py(3) AS INTEGER, w AS INTEGER, h AS INTEGER
DIM sinr AS SINGLE, cosr AS SINGLE, i AS _BYTE
w = _WIDTH(Image): h = _HEIGHT(Image)
SELECT CASE mode
    CASE 0 'center
        px(0) = -w \ 2: py(0) = -h \ 2
        px(3) = w \ 2: py(3) = -h \ 2
        px(1) = -w \ 2: py(1) = h \ 2
        px(2) = w \ 2: py(2) = h \ 2
    CASE 1 'top left
        px(0) = 0: py(0) = 0
        px(3) = w: py(3) = 0
        px(1) = 0: py(1) = h
        px(2) = w: py(2) = h
    CASE 2 'bottom left
        px(0) = 0: py(0) = -h
        px(3) = w: py(3) = -h
        px(1) = 0: py(1) = 0
        px(2) = w: py(2) = 0
    CASE 3 'top right
        px(0) = -w: py(0) = 0
        px(3) = 0: py(3) = 0
        px(1) = -w: py(1) = h
        px(2) = 0: py(2) = h
    CASE 4 'bottom right
        px(0) = -w: py(0) = -h
        px(3) = 0: py(3) = -h
        px(1) = -w: py(1) = 0: px(2) = 0: py(2) = 0
END SELECT

sinr = SIN(angle / 57.2957795131)
cosr = COS(angle / 57.2957795131)

FOR i = 0 TO 3
    x2 = (px(i) * cosr + sinr * py(i)) + x
    y2 = (py(i) * cosr - px(i) * sinr) + y
    px(i) = x2
    py(i) = y2
NEXT

_MAPTRIANGLE (0, 0)-(0, h - 1)-(w - 1, h - 1), Image TO(px(0), py(0))-(px(1), py(1))-(px(2), py(2)), , _SMOOTH
_MAPTRIANGLE (0, 0)-(w - 1, 0)-(w - 1, h - 1), Image TO(px(0), py(0))-(px(3), py(3))-(px(2), py(2)), , _SMOOTH

END SUB




SUB CenterWindow (CurrentWindow AS _UNSIGNED LONG)

DIM DeskTop AS _UNSIGNED LONG
DIM DT_Width AS _UNSIGNED LONG
DIM DT_Height AS _UNSIGNED LONG

DeskTop = _SCREENIMAGE ' *** Capture the Desktop image
DT_Width = _WIDTH(DeskTop) ' *** Get the Desktop Width
DT_Height = _HEIGHT(DeskTop) ' *** Get the Desktop Height

' *** Center the SCREEN on the Desktop (Only works with the latest QB64-GL dirty build)
_SCREENMOVE (DT_Width - _WIDTH(CurrentWindow)) / 2, (DT_Height - _HEIGHT(CurrentWindow)) / 2 - 29

'_FREEIMAGE DeskTop

END SUB


