DIM SHARED PI AS _FLOAT
DIM SHARED ScreenMain AS LONG
DIM SHARED Image1 AS LONG
DIM SHARED Image2 AS LONG

DIM CenterX AS LONG
DIM CenterY AS LONG
DIM StartX AS INTEGER
DIM StartY AS INTEGER
DIM EndX AS INTEGER
DIM EndY AS INTEGER
DIM Factor AS _FLOAT
DIM FactorInc AS _FLOAT

PI = 3.141592653589793

MainWindow = _NEWIMAGE(800, 600, 32)
Image1 = _NEWIMAGE(400, 400, 32)
Image2 = _NEWIMAGE(_WIDTH(MainWindow), _HEIGHT(MainWindow), 32)
Image3 = _NEWIMAGE(_WIDTH(MainWindow), _HEIGHT(MainWindow), 32)

SCREEN MainWindow

CenterX = _WIDTH(MainWindow) / 2
CenterY = _HEIGHT(MainWindow) / 2
StartX = CenterX - (_WIDTH(Image1) / 2)
StartY = CenterY - (_HEIGHT(Image1) / 2)
EndX = CenterX + (_WIDTH(Image1) / 2)
EndY = CenterY + (_HEIGHT(Image1) / 2)
Factor = 0
FactorInc = 0.00125

_PRINTMODE _KEEPBACKGROUND

_DEST Image2

LINE (0, 0)-(_WIDTH(MainWindow), _HEIGHT(MainWindow)), _RGB(8, 8, 64), BF

DropShadowOffset = 2

FOR iteration1 = 1 TO 5000
    x = RND * _WIDTH(Image2)
    y = RND * _HEIGHT(Image2)
    Size = RND * 20 + 10
    s = Size 'RND * 20 + 10
    FOR i = 0 TO DropShadowOffset
        LINE (x + DropShadowOffset - i, y + DropShadowOffset - i)-(x + Size + DropShadowOffset + i, y + Size + DropShadowOffset + i), _RGBA(0, 0, 0, 32), BF
    NEXT
    LINE (x, y)-(x + s, y + s), _RGB(RND * 256, RND * 256, RND * 256), BF
NEXT


DO

    $CHECKING:OFF

    _DEST Image2

    DropShadowOffset = 2

    FOR iteration1 = 1 TO 50
        x = RND * _WIDTH(Image2)
        y = RND * _HEIGHT(Image2)
        s = RND * 20 + 10
        FOR i = 0 TO DropShadowOffset
            LINE (x + DropShadowOffset - i, y + DropShadowOffset - i)-(x + s + DropShadowOffset + i, y + s + DropShadowOffset + i), _RGBA(0, 0, 0, 32), BF
        NEXT
        LINE (x, y)-(x + s, y + s), _RGB(RND * 256, RND * 256, RND * 256), BF
    NEXT

    _PUTIMAGE (0, 0), Image2, Image1, (200, 100)-(600, 500)
    _PUTIMAGE (0, 0), Image2, Image3

    _DEST Image3

    DropShadowOffset = 20

    FOR i = 0 TO 20
        LINE (200 + i + DropShadowOffset, 100 + i + DropShadowOffset)-(600 - i + DropShadowOffset, 500 - i + DropShadowOffset), _RGBA(0, 0, 0, 20), BF
    NEXT

    Swirl Image1, Image3, 200, 100, Factor
    _PUTIMAGE (0, 0), Image3, MainWindow

    _DEST MainWindow

    LINE (200, 510)-(600, 542), _RGBA(64, 64, 255, 200), BF
    LINE (200, 510)-(600, 542), _RGBA(32, 32, 200, 255), B
    COLOR _RGB(0, 0, 96)
    _PRINTSTRING (211, 521), "Factor: " + STR$(Factor)
    COLOR _RGB(255, 255, 0)
    _PRINTSTRING (210, 520), "Factor: " + STR$(Factor)

    FOR i = 0 TO 1
        LINE (200 - i, 100 - i)-(600 + i, 500 + i), _RGBA(0, 0, 0, 128), B
    NEXT

    $CHECKING:ON

    _DISPLAY

    Factor = Factor + FactorInc
    IF Factor >= 0.1 OR Factor <= -0.1 THEN FactorInc = -FactorInc


LOOP WHILE INKEY$ = ""
SYSTEM

' #################################################################################################
' #                                                                                               #
' #################################################################################################
SUB Swirl (SourceImage AS LONG, DestinationImage AS LONG, TopLeftCornerX AS INTEGER, TopLeftCornerY AS INTEGER, Factor AS _FLOAT)

DIM CenterX AS INTEGER
DIM CenterY AS INTEGER
DIM ImageMemory AS _MEM
DIM ImageDestMemory AS _MEM
DIM ImageOffset AS _OFFSET
DIM ImageCurrentOffset AS _OFFSET
DIM ImageOffsetEnd AS _OFFSET
DIM ImageByteWidth AS _UNSIGNED LONG
DIM CurrentX AS LONG
DIM CurrentY AS LONG
DIM RelativeX AS _FLOAT
DIM RelativeY AS _FLOAT
DIM OriginalAngle AS _FLOAT
DIM Radius AS _FLOAT
DIM NewAngle AS _FLOAT
DIM SrcX AS LONG
DIM SrcY AS LONG
DIM Pixel AS _UNSIGNED LONG
DIM DestinationWidthMultiplyBy4 AS LONG
DIM SourceImageHeight AS _UNSIGNED LONG
DIM SourceImageWidth AS _UNSIGNED LONG
DIM PI_Val_1 AS _FLOAT
DIM PI_Val_2 AS _FLOAT


CenterX = _WIDTH(SourceImage) / 2
CenterY = _HEIGHT(SourceImage) / 2
CurrentX = 0
CurrentY = 0

ImageMemory = _MEMIMAGE(SourceImage)
ImageOffsetEnd = ImageMemory.OFFSET + (_WIDTH(SourceImage) * _HEIGHT(SourceImage)) * 4
ImageCurrentOffset = 0
ImageByteWidth = _WIDTH(SourceImage) * 4
ImageDestMemory = _MEMIMAGE(DestinationImage)

DestinationWidthMultiplyBy4 = _WIDTH(DestinationImage) * 4
SourceImageHeight = _HEIGHT(SourceImage)
SourceImageWidth = _WIDTH(SourceImage)
PI_Val_1 = 0.5 * PI
PI_Val_2 = 1.5 * PI


_DEST DestinationImage

$CHECKING:OFF

DO

    RelativeY = CenterY - CurrentY
    RelativeX = CurrentX - CenterX

    IF RelativeX <> 0 THEN
        ' *** Angle
        OriginalAngle = ATN(ABS(RelativeY) / ABS(RelativeX))
        IF RelativeX > 0 AND RelativeY < 0 THEN
            ' *** Bottom Right Quandrant
            OriginalAngle = 2 * PI - OriginalAngle
        ELSE IF RelativeX <= 0 AND RelativeY >= 0 THEN
                ' *** Top Left Quadrant
                OriginalAngle = PI - OriginalAngle
            ELSE IF RelativeX <= 0 AND RelativeY < 0 THEN
                    ' *** Bottom Left Quadrant
                    OriginalAngle = OriginalAngle + PI
                END IF
            END IF
        END IF
    ELSE
        IF RelativeY >= 0 THEN
            OriginalAngle = PI_Val_1
        ELSE
            OriginalAngle = PI_Val_2
        END IF
    END IF

    Radius = SQR(RelativeX * RelativeX + RelativeY * RelativeY) ' + RND * 10
    NewAngle = OriginalAngle - Factor * Radius

    SrcX = INT(Radius * COS(NewAngle) + 0.5) + CenterX
    SrcY = SourceImageHeight - (INT(Radius * SIN(NewAngle) + 0.5) + CenterY)

    IF SrcX < 0 THEN
        SrcX = 0
    ELSE IF SrcX >= SourceImageWidth THEN
            SrcX = SourceImageWidth - 1
        END IF
    END IF

    IF SrcY < 0 THEN
        SrcY = 0
    ELSE IF SrcY >= SourceImageHeight THEN
            SrcY = SourceImageHeight - 1
        END IF
    END IF

    Pixel = _MEMGET(ImageMemory, ImageMemory.OFFSET + (SrcY * ImageByteWidth + SrcX * 4), _UNSIGNED LONG)
    'LINE (CurrentX + TopLeftCornerX, CurrentY + TopLeftCornerY)-(CurrentX + TopLeftCornerX, CurrentY + TopLeftCornerY), Pixel, BF
    _MEMPUT ImageDestMemory, ImageDestMemory.OFFSET + ((CurrentY + TopLeftCornerY) * DestinationWidthMultiplyBy4 + (CurrentX + TopLeftCornerX) * 4), Pixel

    CurrentX = CurrentX + 1

    IF CurrentX = SourceImageWidth THEN
        CurrentX = 0
        CurrentY = CurrentY + 1
        IF CurrentY > SourceImageHeight THEN ImageCurrentOffset = ImageOffsetEnd
    END IF

    ImageCurrentOffset = ImageCurrentOffset + 4

LOOP WHILE (ImageMemory.OFFSET + ImageCurrentOffset) < ImageOffsetEnd

_MEMFREE ImageMemory
_MEMFREE ImageDestMemory

$CHECKING:ON

END SUB

