DIM SquareWidth AS _UNSIGNED INTEGER
DIM SquareWidthD2 AS _UNSIGNED INTEGER
DIM SquareHeight AS _UNSIGNED INTEGER
DIM SquareHeightD2 AS _UNSIGNED INTEGER

DIM NumberOfPoints1 AS _UNSIGNED INTEGER
DIM NumberOfPoints2 AS _UNSIGNED INTEGER

DIM BackBuffer1 AS LONG
DIM BackBuffer2 AS LONG

REDIM x(-1) AS _UNSIGNED INTEGER
REDIM y(-1) AS _UNSIGNED INTEGER
REDIM Colr(-1) AS _UNSIGNED LONG

REDIM x2(-1) AS _UNSIGNED INTEGER
REDIM y2(-1) AS _UNSIGNED INTEGER
REDIM Colr2(-1) AS _UNSIGNED LONG

DIM PointerImage AS _MEM
DIM PointerImage2 AS _MEM
DIM PointerColr1 AS _MEM
DIM Pointer1 AS _MEM
DIM Pointer2 AS _MEM

SquareWidth = 800
SquareWidthD2 = SquareWidth / 2

SquareHeight = 600
SquareHeightD2 = SquareHeight / 2

BackBuffer1 = _NEWIMAGE(SquareWidth * 2, SquareHeight, 32)
BackBuffer2 = _NEWIMAGE(SquareWidth, SquareHeight, 32)

PointerImage = _MEMIMAGE(BackBuffer1)
PointerImage2 = _MEMIMAGE(BackBuffer2)

SCREEN _NEWIMAGE(SquareWidth, SquareHeight, 32)

NumberOfPoints2 = 0

REDIM x2(NumberOfPoints2) AS _UNSIGNED INTEGER
REDIM y2(NumberOfPoints2) AS _UNSIGNED INTEGER
REDIM Colr2(NumberOfPoints2) AS _UNSIGNED LONG

_SOURCE BackBuffer1
_DEST BackBuffer1


DO

    NumberOfPoints1 = RND * 250 + 50

    REDIM x(NumberOfPoints1) AS _UNSIGNED INTEGER
    REDIM y(NumberOfPoints1) AS _UNSIGNED INTEGER
    REDIM Colr(NumberOfPoints1) AS _UNSIGNED LONG

    FOR i = 0 TO NumberOfPoints1 - 1
        x(i) = RND * SquareWidth
        y(i) = RND * SquareHeight

        g = 127 - 127 * (ABS(SquareWidthD2 - x(i)) / SquareWidthD2) + 127 - 127 * (ABS(SquareHeightD2 - y(i)) / SquareHeightD2)

        Colr(i) = _RGB32(255 - x(i) / SquareWidth * 255, g, y(i) / SquareHeight * 255)
    NEXT

    PointerColr1 = _MEM(Colr())

    _PUTIMAGE (SquareWidth, 0), BackBuffer2, BackBuffer1, (0, 0)-(SquareWidth - 1, SquareHeight - 1)
    LINE (SquareWidth, 0)-(_WIDTH(BackBuffer1) - 1, SquareHeight - 1), _RGBA32(0, 0, 0, 120), BF

    FOR yy = 0 TO SquareHeight - 1

        _PUTIMAGE (0, 0), BackBuffer1, 0, (0, 0)-(SquareWidth - 1, yy - 1)
        _PUTIMAGE (0, yy + 1), BackBuffer1, 0, (SquareWidth, yy + 1)-(_WIDTH(BackBuffer1) - 1, SquareHeight - 1)

        _DEST 0
        LINE (0, yy)-(SquareWidth, yy), _RGB32(255, 255, 255)
        _DEST BackBuffer1

        FOR i = 0 TO NumberOfPoints1 - 1
            Colr2~& = _RGB32(RND * 256, RND * 256, RND * 256)
            CIRCLE (x(i), y(i)), 3, Colr2~&
            PSET (x(i), y(i)), Colr2~&
            PSET (x(i), y(i) - 1), Colr2~&
            PSET (x(i), y(i) + 1), Colr2~&
            PSET (x(i) - 1, y(i)), Colr2~&
            PSET (x(i) + 1, y(i)), Colr2~&
        NEXT

        FOR i = 0 TO NumberOfPoints2 - 1
            Colr2~& = _RGB32(RND * 256, RND * 256, RND * 256)
            CIRCLE (x2(i) + SquareWidth, y2(i)), 7, Colr2~&
            PSET (x2(i) + SquareWidth, y2(i)), Colr2~&
            PSET (x2(i) + SquareWidth, y2(i) - 1), Colr2~&
            PSET (x2(i) + SquareWidth, y2(i) + 1), Colr2~&
            PSET (x2(i) + SquareWidth - 1, y2(i)), Colr2~&
            PSET (x2(i) + SquareWidth + 1, y2(i)), Colr2~&
        NEXT


        FOR xx = 0 TO SquareWidth - 1

            d = 999999999 ' 307201

            FOR i = 0 TO NumberOfPoints1 - 1
                a = x(i) - xx
                b = y(i) - yy
                q = a * a + b * b
                IF q < d THEN d = q: kkl = i: edge = 1
            NEXT

            _MEMPUT PointerImage, PointerImage.OFFSET + (xx + yy * _WIDTH(BackBuffer1)) * 4, _MEMGET(PointerColr1, PointerColr1.OFFSET + kkl * 4, _UNSIGNED LONG) AS _UNSIGNED LONG
            _MEMPUT PointerImage, PointerImage.OFFSET + (xx + yy * _WIDTH(BackBuffer1) + SquareWidth) * 4, _MEMGET(PointerColr1, PointerColr1.OFFSET + kkl * 4, _UNSIGNED LONG) AS _UNSIGNED LONG
            _MEMPUT PointerImage2, PointerImage2.OFFSET + (xx + yy * _WIDTH(BackBuffer2)) * 4, _MEMGET(PointerColr1, PointerColr1.OFFSET + kkl * 4, _UNSIGNED LONG) AS _UNSIGNED LONG

        NEXT

        k& = _KEYHIT
        IF k& = 27 OR k& = 32 THEN SYSTEM

        _DISPLAY
    NEXT

    _MEMFREE PointerColr1

    REDIM x2(NumberOfPoints1) AS _UNSIGNED INTEGER
    REDIM y2(NumberOfPoints1) AS _UNSIGNED INTEGER
    REDIM Colr2(NumberOfPoints1) AS _UNSIGNED LONG

    NumberOfPoints2 = NumberOfPoints1
    NumberOfPoints1 = RND * 250 + 50

    Pointer1 = _MEM(x())
    Pointer2 = _MEM(x2())

    _MEMCOPY Pointer1, Pointer1.OFFSET, Pointer1.SIZE TO Pointer2, Pointer2.OFFSET

    _MEMFREE Pointer1
    _MEMFREE Pointer2

    Pointer1 = _MEM(y())
    Pointer2 = _MEM(y2())

    _MEMCOPY Pointer1, Pointer1.OFFSET, Pointer1.SIZE TO Pointer2, Pointer2.OFFSET

    _MEMFREE Pointer1
    _MEMFREE Pointer2

    Pointer1 = _MEM(Colr())
    Pointer2 = _MEM(Colr2())

    _MEMCOPY Pointer1, Pointer1.OFFSET, Pointer1.SIZE TO Pointer2, Pointer2.OFFSET

    _MEMFREE Pointer1
    _MEMFREE Pointer2


LOOP
