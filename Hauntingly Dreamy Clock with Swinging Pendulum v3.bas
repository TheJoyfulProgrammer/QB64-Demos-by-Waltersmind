' *****************************************************************************
' *                                                                           *
' *  DIGITAL CLOCK #3                                                         *
' *                                                                           *
' *  By: Waltersmind                                                          *
' *  Created on: Feburary 1st, 2014                                           *
' *  Modified on: Feburary 10th, 2014                                         *
' *                                                                           *
' *  All values are hard-coded in the source.                                 *
' *                                                                           *
' *****************************************************************************

DIM SHARED PrimaryScreen&
DIM SHARED PrimaryScreenSaved&
DIM SHARED PrimaryScreenBackBuffer&
DIM SHARED PrimaryScreenBackBuffer2&
DIM SHARED ClockFace&
DIM SHARED ClockCover&
DIM SHARED HourHand&
DIM SHARED MinuteHand&
DIM SHARED SecondHand&
DIM SHARED ClockScratch1&
DIM SHARED ClockShadow&
DIM SHARED Pendulum&
DIM SHARED color1~&, color2~&, color3~&, color4~&, color5~&
DIM SHARED degree AS DOUBLE
DIM SHARED Hours(0 TO 11) AS STRING
DIM SHARED Object1MaxWidth&
DIM SHARED Object1MaxHeight&
DIM SHARED CenterX%
DIM SHARED CenterY%
DIM SHARED NumSteps%
DIM SHARED currentStep%
DIM SHARED clockAlpha%

Object1MaxWidth& = 80
Object1MaxHeight& = 80
CenterX% = Object1MaxWidth& / 2
CenterY% = Object1MaxHeight& / 2
NumSteps% = 50 '100
currentStep% = 0
clockAlpha% = 120

Hours(0) = "XII": Hours(1) = "I": Hours(2) = "II": Hours(3) = "III": Hours(4) = "IV": Hours(5) = "V"
Hours(6) = "VI": Hours(7) = "VII": Hours(8) = "VIII": Hours(9) = "IX": Hours(10) = "X": Hours(11) = "XI"

PrimaryScreen& = _NEWIMAGE(800, 600, 32)
PrimaryScreenSaved& = _NEWIMAGE(800, 600, 32)
PrimaryScreenBackBuffer& = _NEWIMAGE(800, 600, 32)
PrimaryScreenBackBuffer2& = _NEWIMAGE(800, 600, 32)
ClockFace& = _NEWIMAGE(400, 400, 32)
ClockCover& = _NEWIMAGE(400, 400, 32)
HourHand& = _NEWIMAGE(20, 160, 32)
MinuteHand& = _NEWIMAGE(20, 185, 32)
SecondHand& = _NEWIMAGE(10, 185, 32)
ClockScratch1& = _NEWIMAGE(400, 400, 32)
ClockShadow& = _NEWIMAGE(300, 40, 32)
Pendulum& = _NEWIMAGE(100, 200, 32)
CircleBuffer1~& = _NEWIMAGE(Object1MaxWidth&, Object1MaxHeight&, 32)

degree = 3.141592654 / 180

_DEST PrimaryScreenSaved&
GradientBox 0, 0, 799, 599, _RGB(49, 130, 186), _RGB(209, 227, 239), "h"
StartColor~& = _RGB(RND * 256, RND * 256, RND * 256)
EndColor~& = _RGB(RND * 256, RND * 256, RND * 256)
redInc! = -(_RED32(StartColor~&) - _RED32(EndColor~&)) / NumSteps%
greenInc! = -(_GREEN32(StartColor~&) - _GREEN32(EndColor~&)) / NumSteps%
blueInc! = -(_BLUE32(StartColor~&) - _BLUE32(EndColor~&)) / NumSteps%

SCREEN PrimaryScreen&
GradientBox 0, 0, 799, 599, _RGB(49, 130, 186), _RGB(209, 227, 239), "h"

color1~& = _RGBA(254, 234, 197, 255)
color2~& = _RGBA(183, 147, 91, 255)
color3~& = _RGBA(127, 72, 31, 255)
color4~& = _RGBA(94, 49, 21, 255)
color5~& = _RGBA(61, 32, 13, 255)

DrawClock

DO
    _LIMIT 30

    _DEST CircleBuffer1~&
    Red% = _RED32(StartColor~&) + redInc! * currentStep%
    Green% = _GREEN32(StartColor~&) + greenInc! * currentStep%
    Blue% = _BLUE32(StartColor~&) + blueInc! * currentStep%

    FOR numCircles = 1 TO 20
        CLS
        radius = RND * (Object1MaxWidth& / 2 - 2)
        ImageX% = (radius - (Object1MaxWidth& / 2)) + RND * (_WIDTH(PrimaryScreenSaved&) - radius * 2)
        ImageY% = (radius - (Object1MaxHeight& / 2)) + RND * (_HEIGHT(PrimaryScreenSaved&) - radius * 2)

        CIRCLE (CenterX%, CenterY%), radius, _RGB(Red%, Green%, Blue%)
        PAINT (CenterX%, CenterY%), _RGB(Red%, Green%, Blue%)

        _SETALPHA 0, _RGB(0, 0, 0)
        _SETALPHA INT(RND * 128) + 127, _RGB(Red%, Green%, Blue%), CircleBuffer1~&
        _PUTIMAGE (ImageX%, ImageY%), CircleBuffer1~&, PrimaryScreenSaved&, (0, 0)-(Object1MaxWidth& - 1, Object1MaxHeight& - 1)
    NEXT

    currentStep% = currentStep% + 1

    IF currentStep% > NumSteps% THEN
        currentStep% = 0
        SWAP StartColor~&, EndColor~&
        EndColor~& = _RGB(RND * 256, RND * 256, RND * 256)
        redInc! = -(_RED32(StartColor~&) - _RED32(EndColor~&)) / NumSteps%
        greenInc! = -(_GREEN32(StartColor~&) - _GREEN32(EndColor~&)) / NumSteps%
        blueInc! = -(_BLUE32(StartColor~&) - _BLUE32(EndColor~&)) / NumSteps%
    END IF

    _PUTIMAGE (0, 0)-(_WIDTH(PrimaryScreenBackBuffer2&), _HEIGHT(PrimaryScreenBackBuffer2&)), PrimaryScreenSaved&, PrimaryScreenBackBuffer2&

    FOR ShadowWidth = 1 TO 0.70 STEP -0.05
        drawImage ClockShadow&, PrimaryScreenBackBuffer2&, 400, 590, _WIDTH(ClockShadow&) / 2, _HEIGHT(ClockShadow&) - 20, 0, ShadowWidth
    NEXT

    _PUTIMAGE (0, 0)-(399, 399), ClockFace&, ClockScratch1&

    TinyTimer# = TIMER
    Hour% = (INT(TinyTimer# / 3600) MOD 60) MOD 12: Hour% = Hour% + 12 * -(Hour% = 0)
    Minute% = INT(TinyTimer# / 60) MOD 60
    Second% = INT(TinyTimer#) MOD 60
    SixthSecond# = 0 '(TinyTimer# - INT(TinyTimer#)) * 6

    _DEST ClockScratch1&
    DisplayTimeLine2$ = LTRIM$(LTRIM$(STR$(Hour%))) + ":" + RIGHT$("0" + LTRIM$(STR$(Minute%)), 2) + ":" + RIGHT$("0" + LTRIM$(STR$(Second%)), 2) + " " + MID$("AMPM", -((INT(TinyTimer# / 3600) MOD 60) > 11) * 2 + 1, 2)
    _PRINTMODE _KEEPBACKGROUND
    _PRINTSTRING (199 - (_PRINTWIDTH(DisplayTimeLine2$) / 2), 299), DisplayTimeLine2$

    drawImage HourHand&, ClockScratch1&, 199, 199, _WIDTH(HourHand&) / 2, _HEIGHT(HourHand&) - 20, (Hour% * 30 + Minute% / 2) * degree, 1
    drawImage MinuteHand&, ClockScratch1&, 199, 199, _WIDTH(MinuteHand&) / 2, _HEIGHT(MinuteHand&) - 20, (Minute% * 6 + Second% / 10) * degree, 1
    drawImage SecondHand&, ClockScratch1&, 199, 199, _WIDTH(SecondHand&) / 2, _HEIGHT(SecondHand&) - 20, (Second% * 6 + SixthSecond#) * degree, 1
    drawImage ClockCover&, ClockScratch1&, 4, 91, _WIDTH(SecondHand&) / 2, _HEIGHT(SecondHand&) / 2, 0, 1

    radius# = 15
    speed# = 3
    angle! = (radius# * SIN(TinyTimer# * speed#)) * degree
    drawImage Pendulum&, PrimaryScreenBackBuffer2&, 399, 214, _WIDTH(Pendulum&) / 2, -179, angle!, 1

    _SETALPHA 150, _RGB(1, 1, 1) TO _RGB(255, 255, 255), ClockScratch1&
    _PUTIMAGE (199, 25)-(599, 425), ClockScratch1&, PrimaryScreenBackBuffer2&

    _SETALPHA 0, _RGB(0, 0, 0), PrimaryScreenBackBuffer2&
    _SETALPHA clockAlpha%, _RGB(1, 1, 1) TO _RGB(255, 255, 255), PrimaryScreenBackBuffer2&
    _PUTIMAGE (0, 0)-(_WIDTH(PrimaryScreenBackBuffer&), _HEIGHT(PrimaryScreenBackBuffer&)), PrimaryScreenBackBuffer2&, PrimaryScreenBackBuffer&
    _PUTIMAGE (0, 0)-(_WIDTH(PrimaryScreenBackBuffer&), _HEIGHT(PrimaryScreenBackBuffer&)), PrimaryScreenBackBuffer&, PrimaryScreen&

    _DISPLAY

LOOP WHILE INKEY$ = ""
SYSTEM


'##############################################################################
'#                                                                            #
'#  DrawClock (): No parameters                                               #
'#                                                                            #
'##############################################################################
SUB DrawClock ()


' -----------------------------------------------------------------------------
'  Draw outer clock rim
' -----------------------------------------------------------------------------

_DEST ClockFace&

GradientBox 0, 0, 399, 399, color3~&, color4~&, "h"
CIRCLE (199, 199), 200, _RGBA(0, 0, 0, 255)
PAINT (0, 0), _RGBA(0, 0, 0, 255), _RGBA(0, 0, 0, 255)
PAINT (0, 399), _RGBA(0, 0, 0, 255), _RGBA(0, 0, 0, 255)
PAINT (399, 0), _RGBA(0, 0, 0, 255), _RGBA(0, 0, 0, 255)
PAINT (399, 399), _RGBA(0, 0, 0, 255), _RGBA(0, 0, 0, 255)
_SETALPHA 0, _RGB(0, 0, 0)


' -----------------------------------------------------------------------------
'  Draw inner bevel gradient
' -----------------------------------------------------------------------------

_DEST ClockScratch1&

GradientBox 0, 0, 399, 399, color4~&, color3~&, "h"
CIRCLE (199, 199), 190, _RGBA(0, 0, 0, 255)
PAINT (0, 0), _RGBA(0, 0, 0, 255), _RGBA(0, 0, 0, 255)
PAINT (0, 399), _RGBA(0, 0, 0, 255), _RGBA(0, 0, 0, 255)
PAINT (399, 0), _RGBA(0, 0, 0, 255), _RGBA(0, 0, 0, 255)
PAINT (399, 399), _RGBA(0, 0, 0, 255), _RGBA(0, 0, 0, 255)
_SETALPHA 0, _RGB(0, 0, 0)
_PUTIMAGE (0, 0)-(399, 399), ClockScratch1&, ClockFace&


' -----------------------------------------------------------------------------
'  Draw inner clock face
' -----------------------------------------------------------------------------

GradientCircle 199, 199, 186, color1~&, color2~&
CIRCLE (199, 199), 187, color5~&
_SETALPHA 0, _RGB(0, 0, 0)
_PUTIMAGE (0, 0)-(399, 399), ClockScratch1&, ClockFace&


' -----------------------------------------------------------------------------
'  Draw second ticks
' -----------------------------------------------------------------------------

CLS 0
LINE (199, 15)-(201, 25), color5~&, BF

FOR angle# = 0 TO 360 STEP 6
    _SETALPHA 0, _RGB(0, 0, 0)
    drawImage ClockScratch1&, ClockFace&, 199, 199, 199, 199, angle# * degree, 1
NEXT


' -----------------------------------------------------------------------------
'  Draw minute ticks
' -----------------------------------------------------------------------------

CLS 0
LINE (198, 15)-(202, 35), color5~&, BF

FOR angle# = 0 TO 360 STEP 30
    _SETALPHA 0, _RGB(0, 0, 0)
    drawImage ClockScratch1&, ClockFace&, 199, 199, 199, 199, angle# * degree, 1
NEXT


' -----------------------------------------------------------------------------
'  Draw Roman Numerals
' -----------------------------------------------------------------------------

HourArrayCount = -1

COLOR color5~&

FOR angle# = 0 TO 330 STEP 30
    CLS 0
    HourArrayCount = HourArrayCount + 1
    _PRINTSTRING (199 - (_PRINTWIDTH(Hours(HourArrayCount)) / 2), 45), Hours(HourArrayCount)
    _SETALPHA 0, _RGB(0, 0, 0)
    drawImage ClockScratch1&, ClockFace&, 199, 199, 199, 199, angle# * degree, 1
NEXT


' -----------------------------------------------------------------------------
'  Draw minute Hand
' -----------------------------------------------------------------------------

_DEST MinuteHand&

MinuteHandWidth# = _WIDTH(MinuteHand&)
MinuteHandHeight# = _HEIGHT(MinuteHand&)
HandColor1~& = color3~&
HandColor2~& = color5~&

' LEFT SIDE
LINE (MinuteHandWidth# / 2, 0)-(0, MinuteHandHeight# - 20), HandColor1~&
LINE -(MinuteHandWidth# / 2, MinuteHandHeight#), HandColor1~&
LINE -(MinuteHandWidth# / 2, 0), HandColor1~&
PAINT (MinuteHandWidth# / 2 - 2, MinuteHandHeight# - 20), HandColor1~&

' RIGHT SIDE
LINE (MinuteHandWidth# / 2, 0)-(MinuteHandWidth#, MinuteHandHeight# - 20), HandColor2~&
LINE -(MinuteHandWidth# / 2, MinuteHandHeight#), HandColor2~&
LINE -(MinuteHandWidth# / 2, 0), HandColor2~&
PAINT (MinuteHandWidth# / 2 + 2, MinuteHandHeight# - 20), HandColor2~&

_SETALPHA 150, _RGB(1, 1, 1) TO _RGB(255, 255, 255)
_SETALPHA 0, _RGB(0, 0, 0)


' -----------------------------------------------------------------------------
'  Draw hour Hand
' -----------------------------------------------------------------------------

_DEST HourHand&

HourHandWidth# = _WIDTH(HourHand&)
HourHandHeight# = _HEIGHT(HourHand&)
HandColor1~& = color3~&
HandColor2~& = color5~&

' LEFT SIDE
LINE (HourHandWidth# / 2, 0)-(0, HourHandHeight# - 20), HandColor1~&
LINE -(HourHandWidth# / 2, HourHandHeight#), HandColor1~&
LINE -(HourHandWidth# / 2, 0), HandColor1~&
PAINT (HourHandWidth# / 2 - 2, HourHandHeight# - 20), HandColor1~&

' RIGHT SIDE
LINE (HourHandWidth# / 2, 0)-(HourHandWidth#, HourHandHeight# - 20), HandColor2~&
LINE -(HourHandWidth# / 2, HourHandHeight#), HandColor2~&
LINE -(HourHandWidth# / 2, 0), HandColor2~&
PAINT (HourHandWidth# / 2 + 2, HourHandHeight# - 20), HandColor2~&

_SETALPHA 150, _RGB(1, 1, 1) TO _RGB(255, 255, 255)
_SETALPHA 0, _RGB(0, 0, 0)


' -----------------------------------------------------------------------------
'  Draw second Hand
' -----------------------------------------------------------------------------

_DEST SecondHand&

SecondHandWidth# = _WIDTH(SecondHand&)
SecondHandHeight# = _HEIGHT(SecondHand&)
HandColor1~& = _RGB(255, 0, 0)

LINE (SecondHandWidth# / 2, 0)-(0, SecondHandHeight# - 20), HandColor1~&
LINE -(SecondHandWidth# / 2, SecondHandHeight#), HandColor1~&
LINE -(SecondHandWidth#, SecondHandHeight# - 20), HandColor1~&
LINE -(SecondHandWidth# / 2, 0), HandColor1~&
PAINT (SecondHandWidth# / 2, SecondHandHeight# - 20), HandColor1~&

_SETALPHA 150, _RGB(1, 1, 1) TO _RGB(255, 255, 255)
_SETALPHA 0, _RGB(0, 0, 0)


' -----------------------------------------------------------------------------
'  Draw glass cover
' -----------------------------------------------------------------------------

_DEST ClockCover&

CIRCLE (199, 199), 185, _RGBA(255, 255, 255, 255)
PAINT (199, 199), _RGBA(255, 255, 255, 255), _RGBA(255, 255, 255, 255)
CIRCLE (299, 299), 174, _RGBA(0, 0, 0, 255)
PAINT (280, 280), _RGBA(0, 0, 0, 255)

_SETALPHA 0, _RGB(0, 0, 0)
_SETALPHA 50, _RGB(255, 255, 255)


' -----------------------------------------------------------------------------
'  Draw drop shadow
' -----------------------------------------------------------------------------

_DEST ClockShadow&

LINE (0, 0)-(_WIDTH(ClockShadow&), _HEIGHT(ClockShadow&)), _RGB(255, 255, 255), BF
CIRCLE (_WIDTH(ClockShadow&) / 2, _HEIGHT(ClockShadow&) / 2), _WIDTH(ClockShadow&) / 2, _RGB(0, 0, 0), , , 0.10
PAINT (_WIDTH(ClockShadow&) / 2, _HEIGHT(ClockShadow&) / 2), _RGB(0, 0, 0)

_SETALPHA 50, _RGB(0, 0, 0)
_SETALPHA 0, _RGB(255, 255, 255)


' -----------------------------------------------------------------------------
'  Draw Pendulum
' -----------------------------------------------------------------------------

_DEST Pendulum&

PBoxX1 = _WIDTH(Pendulum&) / 4
PBoxY1 = 0
PBoxX2 = (_WIDTH(Pendulum&) / 4) * 3
PBoxY2 = _HEIGHT(Pendulum&) - (_WIDTH(Pendulum&) / 2)
PBallCX = _WIDTH(Pendulum&) / 2
PBallCY = PBoxY2
PBallRadius = PBallCX - 2
PendulumColor1~& = color5~&
PendulumColor2~& = color2~&

GradientBox PBoxX1, PBoxY1, PBallCX, PBoxY2, PendulumColor1~&, PendulumColor2~&, "v"
GradientBox PBallCX, PBoxY1, PBoxX2, PBoxY2, PendulumColor2~&, PendulumColor1~&, "v"
GradientCircle PBallCX, PBallCY, PBallRadius, PendulumColor2~&, PendulumColor1~&

_SETALPHA 0, _RGB(0, 0, 0)


END SUB


'##############################################################################
'#                                                                            #
'# drawImage (Source Image, Destination Image, XCooridnate for center of      #
'#            image in the destination, YCoordinate for center of image in    #
'#            the destination, pivot XCoordinate for source image, pivot      #
'#            YCoordinate for source image, Angle of rotation, scale (1 =     #
'#            100%)                                                           #
'#                                                                            #
'##############################################################################
SUB drawImage (src AS LONG, dest AS LONG, x AS INTEGER, y AS INTEGER, centerX AS INTEGER, centerY AS INTEGER, angle AS DOUBLE, scale AS DOUBLE)

' -----------------------------------------------------------------------------
'  The following sets the pivot location (the axis where the image rotates).
'  This location can be inside the image, such as center, or it can be outside.
' -----------------------------------------------------------------------------

TopLeftX = -centerX
TopLeftY = -centerY
BottomLeftX = -centerX
BottomLeftY = -centerY + _HEIGHT(src)
BottomRightX = -centerX + _WIDTH(src)
BottomRightY = -centerY + _HEIGHT(src)
TopRightX = -centerX + _WIDTH(src)
TopRightY = -centerY

' -----------------------------------------------------------------------------
'  Predefine the SIN and COS rotation for later use
' -----------------------------------------------------------------------------

RotSin! = SIN(-angle)
RotCos! = COS(-angle)

' -----------------------------------------------------------------------------
'  Translate, rotate, and scale all four corner vectors
' -----------------------------------------------------------------------------

TopLeftCornerX = (TopLeftX * RotCos! + TopLeftY * RotSin!) * scale + x
TopLeftCornerY = (TopLeftY * RotCos! - TopLeftX * RotSin!) * scale + y
BottomLeftCornerX = (BottomLeftX * RotCos! + BottomLeftY * RotSin!) * scale + x
BottomLeftCornerY = (BottomLeftY * RotCos! - BottomLeftX * RotSin!) * scale + y
BottomRightCornerX = (BottomRightX * RotCos! + BottomRightY * RotSin!) * scale + x
BottomRightCornerY = (BottomRightY * RotCos! - BottomRightX * RotSin!) * scale + y
TopRightCornerX = (TopRightX * RotCos! + TopRightY * RotSin!) * scale + x
TopRightCornerY = (TopRightY * RotCos! - TopRightX * RotSin!) * scale + y

' -----------------------------------------------------------------------------
'  Put the source image onto the destination image in the source image
'  transformed state.
'
'  TL - BL - BR, TL - BL - BR
'  TL - BR - TR, TL - BR - TR
' -----------------------------------------------------------------------------

TLX = 0
TLY = 0
BLX = 0
BLY = _HEIGHT(src) - 1
BRX = _WIDTH(src) - 1
BRY = _HEIGHT(src) - 1
TRX = _WIDTH(src) - 1
TRY = 0

_MAPTRIANGLE _SEAMLESS(TLX, TLY)-(BLX, BLY)-(BRX, BRY), src TO(TopLeftCornerX, TopLeftCornerY)-(BottomLeftCornerX, BottomLeftCornerY)-(BottomRightCornerX, BottomRightCornerY), dest
_MAPTRIANGLE _SEAMLESS(TLX, TLY)-(BRX, BRY)-(TRX, TRY), src TO(TopLeftCornerX, TopLeftCornerY)-(BottomRightCornerX, BottomRightCornerY)-(TopRightCornerX, TopRightCornerY), dest

END SUB


'##############################################################################
'#                                                                            #
'# GradientCircle(X-Coordinate, Y-Coordinate, Radius, InnerCircleColor,       #
'#                OuterCircleColor)                                           #
'#                                                                            #
'##############################################################################
SUB GradientCircle (x1 AS INTEGER, y1 AS INTEGER, radius AS INTEGER, innerColor AS LONG, outerColor AS LONG)

redInc! = -(_RED32(outerColor) - _RED32(innerColor)) / radius
greenInc! = -(_GREEN32(outerColor) - _GREEN32(innerColor)) / radius
blueInc! = -(_BLUE32(outerColor) - _BLUE32(innerColor)) / radius
alphaInc! = -(_ALPHA32(outerColor) - _ALPHA32(innerColor)) / radius

colorInc = 0
FOR r = radius TO 0 STEP -2
    CIRCLE (x1, y1), r, _RGBA(_RED32(outerColor) + (redInc! * colorInc), _GREEN32(outerColor) + (greenInc! * colorInc), _BLUE32(outerColor) + (blueInc! * colorInc), _ALPHA(outerColor) + (alphaInc! * colorInc))
    PAINT (x1, y1), _RGBA(_RED32(outerColor) + (redInc! * colorInc), _GREEN32(outerColor) + (greenInc! * colorInc), _BLUE32(outerColor) + (blueInc! * colorInc), _ALPHA(outerColor) + (alphaInc! * colorInc))
    colorInc = colorInc + 2
NEXT

END SUB


'##############################################################################
'#                                                                            #
'# GradientBox(X Start Coordinate, Y Start Coordinate, X End Coordinate,      #
'#             Y End Coordinate, Color Start, Color End, Is it "h"            #
'#             for Horizontal or "v" for Vertical?)                           #
'#                                                                            #
'##############################################################################
SUB GradientBox (x1 AS INTEGER, y1 AS INTEGER, x2 AS INTEGER, y2 AS INTEGER, colorStart AS _UNSIGNED LONG, colorEnd AS _UNSIGNED LONG, HortVert AS STRING)

IF x2 < x1 THEN SWAP x1, x2: IF HortVert = "h" THEN SWAP colorStart, colorEnd
IF y2 < y1 THEN SWAP y1, y2: IF HortVert = "v" THEN SWAP colorStart, colorEnd

colorSteps% = ABS(((x2 - x1) * (HortVert = "h")) + ((y2 - y1) * (HortVert = "v")))

redInc! = ABS(_RED32(colorStart) - _RED32(colorEnd)) / colorSteps%
greenInc! = ABS(_GREEN32(colorStart) - _GREEN32(colorEnd)) / colorSteps%
blueInc! = ABS(_BLUE32(colorStart) - _BLUE32(colorEnd)) / colorSteps%
alphaInc! = ABS(_ALPHA32(colorStart) - _ALPHA32(colorEnd)) / colorSteps%

IF HortVert = "h" THEN
    colorInc = 0
    FOR y = y1 TO y2
        LINE (x1, y)-(x2, y), _RGBA(_RED32(colorStart) + (redInc! * colorInc), _GREEN32(colorStart) + (greenInc! * colorInc), _BLUE32(colorStart) + (blueInc! * colorInc), _ALPHA(colorStart) + (alphaInc! * colorInc))
        colorInc = colorInc + 1
    NEXT
END IF

IF HortVert = "v" THEN
    colorInc = 0
    FOR x = x1 TO x2
        LINE (x, y1)-(x, y2), _RGBA(_RED32(colorStart) + (redInc! * colorInc), _GREEN32(colorStart) + (greenInc! * colorInc), _BLUE32(colorStart) + (blueInc! * colorInc), _ALPHA(colorStart) + (alphaInc! * colorInc))
        colorInc = colorInc + 1
    NEXT
END IF

END SUB