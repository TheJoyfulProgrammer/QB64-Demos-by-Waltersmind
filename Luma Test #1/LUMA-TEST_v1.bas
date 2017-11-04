TYPE Images
    FileName AS STRING * 240
    OriginalImage AS LONG
    FilteredImage AS LONG
END TYPE

DIM SHARED MainWindow AS LONG
DIM SHARED TestImage(2) AS Images
DIM CurrentImage AS _UNSIGNED _BYTE
DIM SHARED Colr AS _UNSIGNED LONG
DIM SHARED Luma AS _UNSIGNED LONG
DIM Red AS _UNSIGNED _BYTE
DIM Green AS _UNSIGNED _BYTE
DIM Blue AS _UNSIGNED _BYTE
DIM SHARED TimeToWait AS DOUBLE
DIM SHARED TimerAlarm AS DOUBLE

TestImage(0).FileName = "Nature_1-640x400.jpg"
TestImage(1).FileName = "Nature_2-640x400.jpg"
TestImage(2).FileName = "Nature_3-640x400.jpg"

MainWindow = _NEWIMAGE(640, 400, 32)
SCREEN MainWindow

SUB_CenterWindow MainWindow

_TITLE "RGB to GREYSCALE DEMO #1 - By Walter Whitman"


FOR i = 0 TO 2

    TestImage(i).OriginalImage = _LOADIMAGE(RTRIM$(TestImage(i).FileName), 32)
    TestImage(i).FilteredImage = _NEWIMAGE(640, 400, 32)

    _SOURCE TestImage(i).OriginalImage
    _DEST TestImage(i).FilteredImage

    FOR y = 0 TO 399
        FOR x = 0 TO 639

            Colr~& = POINT(x, y)
            Red = _RED(Colr~&)
            Green = _GREEN(Colr~&)
            Blue = _BLUE(Colr~&)

            Luma = SQR((Red * Red) * 0.299 + (Green * Green) * 0.587 + (Blue * Blue) * 0.114)
            PSET (x, y), _RGB(Luma, Luma, Luma)

        NEXT
    NEXT
NEXT

TimeToWait = 1 / 1
TimerAlarm = TIMER(0.001) + TimeToWait

_DEST MainWindow

_PUTIMAGE , TestImage(CurrentImage).OriginalImage, 0
_PRINTMODE _KEEPBACKGROUND

COLOR _RGB32(40, 255, 40)
OutlineString 24, 15, _RGB32(0, 60, 0), 2, "(PRESS '1', '2', OR '3' TO CHANGE CURRENT PICTURE)"

_DISPLAY

DO

    _LIMIT 30

    IF TIMER(0.001) >= TimerAlarm THEN

        k = k + 1: IF k = 2 THEN k = 0

        IF k = 0 THEN _PUTIMAGE , TestImage(CurrentImage).OriginalImage, 0
        IF k = 1 THEN _PUTIMAGE , TestImage(CurrentImage).FilteredImage, 0

        TimerAlarm = TIMER(0.001) + TimeToWait

    END IF

    keyPressed& = _KEYHIT

    SELECT CASE keyPressed&

        CASE 49
            CurrentImage = 0
            IF k = 0 THEN _PUTIMAGE , TestImage(CurrentImage).OriginalImage, 0
            IF k = 1 THEN _PUTIMAGE , TestImage(CurrentImage).FilteredImage, 0

        CASE 50
            CurrentImage = 1
            IF k = 0 THEN _PUTIMAGE , TestImage(CurrentImage).OriginalImage, 0
            IF k = 1 THEN _PUTIMAGE , TestImage(CurrentImage).FilteredImage, 0

        CASE 51
            CurrentImage = 2
            IF k = 0 THEN _PUTIMAGE , TestImage(CurrentImage).OriginalImage, 0
            IF k = 1 THEN _PUTIMAGE , TestImage(CurrentImage).FilteredImage, 0

        CASE 27
            SYSTEM

    END SELECT

    OutlineString 24, 15, _RGB32(0, 60, 0), 2, "(PRESS '1', '2', OR '3' TO CHANGE CURRENT PICTURE)"

    _DISPLAY


LOOP



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


' *****************************************************************************
' OUTLINE STRING
' *****************************************************************************
SUB OutlineString (y AS INTEGER, x AS INTEGER, OutlineColor AS LONG, OutlineSize AS _UNSIGNED _BYTE, Text AS STRING)

    OriginalColor& = _DEFAULTCOLOR
    COLOR OutlineColor

    FOR y1 = -OutlineSize TO OutlineSize
        FOR x1 = -OutlineSize TO OutlineSize
            _PRINTSTRING (((x - 1) * 8) + x1, ((y - 1) * 16) + y1), Text
        NEXT
    NEXT

    COLOR OriginalColor&

    _PRINTSTRING ((x - 1) * 8, (y - 1) * 16), Text

END SUB


