ScreenWidth& = 1024
ScreenHeight& = 600

ScreenImage1& = _NEWIMAGE(ScreenWidth&, ScreenHeight&, 32)
ScreenBackBuffer& = _NEWIMAGE(ScreenWidth&, ScreenHeight&, 32)

' ### Change the size of image1& to change the size of the tile.
image1& = _NEWIMAGE(128, 128, 32)

SCREEN ScreenImage1&

StartingPointX& = 0
StartingPointY& = 0
Radius& = 800
Angle! = 0
AngleInc! = 0.5
Degree! = 3.141592654 / 180

_DEST (image1&)
LINE (0, 0)-(_WIDTH(image1&), _HEIGHT(image1&)), _RGB(255, 255, 255), BF
GradientCircle _WIDTH(image1&) / 2, _HEIGHT(image1&) / 2, _HEIGHT(image1&) - _HEIGHT(image1&) / 4, _RGB(0, 255, 0), _RGB(0, 128, 0)

_DEST (ScreenImage1&)

text$ = "Background image shifting in a circler motion..."
textX = (ScreenWidth& - _PRINTWIDTH(text$)) / 2
textY = (ScreenHeight& - _FONTHEIGHT) / 2
_PRINTMODE _KEEPBACKGROUND

DO

   _LIMIT 60

   ' ### Here we need to get the starting point of the top left edge of the rectangler image we will use for the background.
   ' ### If the starting point is outside the image1& dimensions, we must "normalize" it to keep it inside. That way, the
   ' ### background image completely fills the screen and the edges will not be shown. We keep the starting point inside the
   ' ### dimensions of image1& since we are tiling image1& on the background image.

   StartingPointX& = (Radius& * SIN(Angle! * Degree!)) MOD _WIDTH(image1&)
   StartingPointY& = (Radius& * COS(Angle! * Degree!)) MOD _HEIGHT(image1&)
   Angle! = Angle! + AngleInc!

   ' ### The trick here is to paint a rectangular area, the size of the screen or larger, filled with the graphic from image1&.
   FOR y = -_HEIGHT(image1&) TO (ScreenHeight& + _HEIGHT(image1&)) STEP _HEIGHT(image1&)
       FOR x = -_WIDTH(image1&) TO (ScreenWidth& + _WIDTH(image1&)) STEP _WIDTH(image1&)
           _PUTIMAGE (x + StartingPointX&, y - StartingPointY&), image1&
       NEXT
   NEXT

   circlex2 = (ScreenWidth& / 2 - 50) * SIN((360 - (Angle! MOD 360)) * Degree!)
   circley2 = (ScreenHeight& / 2 - 50) * COS((360 - (Angle! MOD 360)) * Degree!)

   _PRINTSTRING (textX, textY), text$

   _DISPLAY
   IF INKEY$ <> "" THEN SYSTEM

LOOP WHILE INKEY$ = ""
SYSTEM

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