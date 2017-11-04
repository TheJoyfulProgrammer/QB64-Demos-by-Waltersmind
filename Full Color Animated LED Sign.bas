DIM CurrentScreen AS LONG
DIM LedSign AS LONG
DIM LedSignBG AS LONG
DIM LedSignDup AS LONG
DIM LedSignTitle AS LONG
DIM BulbMask AS LONG

DIM ScreenWidth AS _UNSIGNED INTEGER
DIM ScreenHeight AS _UNSIGNED INTEGER
DIM ImgMode AS _UNSIGNED _BYTE

DIM LedWidth AS _UNSIGNED _BYTE
DIM LedHeight AS _UNSIGNED _BYTE
DIM LedBulbSize AS _UNSIGNED _BYTE

DIM ScrollLeft AS _BYTE

ScreenWidth = 800
ScreenHeight = 600
ImgMode = 32

LedWidth = 87
LedHeight = 57
LedBulbSize = 8

ScrollLeft = 1

CurrentScreen = _NEWIMAGE(ScreenWidth, ScreenHeight, ImgMode)
LedSign = _NEWIMAGE(LedWidth, LedHeight, ImgMode)
LedSignDup = _NEWIMAGE(LedWidth, LedHeight, ImgMode)
LedSignBG = _NEWIMAGE(LedWidth, LedHeight, ImgMode)
LedSignTitle = _NEWIMAGE(LedWidth, LedHeight, ImgMode)
BulbMask = _NEWIMAGE(LedBulbSize + 1, LedBulbSize + 1, ImgMode)

SCREEN CurrentScreen

' *** SETUP THE BULB MASK TO GIVE THE APPEARANCE OF A ROUND BULB
_DEST BulbMask

FOR rad = LedBulbSize * 2 TO LedBulbSize / 2 STEP -.2
    CIRCLE (LedBulbSize / 2 - .5, LedBulbSize / 2 - .5), rad, _RGBA(20, 0, 0, 128)
NEXT

FOR rad = LedBulbSize TO 2 STEP -.2
    CIRCLE (LedBulbSize / 2 - .5, LedBulbSize / 2 - .5), rad, _RGBA(0, 0, 0, (40 / LedBulbSize) * rad)
NEXT

' *** SETUP THE TITLE IMAGE
_DEST LedSignTitle

COLOR _RGB(255, 231, 174), _RGBA(0, 0, 0, 0)

FOR y = 0 TO 2
    FOR x = 0 TO 2
        _PRINTSTRING (x + 30, y + 5), "THE"
        _PRINTSTRING (x + 20, y + 20), "JOYFUL"
        _PRINTSTRING (x + 3, y + 35), "PROGRAMMER"
    NEXT
NEXT

COLOR _RGB(36, 92, 123), _RGBA(0, 0, 0, 0)
_PRINTSTRING (31, 6), "THE"
_PRINTSTRING (21, 21), "JOYFUL"
_PRINTSTRING (4, 36), "PROGRAMMER"



DO
    _LIMIT 60

    _DEST LedSignBG
    _PUTIMAGE (0, 0), LedSignBG, LedSignDup
    _PUTIMAGE (0, 0), LedSignDup, LedSignBG, (ScrollLeft, 0)-(_WIDTH(LedSign), _HEIGHT(LedSign))
    LINE (LedWidth - ScrollLeft, 0)-(LedWidth, LedHeight), _RGB(45, 0, 0), BF

    FOR i = 1 TO 3
        LINE (RND * LedWidth, RND * LedHeight)-(RND * LedWidth, RND * LedHeight), _RGB(RND * 128, RND * 128, RND * 128), BF
    NEXT

    _PUTIMAGE (110, 10), LedSignBG, CurrentScreen
    _PUTIMAGE (210, 10), LedSignTitle, CurrentScreen

    _PUTIMAGE (0, 0), LedSignBG, LedSign
    _PUTIMAGE (0, 0), LedSignTitle, LedSign

    _DEST LedSign
    LINE (0, 0)-(LedWidth - 1, LedHeight - 1), _RGBA(RND * 128 + 127, RND * 128 + 127, RND * 128 + 127, 255), B

    _PUTIMAGE (10, 10), LedSign, CurrentScreen

    DrawLED 10, 75, LedBulbSize, LedSign, CurrentScreen, BulbMask

    _DISPLAY

LOOP WHILE INKEY$ = ""
SYSTEM



SUB DrawLED (x AS INTEGER, y AS INTEGER, BulbSize AS _UNSIGNED _BYTE, ImgSrc AS LONG, ImgDest AS LONG, BulbMask AS LONG)

DIM BulbSpacing AS _UNSIGNED _BYTE
DIM DestX1 AS INTEGER
DIM DestY1 AS INTEGER
DIM DestX2 AS INTEGER
DIM DestY2 AS INTEGER

BulbSpacing = 1 + BulbSize

FOR by = 0 TO _HEIGHT(ImgSrc) - 1
    FOR bx = 0 TO _WIDTH(ImgSrc) - 1
        DestX1 = x + bx * BulbSpacing
        DestY1 = y + by * BulbSpacing
        DestX2 = x + bx * BulbSpacing + BulbSize - 1
        DestY2 = y + by * BulbSpacing + BulbSize
        _PUTIMAGE (DestX1, DestY1)-(DestX2, DestY2), ImgSrc, ImgDest, (bx, by)-(bx, by)
        _PUTIMAGE (DestX1, DestY1), BulbMask, ImgDest
    NEXT
NEXT

END SUB