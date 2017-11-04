RANDOMIZE TIMER

CONST Degrees = 0.0174532925

DIM MainWindow AS LONG '                This image is our primary window.
DIM BackBuffer AS LONG '                This image will hold our updating image.
DIM DrawingBuffer AS LONG
DIM DrawingBackBuffer AS LONG
DIM GradientLineBuffer AS LONG
DIM Screenshot1 AS LONG

DIM ImageSrcBuffer AS _MEM '               This buffer will allow quick access to our BackBuffer data.
DIM ImageDstBuffer AS _MEM

DIM CurrentOffset AS _UNSIGNED LONG
DIM MaxOffset AS _UNSIGNED LONG

DIM ScreenWidth AS INTEGER '            This is how wide we want our display window and BackBuffer to be.
DIM ScreenHeight AS INTEGER '            This is how height we want our display window and BackBuffer to be.

DIM ssX1 AS INTEGER
DIM ssY1 AS INTEGER
DIM ssX1Move AS DOUBLE
DIM ssY1Move AS DOUBLE

DIM RollSpeed AS DOUBLE
DIM RollY AS DOUBLE

DIM Red AS INTEGER '                      Red color component
DIM Green AS INTEGER '                    Green color component
DIM Blue AS INTEGER '                     Blue color component
DIM Alpha AS INTEGER '                    Alpha color component
DIM Gray AS INTEGER
DIM OriginalColor AS _UNSIGNED LONG
DIM NewColor AS _UNSIGNED LONG
DIM GradientStep AS _FLOAT
DIM GradientLine AS INTEGER

DIM MaxAdd AS _UNSIGNED INTEGER '
DIM HalfMax AS _UNSIGNED INTEGER '
DIM Monochrome AS INTEGER '

DIM AmplitudeInc AS _FLOAT

ScreenWidth = 500
ScreenHeight = 400

MainWindow = _NEWIMAGE(ScreenWidth, ScreenHeight, 32)
BackBuffer = _NEWIMAGE(ScreenWidth, ScreenHeight, 32)
DrawingBuffer = _NEWIMAGE(ScreenWidth, ScreenHeight, 32)
DrawingBackBuffer = _NEWIMAGE(ScreenWidth, ScreenHeight, 32)
GradientLineBuffer = _NEWIMAGE(ScreenWidth, 110, 32)

SCREEN MainWindow
_TITLE "The Joyful Programmer's - Bad TV Reception (Complex)"

Screenshot1 = _LOADIMAGE("Zombie-Adventure-SCREENSHOT-02-MOD1.png")

' *** Get BackBuffer data
ImageSrcBuffer = _MEMIMAGE(BackBuffer)
ImageDstBuffer = _MEMIMAGE(MainWindow)

_DEST GradientLineBuffer

GradientStep = 360 / _HEIGHT(GradientLineBuffer)

FOR y = 0 TO _HEIGHT(GradientLineBuffer)
    Alpha = 256 * SIN((y * GradientStep) * Degrees)
    IF Alpha > 255 THEN Alpha = 255
    LINE (0, y)-(_WIDTH(GradientLineBuffer), y), _RGBA32(255, 255, 255, Alpha)
NEXT

_DEST BackBuffer
CLS

MaxOffset = ScreenWidth * ScreenHeight * 4

GradientLineY = _HEIGHT(DrawingBuffer) + 100
AmplitudeInc = 0

ssX1 = 0
ssY1 = 0
ssX1Move = RND * 7 + 2
ssY1Move = RND * 7 + 2

_DEST DrawingBackBuffer
LINE (0, 0)-(_WIDTH(DrawingBuffer), _HEIGHT(DrawingBuffer)), _RGB32(0, 0, 0), BF

RollY = 0
RollSpeed = -10



DO


    _LIMIT 30


    '$CHECKING:OFF

    CurrentOffset = 0
    RollSpeed = 40 * SIN((TIMER(0.001) * 10) * Degrees)

    ' *** Draw some stuff to our backbuffer
    FOR I = 0 TO 0
        LINE (RND * ScreenWidth, RND * ScreenHeight)-(RND * ScreenWidth, RND * ScreenHeight), _RGB(RND * 256, RND * 256, RND * 256), BF
    NEXT

    MaxAdd = RND * 256
    HalfMax = MaxAdd / 2

    Amplitude = RND * (200 * SIN(AmplitudeInc * Degrees)) - ((200 * SIN(AmplitudeInc * Degrees)) / 2)
    AmplitudeInc = AmplitudeInc + 7

    _PUTIMAGE , DrawingBackBuffer, DrawingBuffer
    _PUTIMAGE (ssX1, ssY1), Screenshot1, DrawingBuffer

    ssX1 = ssX1 + ssX1Move

    IF ssX1 > (_WIDTH(BackBuffer) - _WIDTH(Screenshot1)) OR ssX1 < 0 THEN
        ssX1Move = -ssX1Move
    END IF

    ssY1 = ssY1 + ssY1Move

    IF ssY1 > (_HEIGHT(BackBuffer) - _HEIGHT(Screenshot1)) OR ssY1 < 0 THEN
        ssY1Move = -ssY1Move
    END IF


    FOR y = 0 TO _HEIGHT(DrawingBuffer) - 1
        x1 = Amplitude * SIN(y * Degrees)
        RollYNew = INT(y + RollY)

        IF RollYNew < 0 THEN RollYNew = RollYNew + _HEIGHT(DrawingBuffer)
        IF RollYNew > _HEIGHT(DrawingBuffer) - 1 THEN RollYNew = RollYNew - _HEIGHT(DrawingBuffer)

        _PUTIMAGE (x1, RollYNew), DrawingBuffer, BackBuffer, (0, y)-(_WIDTH(DrawingBuffer) - 1, y)

        IF x1 > 0 THEN
            _PUTIMAGE (x1 - _WIDTH(DrawingBuffer) + 2, RollYNew), DrawingBuffer, BackBuffer, (0, y)-(_WIDTH(DrawingBuffer) - 1, y)
        ELSE
            _PUTIMAGE (x1 + _WIDTH(DrawingBuffer) - 2, RollYNew), DrawingBuffer, BackBuffer, (0, y)-(_WIDTH(DrawingBuffer) - 1, y)
        END IF
    NEXT

    RollY = RollY + RollSpeed
    IF RollY > _HEIGHT(DrawingBuffer) - 1 THEN RollY = RollY - _HEIGHT(DrawingBuffer)
    IF RollY < 0 THEN RollY = RollY + _HEIGHT(DrawingBuffer)

    _PUTIMAGE (0, GradientLineY), GradientLineBuffer, BackBuffer
    GradientLineY = GradientLineY - 20
    IF GradientLineY < -(_HEIGHT(DrawingBuffer) + 100) THEN GradientLineY = _HEIGHT(DrawingBuffer) + 100


    DO
        _MEMGET ImageSrcBuffer, ImageSrcBuffer.OFFSET + CurrentOffset, OriginalColor

        Red = _RED32(OriginalColor)
        Green = _GREEN32(OriginalColor)
        Blue = _BLUE32(OriginalColor)

        Gray = Red * 0.3 + Green * 0.59 + Blue * 0.11

        Monochrome = INT(RND * MaxAdd) - HalfMax

        Red = Red + Monochrome: IF Red > 255 THEN Red = 255
        Green = Green + Monochrome: IF Green > 255 THEN Green = 255
        Blue = Blue + Monochrome: IF Blue > 255 THEN Blue = 255
        Gray = Gray + Monochrome: IF Gray > 255 THEN Gray = 255

        IF (MaxAdd > 196) THEN
            NewColor = _RGB32(Gray, Gray, Gray)
        ELSE
            NewColor = _RGB32(Red, Green, Blue)
        END IF

        _MEMPUT ImageDstBuffer, ImageDstBuffer.OFFSET + CurrentOffset, NewColor

        CurrentOffset = CurrentOffset + 4

    LOOP UNTIL CurrentOffset = MaxOffset

    $CHECKING:ON

    _DISPLAY
    k& = _KEYHIT

LOOP UNTIL k& = 27

SYSTEM

