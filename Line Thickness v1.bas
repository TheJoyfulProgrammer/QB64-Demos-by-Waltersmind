$RESIZE:ON

DIM SHARED MainWindow AS _UNSIGNED LONG
DIM SHARED ScreenWidth AS INTEGER
DIM SHARED ScreenHeight AS INTEGER
DIM SHARED Degree AS SINGLE
DIM x1 AS INTEGER
DIM y1 AS INTEGER
DIM x2 AS INTEGER
DIM y2 AS INTEGER
DIM x2_old AS INTEGER
DIM y2_old AS INTEGER
DIM SHARED LineWidth AS INTEGER
DIM SHARED FillMode AS _BYTE

DIM DeskTop AS _UNSIGNED LONG
DIM DT_Width AS _UNSIGNED LONG
DIM DT_Height AS _UNSIGNED LONG

DeskTop = _SCREENIMAGE ' *** Capture the Desktop image
DT_Width = _WIDTH(DeskTop) ' *** Get the Desktop Width
DT_Height = _HEIGHT(DeskTop) ' *** Get the Desktop Height

ScreenWidth = DT_Width - 100
ScreenHeight = DT_Height - 150

Degree = 3.141592653 / 180
LineWidth = 40

MainWindow = _NEWIMAGE(ScreenWidth, ScreenHeight, 32)
SCREEN MainWindow

_TITLE "Line Thickness DEMO #1 - By Walter Whitman"

SUB_CenterWindow MainWindow

DO
    SUB_CheckResize MainWindow

    x1 = ScreenWidth / 2
    y1 = ScreenHeight / 2

    DO WHILE _MOUSEINPUT
        x2 = _MOUSEX
        y2 = _MOUSEY

        IF LineWidth >= 1 THEN LineWidth = LineWidth + _MOUSEWHEEL ELSE LineWidth = 1
        IF LineWidth < 1 THEN LineWidth = 1

        IF x2 <> x2_old OR y2 <> y2_old THEN


        END IF

        x2_old = x2
        y2_old = y2
    LOOP

    _LIMIT 60
    CLS

    DrawLine x1, y1, x2, y2, LineWidth, _RGB(0, 0, 255) '_RGB(RND * 256, RND * 256, RND * 256)
    DrawLine x1, y1, x1 + ((x1 / 4) * 3), y1 + 300, LineWidth, _RGB(255, 0, 255)
    DrawLine x2, y2, x1 - ((x1 / 4) * 3), y1 + 300, LineWidth, _RGB(0, 255, 255)

    LOCATE 1, 1

    keys& = _KEYHIT


    _DISPLAY

LOOP UNTIL keys& = 27

SYSTEM


SUB DrawLine (x1 AS INTEGER, y1 AS INTEGER, x2 AS INTEGER, y2 AS INTEGER, LineThickness AS INTEGER, Colr AS _UNSIGNED LONG)

    DIM LineAngle AS SINGLE
    DIM RotX1 AS SINGLE
    DIM RotY1 AS SINGLE
    DIM RotX2 AS SINGLE
    DIM RotY2 AS SINGLE
    DIM Corner1X AS INTEGER
    DIM Corner1Y AS INTEGER
    DIM Corner2X AS INTEGER
    DIM Corner2Y AS INTEGER
    DIM Corner3X AS INTEGER
    DIM Corner3Y AS INTEGER
    DIM Corner4X AS INTEGER
    DIM Corner4Y AS INTEGER
    DIM NewLineThickness AS INTEGER

    IF LineThickness > 1 THEN
        NewLineThickness = ABS(LineThickness / 2 - .5)
    END IF

    LineAngle = GetAngle(x1, y1, x2, y2)
    RotX1 = NewLineThickness * SIN((LineAngle + 90) * Degree)
    RotY1 = NewLineThickness * COS((LineAngle + 90) * Degree)
    RotX2 = NewLineThickness * SIN((LineAngle - 90) * Degree)
    RotY2 = NewLineThickness * COS((LineAngle - 90) * Degree)

    Corner1X = x1 + RotX2
    Corner1Y = y1 - RotY2
    Corner2X = x2 + RotX2
    Corner2Y = y2 - RotY2
    Corner3X = x2 + RotX1
    Corner3Y = y2 - RotY1
    Corner4X = x1 + RotX1
    Corner4Y = y1 - RotY1

    LINE (Corner1X, Corner1Y)-(Corner2X, Corner2Y), Colr
    LINE -(Corner3X, Corner3Y), Colr
    LINE -(Corner4X, Corner4Y), Colr
    LINE -(Corner1X, Corner1Y), Colr

    LINE (x1, y1)-(x2, y2), _RGB(255, 255, 0)
    CIRCLE (x1, y1), LineThickness / 2 - 1, _RGB(255, 0, 255)
    CIRCLE (x2, y2), LineThickness / 2 - 1, _RGB(255, 0, 255)

END SUB



FUNCTION GetAngle# (x1#, y1#, x2#, y2#) 'returns 0-359.99...

    IF y2# = y1# THEN
        IF x1# = x2# THEN EXIT FUNCTION
        IF x2# > x1# THEN GetAngle# = 90 ELSE GetAngle# = 270
        EXIT FUNCTION
    END IF

    IF x2# = x1# AND y2# > y1# THEN GetAngle# = 180: EXIT FUNCTION

    GetAngle# = ATN((x2# - x1#) / (y2# - y1#)) * -57.2957795131

    IF y2# < y1# THEN GetAngle# = GetAngle + 180

END FUNCTION


' *************************************************************************************************
' *                                                                                               *
' *************************************************************************************************
SUB SUB_CenterWindow (CurrentWindow AS _UNSIGNED LONG)

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



' *************************************************************************************************
' *                                                                                               *
' *  CheckResize: This SUB checks if the user resized the window, and if so, recreates the        *
' *               ORIGINAL SCREEN image to the new window size.                                   *
' *                                                                                               *
' *               Developer Note: You must use $RESIZE:ON, $RESIZE:SMOOTH, or $RESIZE:SMOOTH at   *
' *                               the beginning of your project for this to work.                 *
' *                               This SUB only works in QB64-GL only.                            *
' *                                                                                               *
' *************************************************************************************************
SUB SUB_CheckResize (CurrentScreen AS _UNSIGNED LONG)

    ' *** Define local variable for temporary screen
    DIM TempScreen AS _UNSIGNED LONG

    ' *** Check to see if the user resized the window. If so, change the SCREEN image to the correct size.
    IF _RESIZE THEN

        ' *** First, create a copy of the current SCREEN image.
        TempScreen = _COPYIMAGE(CurrentScreen)

        ' *** Set the SCREEN to the copied image, releasing the current SCREEN image.
        SCREEN TempScreen

        ' *** Remove (FREE) the original SCREEN image.
        _FREEIMAGE CurrentScreen

        ' *** Create a new "original" SCREEN image.
        CurrentScreen = _NEWIMAGE(_RESIZEWIDTH, _RESIZEHEIGHT, 32)

        ' *** Set the SCREEN to the new "original" image, releasing the copied SCREEN image.
        SCREEN CurrentScreen

        ' *** Remove (FREE) the copied SCREEN image.
        _FREEIMAGE TempScreen

        ScreenWidth = _RESIZEWIDTH - 100
        ScreenHeight = _RESIZEHEIGHT - 150


    END IF


END SUB


