_DEFINE A-Z AS _UNSIGNED LONG

TYPE POINT
    xc AS INTEGER
    yc AS INTEGER
    Colr AS _UNSIGNED LONG
END TYPE

TYPE iColors
    RedChange AS _FLOAT
    GreenChange AS _FLOAT
    BlueChange AS _FLOAT
END TYPE

DIM Triangle(2) AS POINT
DIM ScreenWidth AS _UNSIGNED INTEGER
DIM ScreenHeight AS _UNSIGNED INTEGER
DIM MainWindow AS _UNSIGNED LONG

DIM TopBottomXSlope AS _FLOAT
DIM TopCenterXSlope AS _FLOAT
DIM CenterBottomXSlope AS _FLOAT

DIM TriangleCount AS _UNSIGNED LONG

ScreenWidth = 800
ScreenHeight = 600

MainWindow = _NEWIMAGE(ScreenWidth, ScreenHeight, 32)
SCREEN MainWindow

'RANDOMIZE TIMER

' *** LOOP THROUGH THE DEMO UNTIL THE USER PRESS THE <ESC> KEY
DO
    TriangleCount = TriangleCount + 1

    CLS

    ' ** Make sure that none of the parts fall off the screen.
    xMargin% = 58
    yMargin% = 54

    ' *** Cut out text background so the real background can show through.
    _PRINTMODE _KEEPBACKGROUND
    COLOR _RGB(255, 255, 255): _PRINTSTRING (0, 0), "Triangle #" + LTRIM$(STR$(TriangleCount))

    ' *** Define Vector 0
    Triangle(0).xc = RND * (ScreenWidth - xMargin% * 2) + xMargin% 'ScreenWidth / 2
    Triangle(0).yc = RND * (ScreenHeight - yMargin% * 2) + yMargin% '50
    Triangle(0).Colr = _RGB(255, 0, 0) ' RED
    'Triangle(0).Colr = _RGB(RND * 256, RND * 256, RND * 256) '_RGB(255, 0, 0)

    ' *** Define Vector 1
    Triangle(1).xc = RND * (ScreenWidth - xMargin% * 2) + xMargin% '300 '100
    Triangle(1).yc = RND * (ScreenHeight - yMargin% * 2) + yMargin% ' - RND * 200 'ScreenHeight - 50
    Triangle(1).Colr = _RGB(0, 255, 0) ' GREEN
    'Triangle(1).Colr = _RGB(RND * 256, RND * 256, RND * 256) '_RGB(0, 255, 0)

    ' *** Define Vector 2
    Triangle(2).xc = RND * (ScreenWidth - xMargin% * 2) + xMargin% ' - RND * 300 'ScreenWidth - 100
    Triangle(2).yc = RND * (ScreenHeight - yMargin% * 2) + yMargin% ' - RND * 200 'Triangle(1).yc
    Triangle(2).Colr = _RGB(0, 0, 255) ' BLUE
    'Triangle(2).Colr = _RGB(RND * 256, RND * 256, RND * 256) '_RGB(0, 0, 255)

    ' *** Show the user(s) the original vector position before they were sorted below.
    COLOR Triangle(0).Colr: _PRINTSTRING (Triangle(0).xc - (_PRINTWIDTH("000        000") / 2), Triangle(0).yc - (_FONTHEIGHT / 2)), "000        000"
    COLOR Triangle(1).Colr: _PRINTSTRING (Triangle(1).xc - (_PRINTWIDTH("111        111") / 2), Triangle(1).yc - (_FONTHEIGHT / 2)), "111        111"
    COLOR Triangle(2).Colr: _PRINTSTRING (Triangle(2).xc - (_PRINTWIDTH("222        222") / 2), Triangle(2).yc - (_FONTHEIGHT / 2)), "222        222"

    ' *** Sort the vectors by their Y-Coordinate values from least to most.
    FOR i = 0 TO 2
        FOR t = i + 1 TO i + 3
            IF Triangle(i).yc < Triangle(t MOD 3).yc THEN
                SWAP Triangle(i).yc, Triangle(t MOD 3).yc
                SWAP Triangle(i).xc, Triangle(t MOD 3).xc
                SWAP Triangle(i).Colr, Triangle(t MOD 3).Colr
            END IF
            IF Triangle(i).yc = Triangle(t MOD 3).yc AND Triangle(i).xc < Triangle(t MOD 3).xc THEN
                SWAP Triangle(i).yc, Triangle(t MOD 3).yc
                SWAP Triangle(i).xc, Triangle(t MOD 3).xc
                SWAP Triangle(i).Colr, Triangle(t MOD 3).Colr
            END IF
        NEXT
    NEXT

    ' *** Draw circles on each vector to show the VECTOR representation.
    CIRCLE (Triangle(0).xc, Triangle(0).yc), 30, Triangle(0).Colr
    CIRCLE (Triangle(1).xc, Triangle(1).yc), 30, Triangle(1).Colr
    CIRCLE (Triangle(2).xc, Triangle(2).yc), 30, Triangle(2).Colr

    ' *** Print white text in each circle.
    COLOR _RGB(255, 255, 255)
    _PRINTSTRING (Triangle(0).xc - (_PRINTWIDTH("TOP") / 2), Triangle(0).yc - (_FONTHEIGHT / 2)), "TOP"
    _PRINTSTRING (Triangle(1).xc - (_PRINTWIDTH("CENTER") / 2), Triangle(1).yc - (_FONTHEIGHT / 2)), "CENTER"
    _PRINTSTRING (Triangle(2).xc - (_PRINTWIDTH("BOTTOM") / 2), Triangle(2).yc - (_FONTHEIGHT / 2)), "BOTTOM"

    ' *** Draw ghost lines around the triangle.
    LINE (Triangle(0).xc, Triangle(0).yc)-(Triangle(1).xc, Triangle(1).yc), _RGB(32, 32, 32)
    LINE -(Triangle(2).xc, Triangle(2).yc), _RGB(32, 32, 32)
    LINE -(Triangle(0).xc, Triangle(0).yc), _RGB(32, 32, 32)

    'DO: k$ = INKEY$: _DELAY 0.05: LOOP WHILE k$ = ""
    'IF k$ = CHR$(27) THEN SYSTEM

    ' *** Get the slope for each side of the triangle.
    TopBottomXSlope = (Triangle(0).xc - Triangle(2).xc) / (Triangle(0).yc - Triangle(2).yc)
    TopCenterXSlope = (Triangle(0).xc - Triangle(1).xc) / (Triangle(0).yc - Triangle(1).yc)
    CenterBottomXSlope = (Triangle(1).xc - Triangle(2).xc) / (Triangle(1).yc - Triangle(2).yc)

    LeftSide# = Triangle(0).xc
    RightSided# = LeftSide#
    SXAdd# = TopCenterXSlope

    _PRINTMODE _FILLBACKGROUND

    ' *** slowly draw yellow dots along the sides of the triangle, to show how the triangle will be drawn
    FOR y = Triangle(0).yc TO Triangle(2).yc

        'FOR xx% = -1 TO 1
        PSET (LeftSide# + xx%, y), _RGB(19, 198, 242)
        PSET (RightSided# + xx%, y), _RGB(255, 95, 15)
        'NEXT

        IF y = Triangle(1).yc THEN SXAdd# = CenterBottomXSlope
        LeftSide# = LeftSide# + TopBottomXSlope
        RightSided# = RightSided# + SXAdd#

        _DELAY 0.003

    NEXT

    'DO: k$ = INKEY$: _DELAY 0.05: LOOP WHILE k$ = ""
    'IF k$ = CHR$(27) THEN SYSTEM

    ' *** This is to help demonstrate to the developer each vector's color.
    TopColor& = Triangle(0).Colr
    CenterColor& = Triangle(1).Colr
    BottomColor& = Triangle(2).Colr

    ' *** Both sides start at the same X & Y Coordinates.
    LeftSide# = Triangle(0).xc
    RightSide# = LeftSide#
    LineWidth% = RightSide# - LeftSide#

    LeftStartY% = Triangle(0).yc
    RightStartY% = Triangle(0).yc

    ' *** Determine Which side the Center Vector is on: Left or Right, and setup accordingly.
    IF TopBottomXSlope < TopCenterXSlope THEN

        ' *** Center is to the right
        LeftSlope# = TopBottomXSlope
        RightSlope# = TopCenterXSlope

        LeftStartColor& = TopColor&
        LeftEndColor& = BottomColor&
        RightStartColor& = TopColor&
        RightEndColor& = CenterColor&

        LeftLen% = Triangle(2).yc - Triangle(0).yc
        RightLen% = Triangle(1).yc - Triangle(0).yc

    ELSE

        ' *** Center is the the left
        LeftSlope# = TopCenterXSlope
        RightSlope# = TopBottomXSlope

        LeftStartColor& = TopColor&
        LeftEndColor& = CenterColor&
        RightStartColor& = TopColor&
        RightEndColor& = BottomColor&

        LeftLen% = Triangle(1).yc - Triangle(0).yc
        RightLen% = Triangle(2).yc - Triangle(0).yc

    END IF

    ' *** Draw the triangle from the top to the center
    FOR y% = Triangle(0).yc TO Triangle(1).yc

        LeftColor& = InterpolateColor(LeftStartColor&, LeftEndColor&, LeftLen%, y% - LeftStartY%)
        RightColor& = InterpolateColor(RightStartColor&, RightEndColor&, RightLen%, y% - RightStartY%)

        FOR x% = LeftSide# TO RightSide#
            PSET (x%, y%), InterpolateColor(LeftColor&, RightColor&, LineWidth%, x% - LeftSide#)
        NEXT

        LeftSide# = LeftSide# + LeftSlope#
        RightSide# = RightSide# + RightSlope#
        LineWidth% = RightSide# - LeftSide#

        _DELAY 0.003

    NEXT

    LeftSide# = LeftSide# - LeftSlope#
    RightSide# = RightSide# - RightSlope#
    LineWidth% = RightSide# - LeftSide#

    ' *** Check to see which side the center is on and adjust that side accordingly
    IF TopBottomXSlope < TopCenterXSlope THEN

        ' *** Center is to the right
        RightLen% = Triangle(2).yc - Triangle(1).yc - 1
        RightSlope# = CenterBottomXSlope
        RightStartColor& = CenterColor&
        RightEndColor& = BottomColor&
        RightLen% = Triangle(2).yc - Triangle(1).yc

        LeftStartY% = Triangle(0).yc
        RightStartY% = Triangle(1).yc

    ELSE

        ' *** Center is the the left
        LeftLen% = Triangle(2).yc - Triangle(1).yc - 1
        LeftSlope# = CenterBottomXSlope
        LeftStartColor& = CenterColor&
        LeftEndColor& = BottomColor&
        LeftLen% = Triangle(2).yc - Triangle(1).yc

        LeftStartY% = Triangle(1).yc
        RightStartY% = Triangle(0).yc

    END IF

    ' *** Skip drawing the center line again
    LeftSide# = LeftSide# + LeftSlope#
    RightSide# = RightSide# + RightSlope#
    LineWidth% = RightSide# - LeftSide#

    ' *** Draw the triangle from center to bottom
    FOR y% = Triangle(1).yc + 1 TO Triangle(2).yc

        LeftColor& = InterpolateColor(LeftStartColor&, LeftEndColor&, LeftLen%, y% - LeftStartY%)
        RightColor& = InterpolateColor(RightStartColor&, RightEndColor&, RightLen%, y% - RightStartY%)

        FOR x% = LeftSide# TO RightSide#
            PSET (x%, y%), InterpolateColor(LeftColor&, RightColor&, LineWidth%, x% - LeftSide#)
        NEXT

        LeftSide# = LeftSide# + LeftSlope#
        RightSide# = RightSide# + RightSlope#
        LineWidth% = RightSide# - LeftSide#

        _DELAY 0.003

    NEXT

    _PRINTSTRING (2, ScreenHeight - 18), "Press <ESC> to exit the demo, or any other key to draw another triangle."

    DO: k$ = INKEY$: _DELAY 0.05: LOOP WHILE k$ = ""
    IF k$ = CHR$(27) THEN SYSTEM

LOOP


' *************************************************************************************************
' *                                                                                               *
' *  InterpolateColor                                                                             *
' *                                                                                               *
' *************************************************************************************************
FUNCTION InterpolateColor~& (StartColor AS _UNSIGNED LONG, EndColor AS _UNSIGNED LONG, TotalColorPoints AS _UNSIGNED LONG, CurrentColorPoint AS _UNSIGNED LONG)

DIM StartRed AS _UNSIGNED _BYTE
DIM StartGreen AS _UNSIGNED _BYTE
DIM StartBlue AS _UNSIGNED _BYTE
DIM EndRed AS _UNSIGNED _BYTE
DIM EndGreen AS _UNSIGNED _BYTE
DIM EndBlue AS _UNSIGNED _BYTE
DIM RedInc AS _FLOAT
DIM GreenInc AS _FLOAT
DIM BlueInc AS _FLOAT
DIM NewRed AS _UNSIGNED LONG
DIM NewGreen AS _UNSIGNED LONG
DIM NewBlue AS _UNSIGNED LONG

StartRed = _RED32(StartColor)
StartGreen = _GREEN32(StartColor)
StartBlue = _BLUE32(StartColor)

EndRed = _RED32(EndColor)
EndGreen = _GREEN32(EndColor)
EndBlue = _BLUE32(EndColor)

RedInc = (StartRed - EndRed) / TotalColorPoints
GreenInc = (StartGreen - EndGreen) / TotalColorPoints
BlueInc = (StartBlue - EndBlue) / TotalColorPoints

NewRed = StartRed - RedInc * CurrentColorPoint
NewGreen = StartGreen - GreenInc * CurrentColorPoint
NewBlue = StartBlue - BlueInc * CurrentColorPoint

'PRINT "StartRed: "; StartRed, "StartGreen: "; StartGreen, "StartBlue: "; StartBlue
'PRINT "RedInc: "; RedInc, "GreenInc: "; GreenInc, "BlueInc: "; BlueInc
'LOCATE 10, 1: PRINT "NewRed: "; NewRed, "NewGreen: "; NewGreen, "NewBlue: "; NewBlue
'PRINT

InterpolateColor~& = _RGB32(NewRed, NewGreen, NewBlue)

END FUNCTION

