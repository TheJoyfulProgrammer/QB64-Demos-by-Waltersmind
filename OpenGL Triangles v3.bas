TYPE GL_Triangle
    ColorPointA_Red AS _UNSIGNED _BYTE
    ColorPointA_Green AS _UNSIGNED _BYTE
    ColorPointA_Blue AS _UNSIGNED _BYTE
    ColorPointA_Alpha AS _UNSIGNED _BYTE
    ColorPointB_Red AS _UNSIGNED _BYTE
    ColorPointB_Green AS _UNSIGNED _BYTE
    ColorPointB_Blue AS _UNSIGNED _BYTE
    ColorPointB_Alpha AS _UNSIGNED _BYTE
    ColorPointC_Red AS _UNSIGNED _BYTE
    ColorPointC_Green AS _UNSIGNED _BYTE
    ColorPointC_Blue AS _UNSIGNED _BYTE
    ColorPointC_Alpha AS _UNSIGNED _BYTE
    X AS INTEGER
    Y AS INTEGER
    Z AS INTEGER
    RotationX AS _FLOAT
    RotationY AS _FLOAT
    RotationZ AS _FLOAT
    RotationXInc AS _FLOAT
    RotationYInc AS _FLOAT
    RotationZInc AS _FLOAT
    PointA_X AS _FLOAT
    PointA_Y AS _FLOAT
    PointA_Z AS _FLOAT
    PointB_X AS _FLOAT
    PointB_Y AS _FLOAT
    PointB_Z AS _FLOAT
    PointC_X AS _FLOAT
    PointC_Y AS _FLOAT
    PointC_Z AS _FLOAT
END TYPE

DIM MainScreen AS LONG
DIM SHARED ColorPoint AS DOUBLE
DIM SHARED FOV AS DOUBLE
DIM SHARED AspectRatio AS DOUBLE
DIM SHARED Near AS DOUBLE
DIM SHARED Far AS DOUBLE

DIM NumberOfTriangles AS _UNSIGNED LONG

REDIM SHARED Triangles(-1) AS GL_Triangle

CONST ScreenWidth = 800
CONST ScreenHeight = 600
NumberOfTriangles = 1000

ColorPoint = 1 / 255
FOV = 90
AspectRatio = ScreenWidth / ScreenHeight
Near = 1
Far = 100

REDIM SHARED Triangles(NumberOfTriangles - 1) AS GL_Triangle

MainScreen = _NEWIMAGE(ScreenWidth, ScreenHeight, 32)

SCREEN MainScreen


' *** Let's define the all the triangles we will be drawing

FOR i = 0 TO UBOUND(triangles)

    Triangles(i).ColorPointA_Red = INT(RND * 256) 'AS _UNSIGNED _BYTE
    Triangles(i).ColorPointA_Green = INT(RND * 256) 'AS _UNSIGNED _BYTE
    Triangles(i).ColorPointA_Blue = INT(RND * 256) 'AS _UNSIGNED _BYTE
    Triangles(i).ColorPointA_Alpha = INT(RND * 256) '128) + 64 'AS _UNSIGNED _BYTE
    Triangles(i).ColorPointB_Red = INT(RND * 256) 'AS _UNSIGNED _BYTE
    Triangles(i).ColorPointB_Green = INT(RND * 256) 'AS _UNSIGNED _BYTE
    Triangles(i).ColorPointB_Blue = INT(RND * 256) 'AS _UNSIGNED _BYTE
    Triangles(i).ColorPointB_Alpha = INT(RND * 256) '128) + 64 'AS _UNSIGNED _BYTE
    Triangles(i).ColorPointC_Red = INT(RND * 256) 'AS _UNSIGNED _BYTE
    Triangles(i).ColorPointC_Green = INT(RND * 256) 'AS _UNSIGNED _BYTE
    Triangles(i).ColorPointC_Blue = INT(RND * 256) 'AS _UNSIGNED _BYTE
    Triangles(i).ColorPointC_Alpha = INT(RND * 256) ' 128) + 64 'AS _UNSIGNED _BYTE
    Triangles(i).X = RND * 10 - 5 'AS INTEGER
    Triangles(i).Y = RND * 8 - 4 'AS INTEGER
    Triangles(i).Z = INT(RND * 6) - 10 '-5  'AS INTEGER
    Triangles(i).RotationX = RND * 360 'AS _FLOAT
    Triangles(i).RotationY = RND * 360 'AS _FLOAT
    Triangles(i).RotationZ = RND * 360 'AS _FLOAT
    Triangles(i).RotationXInc = RND * 2 'AS _FLOAT
    Triangles(i).RotationYInc = RND * 2 'AS _FLOAT
    Triangles(i).RotationZInc = RND * 2 'AS _FLOAT
    Triangles(i).PointA_X = RND * 2 - 1 'AS _FLOAT
    Triangles(i).PointA_Y = RND * 2 - 1 'AS _FLOAT
    Triangles(i).PointA_Z = RND * 2 - 1 'AS _FLOAT
    Triangles(i).PointB_X = RND * 2 - 1 'AS _FLOAT
    Triangles(i).PointB_Y = RND * 2 - 1 'AS _FLOAT
    Triangles(i).PointB_Z = RND * 2 - 1 'AS _FLOAT
    Triangles(i).PointC_X = RND * 2 - 1 'AS _FLOAT
    Triangles(i).PointC_Y = RND * 2 - 1 'AS _FLOAT
    Triangles(i).PointC_Z = RND * 2 - 1 'AS _FLOAT


NEXT

DO
    _LIMIT 60
    _DISPLAY

LOOP WHILE INKEY$ = ""
SYSTEM



SUB _GL

BG_Red = ColorPoint * 2
BG_Green = ColorPoint * 95
BG_Blue = ColorPoint * 193
BG_Alpha = 1

_glClearColor BG_Red, BG_Green, BG_Blue, BG_Alpha
_glClearDepth 1
_glLoadIdentity
_glMatrixMode _GL_PROJECTION
_gluPerspective FOV, AspectRatio, Near, Far
_glMatrixMode _GL_MODELVIEW
_glLoadIdentity
_glViewport 0, 0, ScreenWidth, ScreenHeight

_glClear _GL_COLOR_BUFFER_BIT

' *** TURN ON TRANSPARENCY
_glEnable (_GL_BLEND)


FOR i = 0 TO UBOUND(triangles)


    _glLoadIdentity
    _glTranslatef Triangles(i).X, Triangles(i).Y, Triangles(i).Z

    _glRotatef Triangles(i).RotationX, 1, 0, 0
    _glRotatef Triangles(i).RotationY, 0, 1, 0
    _glRotatef Triangles(i).RotationZ, 0, 0, 1

    _glBegin _GL_TRIANGLES

    _glColor4ub Triangles(i).ColorPointA_Red, Triangles(i).ColorPointA_Green, Triangles(i).ColorPointA_Blue, Triangles(i).ColorPointA_Alpha
    _glVertex3f Triangles(i).PointA_X, Triangles(i).PointA_Y, Triangles(i).PointA_Z

    _glColor4ub Triangles(i).ColorPointB_Red, Triangles(i).ColorPointB_Green, Triangles(i).ColorPointB_Blue, Triangles(i).ColorPointB_Alpha
    _glVertex3f Triangles(i).PointB_X, Triangles(i).PointB_Y, Triangles(i).PointB_Z

    _glColor4ub Triangles(i).ColorPointC_Red, Triangles(i).ColorPointC_Green, Triangles(i).ColorPointC_Blue, Triangles(i).ColorPointC_Alpha
    _glVertex3f Triangles(i).PointC_X, Triangles(i).PointC_Y, Triangles(i).PointC_Z

    _glEnd

    Triangles(i).RotationX = Triangles(i).RotationX + Triangles(i).RotationXInc: IF Triangles(i).RotationX > 360 THEN Triangles(i).RotationX = Triangles(i).RotationX - 360
    Triangles(i).RotationY = Triangles(i).RotationY + Triangles(i).RotationYInc: IF Triangles(i).RotationY > 360 THEN Triangles(i).RotationY = Triangles(i).RotationY - 360
    Triangles(i).RotationZ = Triangles(i).RotationZ + Triangles(i).RotationZInc: IF Triangles(i).RotationZ > 360 THEN Triangles(i).RotationZ = Triangles(i).RotationZ - 360

    Triangles(i).ColorPointA_Red = Triangles(i).ColorPointA_Red + 1: IF Triangles(i).ColorPointA_Red > 255 THEN Triangles(i).ColorPointA_Red = Triangles(i).ColorPointA_Red - 255
    Triangles(i).ColorPointA_Green = Triangles(i).ColorPointA_Green + 1: IF Triangles(i).ColorPointA_Green > 255 THEN Triangles(i).ColorPointA_Green = Triangles(i).ColorPointA_Green - 255
    Triangles(i).ColorPointA_Blue = Triangles(i).ColorPointA_Blue + 1: IF Triangles(i).ColorPointA_Blue > 255 THEN Triangles(i).ColorPointA_Blue = Triangles(i).ColorPointA_Blue - 255
    Triangles(i).ColorPointA_Alpha = Triangles(i).ColorPointA_Alpha + 15: IF Triangles(i).ColorPointA_Alpha > 255 THEN Triangles(i).ColorPointA_Alpha = Triangles(i).ColorPointA_Alpha - 255

    Triangles(i).ColorPointB_Red = Triangles(i).ColorPointB_Red + 1: IF Triangles(i).ColorPointB_Red > 255 THEN Triangles(i).ColorPointB_Red = Triangles(i).ColorPointB_Red - 255
    Triangles(i).ColorPointB_Green = Triangles(i).ColorPointB_Green + 1: IF Triangles(i).ColorPointB_Green > 255 THEN Triangles(i).ColorPointB_Green = Triangles(i).ColorPointB_Green - 255
    Triangles(i).ColorPointB_Blue = Triangles(i).ColorPointB_Blue + 1: IF Triangles(i).ColorPointB_Blue > 255 THEN Triangles(i).ColorPointB_Blue = Triangles(i).ColorPointB_Blue - 255
    Triangles(i).ColorPointB_Alpha = Triangles(i).ColorPointB_Alpha + 15: IF Triangles(i).ColorPointB_Alpha > 255 THEN Triangles(i).ColorPointB_Alpha = Triangles(i).ColorPointB_Alpha - 255

    Triangles(i).ColorPointC_Red = Triangles(i).ColorPointC_Red + 1: IF Triangles(i).ColorPointC_Red > 255 THEN Triangles(i).ColorPointC_Red = Triangles(i).ColorPointC_Red - 255
    Triangles(i).ColorPointC_Green = Triangles(i).ColorPointC_Green + 1: IF Triangles(i).ColorPointC_Green > 255 THEN Triangles(i).ColorPointC_Green = Triangles(i).ColorPointC_Green - 255
    Triangles(i).ColorPointC_Blue = Triangles(i).ColorPointC_Blue + 1: IF Triangles(i).ColorPointC_Blue > 255 THEN Triangles(i).ColorPointC_Blue = Triangles(i).ColorPointC_Blue - 255
    Triangles(i).ColorPointC_Alpha = Triangles(i).ColorPointC_Alpha + 15: IF Triangles(i).ColorPointC_Alpha > 255 THEN Triangles(i).ColorPointC_Alpha = Triangles(i).ColorPointC_Alpha - 255


NEXT

END SUB