CONST Radian = 3.141592654 / 180

TYPE Object
    X AS INTEGER
    Y AS INTEGER
    OldX AS INTEGER
    OldY AS INTEGER
    Angle AS _FLOAT
    Image AS LONG
END TYPE

DIM WindowWidth AS _UNSIGNED INTEGER
DIM WindowHeight AS _UNSIGNED INTEGER
DIM WindowTopLeftX AS _UNSIGNED INTEGER
DIM WindowTopLeftY AS _UNSIGNED INTEGER

DIM PendulumHorizontalAngle AS _FLOAT
DIM PendulumVerticalAngle AS _FLOAT

DIM MainWindow AS LONG
DIM BackgroundImage AS LONG

DIM Planes(3) AS Object

DIM Counter AS _UNSIGNED LONG

WindowWidth = _DESKTOPWIDTH - 25
WindowHeight = _DESKTOPHEIGHT - 90
WindowTopLeftX = (_DESKTOPWIDTH - WindowWidth) / 2 - 3
WindowTopLeftY = (_DESKTOPHEIGHT - WindowHeight) / 2 - 35

MainWindow = _NEWIMAGE(WindowWidth, WindowHeight, 32)
Planes(0).Image = _LOADIMAGE("Plane2.png", 32)
Planes(1).Image = Planes(0).Image
Planes(2).Image = Planes(0).Image
Planes(3).Image = Planes(0).Image

SCREEN MainWindow
_SCREENMOVE WindowTopLeftX, WindowTopLeftY

_TITLE "Background refresh demo by Walter Whitman @ The Joyful Programmer dot com"

BackgroundImage = _NEWIMAGE(WindowWidth, WindowHeight, 32)

'  DRAW BACKGROUND IMAGE
_DEST BackgroundImage

LINE (0, 0)-(WindowWidth - 1, WindowHeight - 1), _RGB32(180, 255, 180), BF

FOR x = -WindowWidth TO WindowWidth * 2 STEP 8
    LINE (x, 0)-(x + WindowHeight, WindowHeight), _RGB32(80, 200, 80)
    LINE (x, WindowHeight)-(x + WindowHeight, 0), _RGB32(80, 200, 80)
NEXT


'  SET TO MAIN WINDOW
_DEST MainWindow

'  DRAW ENTIRE IMAGE TO BEGIN WITH
_PUTIMAGE (0, 0), BackgroundImage, MainWindow

_PRINTMODE _KEEPBACKGROUND

DO

    _LIMIT 60

    y1 = WindowHeight / 6 * 2
    y2 = WindowHeight / 6 * 4

    Planes(0).OldX = Planes(0).X
    Planes(0).OldY = Planes(0).Y
    Planes(1).OldX = Planes(1).X
    Planes(1).OldY = Planes(1).Y
    Planes(2).OldX = Planes(2).X
    Planes(2).OldY = Planes(2).Y
    Planes(3).OldX = Planes(3).X
    Planes(3).OldY = Planes(3).Y

    Planes(0).X = WindowWidth / 2 + (WindowWidth - _WIDTH(Planes(0).Image)) * SIN(PendulumHorizontalAngle * Radian) * COS(PendulumHorizontalAngle * Radian)
    Planes(0).Y = WindowHeight / 2 + (WindowHeight / 2 - _HEIGHT(Planes(0).Image) / 2) * SIN(PendulumVerticalAngle * Radian)
    Planes(1).X = WindowWidth - Planes(0).X
    Planes(1).Y = WindowHeight - Planes(0).Y
    Planes(2).X = WindowWidth / 2 + (WindowWidth / 2 - _WIDTH(Planes(2).Image) / 2) * SIN(PendulumHorizontalAngle * Radian)
    Planes(2).Y = WindowHeight / 2 + (WindowHeight - _HEIGHT(Planes(2).Image)) * SIN(PendulumVerticalAngle * Radian) * COS(PendulumVerticalAngle * Radian)
    Planes(3).X = WindowWidth - Planes(2).X
    Planes(3).Y = WindowHeight - Planes(2).Y

    Planes(0).Angle = -GetAngle(Planes(0).X, Planes(0).Y, Planes(0).OldX, Planes(0).OldY) + 180
    Planes(1).Angle = -GetAngle(Planes(1).X, Planes(1).Y, Planes(1).OldX, Planes(1).OldY) + 180
    Planes(2).Angle = -GetAngle(Planes(2).X, Planes(2).Y, Planes(2).OldX, Planes(2).OldY) + 180
    Planes(3).Angle = -GetAngle(Planes(3).X, Planes(3).Y, Planes(3).OldX, Planes(3).OldY) + 180

    '  PLACE PLANES ON SCREEN
    DisplayImage Planes(2).Image, Planes(2).X, Planes(2).Y, Planes(2).Angle, 0
    DisplayImage Planes(3).Image, Planes(3).X, Planes(3).Y, Planes(3).Angle, 0


    '  PUT JUST A SLIVER OF THE BACKGROUND IMAGE ON SCREEN SO ONLY TO REFRESH THAT PARTICULAR AREA
    _PUTIMAGE (0, y1), BackgroundImage, MainWindow, (0, y1)-(WindowWidth - 1, y2 - 1)


    '  PLACE PLANES ON SCREEN
    DisplayImage Planes(0).Image, Planes(0).X, Planes(0).Y, Planes(0).Angle, 0
    DisplayImage Planes(1).Image, Planes(1).X, Planes(1).Y, Planes(1).Angle, 0


    Msg$ = "COUNTER:" + STR$(Counter)

    COLOR _RGB32(100, 200, 100)

    FOR y = -1 TO 1
        FOR x = -1 TO 1
            _PRINTSTRING ((_WIDTH(Main_Window) - (8 * LEN(Msg$))) / 2 + x, _HEIGHT(Main_Window) / 2 - 8 + y), Msg$
        NEXT
    NEXT

    COLOR _RGB32(10, 120, 10)
    _PRINTSTRING ((_WIDTH(Main_Window) - (8 * LEN(Msg$))) / 2, _HEIGHT(Main_Window) / 2 - 8), Msg$

    COLOR _RGB32(240, 240, 10)
    _PRINTSTRING ((_WIDTH(Main_Window) - (8 * LEN(Msg$))) / 2, _HEIGHT(Planes(0).Image) / 2), Msg$

    COLOR _RGB32(RND * 256, RND * 256, RND * 256)
    _PRINTSTRING ((_WIDTH(Main_Window) - (8 * LEN(Msg$))) / 2, _HEIGHT(Planes(0).Image)), Msg$

    COLOR _RGB32(100, 200, 100)

    FOR y = -1 TO 1
        FOR x = -1 TO 1
            _PRINTSTRING ((_WIDTH(Main_Window) - (8 * LEN(Msg$))) / 2 + x, _HEIGHT(Planes(0).Image) * 1.625 - 8 + y), Msg$
        NEXT
    NEXT

    COLOR _RGB32(10, 120, 10)
    _PRINTSTRING ((_WIDTH(Main_Window) - (8 * LEN(Msg$))) / 2, _HEIGHT(Planes(0).Image) * 1.625 - 8), Msg$


    PendulumHorizontalAngle = 1.000013 * PendulumHorizontalAngle + 1.01 '1.0000001# *
    PendulumVerticalAngle = PendulumVerticalAngle + 1

    _DISPLAY

    Counter = Counter + 7

    k& = _KEYHIT
    IF k& = 27 THEN SYSTEM

LOOP



' *************************************************************************************************
' *                                                                                               *
' *************************************************************************************************
FUNCTION GetAngle# (x1#, y1#, x2#, y2#) 'returns 0-359.99...
    IF y2# = y1# THEN
        IF x1# = x2# THEN EXIT FUNCTION
        IF x2# > x1# THEN GetAngle# = 90 ELSE GetAngle# = 270
        EXIT FUNCTION
    END IF
    IF x2# = x1# THEN
        IF y2# > y1# THEN GetAngle# = 180
        EXIT FUNCTION
    END IF
    IF y2# < y1# THEN
        IF x2# > x1# THEN
            GetAngle# = ATN((x2# - x1#) / (y2# - y1#)) * -57.2957795131
        ELSE
            GetAngle# = ATN((x2# - x1#) / (y2# - y1#)) * -57.2957795131 + 360
        END IF
    ELSE
        GetAngle# = ATN((x2# - x1#) / (y2# - y1#)) * -57.2957795131 + 180
    END IF
END FUNCTION




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

