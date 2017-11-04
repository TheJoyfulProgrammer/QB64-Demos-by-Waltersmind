CONST TRUE = -1
CONST FALSE = 0

DIM ToothSize AS _FLOAT
DIM Circumference AS _FLOAT
DIM Radius AS _FLOAT
DIM ArcDegrees AS _FLOAT
DIM ArcDegreesHalf AS _FLOAT
DIM CutDepth AS _FLOAT
DIM CutRadius AS _FLOAT
DIM CenterX AS _UNSIGNED INTEGER
DIM CenterY AS _UNSIGNED INTEGER
DIM Scale AS _FLOAT
DIM NumberOfArcs AS _FLOAT
DIM NumberOfTeethHollowGearInside AS _UNSIGNED LONG
DIM NumberOfTeethHollowGearOutside AS _UNSIGNED LONG
DIM NumberOfTeethSolidGear AS _UNSIGNED LONG

DIM SolidGearOffsetRadius AS _FLOAT
DIM SolidGearAnglePosition AS _FLOAT
DIM SolidGearAngleRotation AS _FLOAT
DIM SolidGearPenHoleRadius AS _FLOAT
DIM SolidGearOffsetX AS _FLOAT
DIM SolidGearOffsetXOld AS _FLOAT
DIM SolidGearOffsetY AS _FLOAT
DIM SolidGearOffsetYOld AS _FLOAT

'  DEFINE IMAGES USED IN DEMO
DIM HollowGear AS LONG
DIM SolidGear AS LONG
DIM DrawingPaper AS LONG
DIM HelpMenu AS LONG

DIM SHARED Degree AS _FLOAT

DIM PenColor AS _UNSIGNED LONG
DIM PenSize AS _UNSIGNED INTEGER
DIM DrawingSpeed AS _UNSIGNED INTEGER

DIM PenOn AS _BYTE
DIM SolidGearMoving AS _BYTE
DIM SolidGearMinTeeth AS _UNSIGNED INTEGER
DIM HollowGearMinTeeth AS _UNSIGNED INTEGER
DIM PenSizeMin AS _UNSIGNED INTEGER
DIM SolidGearSpeed AS INTEGER
DIM PenHoleDistancePercent AS _FLOAT

PenOn = FALSE
SolidGearMoving = FALSE
SolidGearMinTeeth = 14
HollowGearMinTeeth = 24
PenSizeMin = 1
SolidGearSpeed = 1

PenColor = _RGB32(255, 255, 0)
PenSize = PenSizeMin
DrawingSpeed = 1

ToothSize = 3 / 32 '  SIZE IS IN INCHES
Degree = _PI / 180
Scale = 100
CutDepth = (1 / 16) * Scale '  SIZE IN INCHES

SCREEN _NEWIMAGE(800, 600, 32)
_TITLE "The Joyful Programmer - Spirograph's Ver 01"

CenterX = _WIDTH(0) / 2
CenterY = _HEIGHT(0) / 2


'  *** CREATE HELP MENU ***

HelpMenu = _NEWIMAGE(270, 260, 32)
_DEST HelpMenu

LINE (0, 0)-(_WIDTH(HelpMenu) - 1, _HEIGHT(HelpMenu) - 1), _RGB32(160, 160, 160), BF
LINE (5, 5)-(_WIDTH(HelpMenu) - 6, _HEIGHT(HelpMenu) - 6), _RGB32(250, 250, 250), BF

_SETALPHA 64, _RGB32(160, 160, 160)
_SETALPHA 64, _RGB32(250, 250, 250)

COLOR _RGB32(0, 0, 200)
_PRINTMODE _KEEPBACKGROUND
_PRINTSTRING (8, 8), "COMMAND KEYS:"

COLOR _RGB32(0, 160, 0)
_PRINTSTRING (10, 30), "1 = Pen DOWN/UP"
_PRINTSTRING (10, 46), "2 = Solid Gear Spin ON/OFF"
_PRINTSTRING (10, 62), "3 = Pen Size INCREASE"
_PRINTSTRING (10, 78), "4 = Pen Size DECREASE"
_PRINTSTRING (10, 94), "5 = CLEAR DRAWING PAPER"
_PRINTSTRING (10, 110), "6 = Hollow Gear Size INCREASE"
_PRINTSTRING (10, 126), "7 = Hollow Gear Size DECREASE"
_PRINTSTRING (10, 142), "8 = Solid Gear Size INCREASE"
_PRINTSTRING (10, 158), "9 = Solid Gear Size DECREASE"
_PRINTSTRING (10, 174), "0 = Set Random Pen Color"
_PRINTSTRING (10, 190), "Q = Pen Hole Move OUT"
_PRINTSTRING (10, 206), "A = Pen Hole Move IN"
_PRINTSTRING (10, 222), "W = Speed Up Drawing"
_PRINTSTRING (10, 238), "S = Slow Down Drawing"


'  ------------------------------------------------------------------

NumberOfTeethHollowGearInside = 130
NumberOfTeethHollowGearOutside = NumberOfTeethHollowGearInside + 28
NumberOfTeethSolidGear = 40
PenHoleDistancePercent = 80

HollowGearPixelSize = ((NumberOfTeethHollowGearOutside * ToothSize) / _PI) * Scale + 1
SolidGearPixelSize = (((NumberOfTeethSolidGear * ToothSize) / _PI)) * Scale + 1

SolidGearPenHoleRadius = (SolidGearPixelSize / 2 - CutDepth - 14) / 100 * PenHoleDistancePercent + 6

HollowGear = _NEWIMAGE(HollowGearPixelSize, HollowGearPixelSize, 32)
SolidGear = _NEWIMAGE(SolidGearPixelSize, SolidGearPixelSize, 32)
DrawingPaper = _NEWIMAGE(_WIDTH(0), _HEIGHT(0), 32)


'  DRAW HOLLOW GEAR ON HOLLOWGEAR IMAGE

DrawHollowGear HollowGear, _WIDTH(HollowGear) / 2, _HEIGHT(HollowGear) / 2, NumberOfTeethHollowGearInside, NumberOfTeethHollowGearOutside, ToothSize, CutDepth, Scale
DrawSolidGear SolidGear, _WIDTH(SolidGear) / 2, _HEIGHT(SolidGear) / 2, NumberOfTeethSolidGear, ToothSize, CutDepth, Scale, SolidGearPenHoleRadius

ToothSpin = (360 / (NumberOfTeethHollowGearInside - NumberOfTeethSolidGear)) / 2

_DEST DrawingPaper
CLS , _RGB32(220, 220, 220)

_DEST 0

SolidGearOffsetRadius = (((NumberOfTeethHollowGearInside * ToothSize) / _PI) / 2) * Scale - _HEIGHT(SolidGear) / 2
SolidGearPenHoleRadius = (SolidGearPixelSize / 2 - CutDepth - 14) / 100 * PenHoleDistancePercent + 6
SolidGearAnglePosition = 0
SolidGearAngleRotation = 0

Circumference1 = (NumberOfTeethHollowGearInside + 1) * ToothSize
Circumference2 = (NumberOfTeethSolidGear + 1) * ToothSize
SolidGearSpin = (Circumference1 / Circumference2)

SolidGearOffsetX = CenterX + SolidGearOffsetRadius * SIN(SolidGearAnglePosition * Degree)
SolidGearOffsetY = CenterY - SolidGearOffsetRadius * COS(SolidGearAnglePosition * Degree)
SolidGearHoleX = SolidGearOffsetX - SolidGearPenHoleRadius * SIN(SolidGearAngleRotation * Degree)
SolidGearHoleY = SolidGearOffsetY - SolidGearPenHoleRadius * COS(SolidGearAngleRotation * Degree)

SolidGearOffsetXOld = SolidGearOffsetX
SolidGearOffsetYOld = SolidGearOffsetY
SolidGearHoleXOld = SolidGearHoleX
SolidGearHoleYOld = SolidGearHoleY



DO


   _LIMIT 30

   _DEST DrawingPaper

   FOR i = 1 TO DrawingSpeed

       k& = _KEYHIT

       SELECT CASE k&
           CASE 27 '  <ESC> - EXIT THE DEMO

               SYSTEM

           CASE 48 '  <0> - CHANGE PEN COLOR

               PenColor = _RGB32(RND * 256, RND * 256, RND * 256)

           CASE 49 '  <1> - TURN ON/OFF PEN

               IF PenOn = TRUE THEN
                   PenOn = FALSE
               ELSE
                   PenOn = TRUE
               END IF

           CASE 50 '  <2> - TURN ON/OFF SOLID GEARS MOVEMENT

               IF SolidGearMoving = TRUE THEN
                   SolidGearMoving = FALSE
               ELSE
                   SolidGearMoving = TRUE
               END IF

           CASE 51 '  <3> - PEN SIZE INCREASE

               PenSize = PenSize + 1

           CASE 52 '  <4> - PEN SIZE DECREASE

               IF PenSize > PenSizeMin THEN PenSize = PenSize - 1

           CASE 53 '  <5> - ERASE DRAWINGS IN DRAWING PAPER

               _DEST DrawingPaper
               CLS , _RGB32(240, 240, 240)

           CASE 54 '  <6> - INCREASE HOLLOW GEAR SIZE

               _FREEIMAGE HollowGear

               NumberOfTeethHollowGearInside = NumberOfTeethHollowGearInside + 1
               NumberOfTeethHollowGearOutside = NumberOfTeethHollowGearInside + 28
               HollowGearPixelSize = ((NumberOfTeethHollowGearOutside * ToothSize) / _PI) * Scale + 1

               HollowGear = _NEWIMAGE(HollowGearPixelSize, HollowGearPixelSize, 32)

               DrawHollowGear HollowGear, _WIDTH(HollowGear) / 2, _HEIGHT(HollowGear) / 2, NumberOfTeethHollowGearInside, NumberOfTeethHollowGearOutside, ToothSize, CutDepth, Scale
               ToothSpin = (360 / (NumberOfTeethHollowGearInside - NumberOfTeethSolidGear)) / 2
               SolidGearOffsetRadius = (((NumberOfTeethHollowGearInside * ToothSize) / _PI) / 2) * Scale - _HEIGHT(SolidGear) / 2

               Circumference1 = (NumberOfTeethHollowGearInside) * ToothSize
               Circumference2 = (NumberOfTeethSolidGear) * ToothSize
               SolidGearSpin = (Circumference1 / Circumference2)

               SolidGearOffsetX = CenterX + SolidGearOffsetRadius * SIN(SolidGearAnglePosition * Degree)
               SolidGearOffsetY = CenterY - SolidGearOffsetRadius * COS(SolidGearAnglePosition * Degree)
               SolidGearHoleX = SolidGearOffsetX - SolidGearPenHoleRadius * SIN(SolidGearAngleRotation * Degree)
               SolidGearHoleY = SolidGearOffsetY - SolidGearPenHoleRadius * COS(SolidGearAngleRotation * Degree)

               SolidGearOffsetXOld = SolidGearOffsetX
               SolidGearOffsetYOld = SolidGearOffsetY
               SolidGearHoleXOld = SolidGearHoleX
               SolidGearHoleYOld = SolidGearHoleY

           CASE 55 '  <7> - DECREASE HOLLOW GEAR SIZE

               _FREEIMAGE HollowGear

               IF NumberOfTeethHollowGearInside > HollowGearMinTeeth THEN NumberOfTeethHollowGearInside = NumberOfTeethHollowGearInside - 1
               NumberOfTeethHollowGearOutside = NumberOfTeethHollowGearInside + 28
               HollowGearPixelSize = ((NumberOfTeethHollowGearOutside * ToothSize) / _PI) * Scale + 1

               HollowGear = _NEWIMAGE(HollowGearPixelSize, HollowGearPixelSize, 32)

               DrawHollowGear HollowGear, _WIDTH(HollowGear) / 2, _HEIGHT(HollowGear) / 2, NumberOfTeethHollowGearInside, NumberOfTeethHollowGearOutside, ToothSize, CutDepth, Scale
               ToothSpin = (360 / (NumberOfTeethHollowGearInside - NumberOfTeethSolidGear)) / 2
               SolidGearOffsetRadius = (((NumberOfTeethHollowGearInside * ToothSize) / _PI) / 2) * Scale - _HEIGHT(SolidGear) / 2

               Circumference1 = (NumberOfTeethHollowGearInside) * ToothSize
               Circumference2 = (NumberOfTeethSolidGear) * ToothSize
               SolidGearSpin = (Circumference1 / Circumference2)

               SolidGearOffsetX = CenterX + SolidGearOffsetRadius * SIN(SolidGearAnglePosition * Degree)
               SolidGearOffsetY = CenterY - SolidGearOffsetRadius * COS(SolidGearAnglePosition * Degree)
               SolidGearHoleX = SolidGearOffsetX - SolidGearPenHoleRadius * SIN(SolidGearAngleRotation * Degree)
               SolidGearHoleY = SolidGearOffsetY - SolidGearPenHoleRadius * COS(SolidGearAngleRotation * Degree)

               SolidGearOffsetXOld = SolidGearOffsetX
               SolidGearOffsetYOld = SolidGearOffsetY
               SolidGearHoleXOld = SolidGearHoleX
               SolidGearHoleYOld = SolidGearHoleY

           CASE 56 '  <8> - INCREASE SOLID GEAR SIZE

               _FREEIMAGE SolidGear

               NumberOfTeethSolidGear = NumberOfTeethSolidGear + 1
               SolidGearPixelSize = (((NumberOfTeethSolidGear * ToothSize) / _PI)) * Scale + 1

               SolidGear = _NEWIMAGE(SolidGearPixelSize, SolidGearPixelSize, 32)
               SolidGearPenHoleRadius = (SolidGearPixelSize / 2 - CutDepth - 14) / 100 * PenHoleDistancePercent + 6
               DrawSolidGear SolidGear, _WIDTH(SolidGear) / 2, _HEIGHT(SolidGear) / 2, NumberOfTeethSolidGear, ToothSize, CutDepth, Scale, SolidGearPenHoleRadius

               ToothSpin = (360 / (NumberOfTeethHollowGearInside - NumberOfTeethSolidGear)) / 2
               SolidGearOffsetRadius = (((NumberOfTeethHollowGearInside * ToothSize) / _PI) / 2) * Scale - _HEIGHT(SolidGear) / 2

               SolidGearOffsetX = CenterX + SolidGearOffsetRadius * SIN(SolidGearAnglePosition * Degree)
               SolidGearOffsetY = CenterY - SolidGearOffsetRadius * COS(SolidGearAnglePosition * Degree)
               SolidGearHoleX = SolidGearOffsetX - SolidGearPenHoleRadius * SIN(SolidGearAngleRotation * Degree)
               SolidGearHoleY = SolidGearOffsetY - SolidGearPenHoleRadius * COS(SolidGearAngleRotation * Degree)

               Circumference1 = (NumberOfTeethHollowGearInside) * ToothSize
               Circumference2 = (NumberOfTeethSolidGear) * ToothSize
               SolidGearSpin = (Circumference1 / Circumference2)

               SolidGearOffsetXOld = SolidGearOffsetX
               SolidGearOffsetYOld = SolidGearOffsetY
               SolidGearHoleXOld = SolidGearHoleX
               SolidGearHoleYOld = SolidGearHoleY

           CASE 57 '  <9> - DECREASE SOLID GEAR SIZE

               _FREEIMAGE SolidGear

               IF NumberOfTeethSolidGear > SolidGearMinTeeth THEN NumberOfTeethSolidGear = NumberOfTeethSolidGear - 1
               SolidGearPixelSize = (((NumberOfTeethSolidGear * ToothSize) / _PI)) * Scale + 1

               SolidGear = _NEWIMAGE(SolidGearPixelSize, SolidGearPixelSize, 32)
               SolidGearPenHoleRadius = (SolidGearPixelSize / 2 - CutDepth - 14) / 100 * PenHoleDistancePercent + 6
               DrawSolidGear SolidGear, _WIDTH(SolidGear) / 2, _HEIGHT(SolidGear) / 2, NumberOfTeethSolidGear, ToothSize, CutDepth, Scale, SolidGearPenHoleRadius

               ToothSpin = (360 / (NumberOfTeethHollowGearInside - NumberOfTeethSolidGear)) / 2
               SolidGearOffsetRadius = (((NumberOfTeethHollowGearInside * ToothSize) / _PI) / 2) * Scale - _HEIGHT(SolidGear) / 2

               SolidGearOffsetX = CenterX + SolidGearOffsetRadius * SIN(SolidGearAnglePosition * Degree)
               SolidGearOffsetY = CenterY - SolidGearOffsetRadius * COS(SolidGearAnglePosition * Degree)
               SolidGearHoleX = SolidGearOffsetX - SolidGearPenHoleRadius * SIN(SolidGearAngleRotation * Degree)
               SolidGearHoleY = SolidGearOffsetY - SolidGearPenHoleRadius * COS(SolidGearAngleRotation * Degree)

               Circumference1 = (NumberOfTeethHollowGearInside) * ToothSize
               Circumference2 = (NumberOfTeethSolidGear) * ToothSize
               SolidGearSpin = (Circumference1 / Circumference2)

               SolidGearOffsetXOld = SolidGearOffsetX
               SolidGearOffsetYOld = SolidGearOffsetY
               SolidGearHoleXOld = SolidGearHoleX
               SolidGearHoleYOld = SolidGearHoleY


           CASE 113, 81 ' <q> or <Q> - MOVE THE PEN HOLE TO THE OUTSIDE OF THE SOLID GEAR

               IF PenHoleDistancePercent < 100 THEN
                   _FREEIMAGE SolidGear

                   SolidGearPixelSize = (((NumberOfTeethSolidGear * ToothSize) / _PI)) * Scale + 1
                   SolidGear = _NEWIMAGE(SolidGearPixelSize, SolidGearPixelSize, 32)
                   PenHoleDistancePercent = PenHoleDistancePercent + 1
                   SolidGearPenHoleRadius = (SolidGearPixelSize / 2 - CutDepth - 14) / 100 * PenHoleDistancePercent + 6

                   DrawSolidGear SolidGear, _WIDTH(SolidGear) / 2, _HEIGHT(SolidGear) / 2, NumberOfTeethSolidGear, ToothSize, CutDepth, Scale, SolidGearPenHoleRadius

                   SolidGearOffsetX = CenterX + SolidGearOffsetRadius * SIN(SolidGearAnglePosition * Degree)
                   SolidGearOffsetY = CenterY - SolidGearOffsetRadius * COS(SolidGearAnglePosition * Degree)
                   SolidGearHoleX = SolidGearOffsetX - SolidGearPenHoleRadius * SIN(SolidGearAngleRotation * Degree)
                   SolidGearHoleY = SolidGearOffsetY - SolidGearPenHoleRadius * COS(SolidGearAngleRotation * Degree)

                   SolidGearOffsetXOld = SolidGearOffsetX
                   SolidGearOffsetYOld = SolidGearOffsetY
                   SolidGearHoleXOld = SolidGearHoleX
                   SolidGearHoleYOld = SolidGearHoleY

               END IF

           CASE 97, 65 '  <a> or <A> - MOVE THE HOLE TO THE INSIDE OF THE SOLID GEAR

               IF PenHoleDistancePercent > 0 THEN
                   _FREEIMAGE SolidGear

                   SolidGearPixelSize = (((NumberOfTeethSolidGear * ToothSize) / _PI)) * Scale + 1
                   SolidGear = _NEWIMAGE(SolidGearPixelSize, SolidGearPixelSize, 32)
                   PenHoleDistancePercent = PenHoleDistancePercent - 1
                   SolidGearPenHoleRadius = (SolidGearPixelSize / 2 - CutDepth - 14) / 100 * PenHoleDistancePercent + 6

                   DrawSolidGear SolidGear, _WIDTH(SolidGear) / 2, _HEIGHT(SolidGear) / 2, NumberOfTeethSolidGear, ToothSize, CutDepth, Scale, SolidGearPenHoleRadius

                   SolidGearOffsetX = CenterX + SolidGearOffsetRadius * SIN(SolidGearAnglePosition * Degree)
                   SolidGearOffsetY = CenterY - SolidGearOffsetRadius * COS(SolidGearAnglePosition * Degree)
                   SolidGearHoleX = SolidGearOffsetX - SolidGearPenHoleRadius * SIN(SolidGearAngleRotation * Degree)
                   SolidGearHoleY = SolidGearOffsetY - SolidGearPenHoleRadius * COS(SolidGearAngleRotation * Degree)

                   SolidGearOffsetXOld = SolidGearOffsetX
                   SolidGearOffsetYOld = SolidGearOffsetY
                   SolidGearHoleXOld = SolidGearHoleX
                   SolidGearHoleYOld = SolidGearHoleY

               END IF

           CASE 119, 87 '  <W> or <w> - SPEED UP DRAWING

               DrawingSpeed = DrawingSpeed + 1

           CASE 115, 83 '  <S> or <s> - SLOW DOWN DRAWING

               IF DrawingSpeed > 1 THEN
                   DrawingSpeed = DrawingSpeed - 1
               END IF

           CASE ELSE

       END SELECT

       IF PenOn = TRUE THEN
           FOR x = -(PenSize / 3) TO PenSize / 3
               FOR y = -(PenSize / 3) TO PenSize / 3
                   LINE (SolidGearHoleXOld + x, SolidGearHoleYOld + y)-(SolidGearHoleX + x, SolidGearHoleY + y), PenColor
               NEXT
           NEXT
       END IF


       IF SolidGearMoving = TRUE THEN
           SolidGearOffsetXOld = SolidGearOffsetX
           SolidGearOffsetYOld = SolidGearOffsetY
           SolidGearHoleXOld = SolidGearHoleX
           SolidGearHoleYOld = SolidGearHoleY

           SolidGearAnglePosition = SolidGearAnglePosition + SolidGearSpeed
           SolidGearAngleRotation = SolidGearAngleRotation + SolidGearSpin - 1 ' - SolidGearSpeed)

           SolidGearOffsetX = CenterX + SolidGearOffsetRadius * SIN(SolidGearAnglePosition * Degree)
           SolidGearOffsetY = CenterY - SolidGearOffsetRadius * COS(SolidGearAnglePosition * Degree)
           SolidGearHoleX = SolidGearOffsetX - SolidGearPenHoleRadius * SIN(SolidGearAngleRotation * Degree)
           SolidGearHoleY = SolidGearOffsetY - SolidGearPenHoleRadius * COS(SolidGearAngleRotation * Degree)
       END IF

   NEXT


   _DEST 0

   _PUTIMAGE (0, 0), DrawingPaper, 0
   _PUTIMAGE (2, 2), HelpMenu, 0

   DisplayImage HollowGear, CenterX, CenterY, 0, 0
   DisplayImage SolidGear, SolidGearOffsetX, SolidGearOffsetY, SolidGearAngleRotation, 0

   _DISPLAY


LOOP

SYSTEM



SUB DrawGearOutline (CenterX AS _UNSIGNED INTEGER, CenterY AS _UNSIGNED INTEGER, NumberOfTeeth AS _UNSIGNED INTEGER, ToothSize AS _FLOAT, CutDepth AS _FLOAT, Scale AS _FLOAT)

   Circumference = NumberOfTeeth * ToothSize
   Radius = ((Circumference / _PI) / 2) * Scale
   ArcDegrees = (NumberOfTeeth / 360) * Degree
   ArcDegreesHalf = ArcDegrees / 2
   NumberOfArcs = 360 / NumberOfTeeth

   FOR Degrees = 0 TO 359 STEP NumberOfArcs

       x = CenterX + Radius * SIN(Degrees * Degree)
       y = CenterY - Radius * COS(Degrees * Degree)

       x1 = CenterX + (Radius - CutDepth) * SIN((Degrees + NumberOfArcs / 2) * Degree)
       y1 = CenterY - (Radius - CutDepth) * COS((Degrees + NumberOfArcs / 2) * Degree)

       x2 = CenterX + Radius * SIN((Degrees + NumberOfArcs) * Degree)
       y2 = CenterY - Radius * COS((Degrees + NumberOfArcs) * Degree)

       LINE (x, y)-(x1, y1)
       LINE -(x2, y2)

   NEXT

END SUB


SUB DrawHollowGear (Image AS LONG, CenterX AS _UNSIGNED INTEGER, CenterY AS _UNSIGNED INTEGER, NumberOfInsideTeeth AS _UNSIGNED INTEGER, NumberOfOutsideTeeth AS _UNSIGNED INTEGER, ToothSize AS _FLOAT, CutDepth AS _FLOAT, Scale AS _FLOAT)

   DIM ImageTemp AS LONG
   DIM CircumferenceInside AS _FLOAT
   DIM CircumferenceOutside AS _FLOAT
   DIM RadiusInside AS _FLOAT
   DIM RadiusOutside AS _FLOAT

   ImageTemp = _NEWIMAGE(_WIDTH(Image), _HEIGHT(Image), 32)
   _DEST ImageTemp

   COLOR _RGB32(255, 255, 255)

   CircumferenceInside = NumberOfInsideTeeth * ToothSize
   RadiusInside = ((CircumferenceInside / _PI) / 2) * Scale

   CircumferenceOutside = NumberOfOutsideTeeth * ToothSize
   RadiusOutside = ((CircumferenceOutside / _PI) / 2) * Scale

   x = CenterX + (RadiusInside + 15) * SIN(RadiusInside * Degree)
   y = CenterY - (RadiusInside + 15) * COS(RadiusInside * Degree)

   CIRCLE (CenterX, CenterY), RadiusInside + 4
   CIRCLE (CenterX, CenterY), RadiusOutside - (ToothSize * Scale) - 2
   PAINT (x, y), _RGB32(255, 255, 255), _RGB32(255, 255, 255)

   _SETALPHA 190, _RGB32(255, 255, 255)
   _PUTIMAGE (0, 0), ImageTemp, Image

   CLS

   DrawGearOutline CenterX, CenterY, NumberOfInsideTeeth, ToothSize, CutDepth, Scale
   DrawGearOutline CenterX, CenterY, NumberOfOutsideTeeth, ToothSize, CutDepth, Scale

   CIRCLE (CenterX, CenterY), RadiusInside + 4, _RGB32(255, 255, 255)
   CIRCLE (CenterX, CenterY), RadiusOutside - (ToothSize * Scale) - 2, _RGB32(255, 255, 255)

   PAINT (CenterX, CenterY - (RadiusInside + 3)), _RGB32(255, 255, 255), _RGB32(255, 255, 255)
   PAINT (CenterX, CenterY - (RadiusOutside - (ToothSize * Scale))), _RGB32(255, 255, 255), _RGB32(255, 255, 255)

   CIRCLE (CenterX, CenterY), RadiusInside + 4, _RGB32(0, 0, 0)
   CIRCLE (CenterX, CenterY), RadiusOutside - (ToothSize * Scale) - 2, _RGB32(0, 0, 0)

   _SETALPHA 0, _RGB32(0, 0, 0)
   _SETALPHA 80, _RGB32(255, 255, 255)
   _PUTIMAGE (0, 0), ImageTemp, Image

   _DEST Image

   COLOR _RGBA32(64, 64, 64, 96)
   DrawGearOutline CenterX, CenterY, NumberOfInsideTeeth, ToothSize, CutDepth, Scale
   DrawGearOutline CenterX, CenterY, NumberOfOutsideTeeth, ToothSize, CutDepth, Scale

   _FREEIMAGE ImageTemp

END SUB




SUB DrawSolidGear (Image AS LONG, CenterX AS _UNSIGNED INTEGER, CenterY AS _UNSIGNED INTEGER, NumberOfTeeth AS _UNSIGNED INTEGER, ToothSize AS _FLOAT, CutDepth AS _FLOAT, Scale AS _FLOAT, SolidGearPenHoleRadius AS _FLOAT)

   DIM ImageTemp AS LONG
   DIM Circumference AS _FLOAT
   DIM Radius AS _FLOAT

   ImageTemp = _NEWIMAGE(_WIDTH(Image), _HEIGHT(Image), 32)
   _DEST ImageTemp

   COLOR _RGB32(200, 200, 200)

   Circumference = NumberOfTeeth * ToothSize
   Radius = ((Circumference / _PI) / 2) * Scale

   DrawGearOutline CenterX, CenterY, NumberOfTeeth, ToothSize, CutDepth, Scale

   x = CenterX
   y = CenterY - SolidGearPenHoleRadius
   CIRCLE (x, y), 5

   PAINT (CenterX, CenterY), _RGB32(200, 200, 200), _RGB32(200, 200, 200)

   _SETALPHA 200, _RGB32(200, 200, 200)
   _PUTIMAGE (0, 0), ImageTemp, Image

   CLS
   _SETALPHA 0, _RGB32(0, 0, 0)

   COLOR _RGB32(32, 32, 32)

   LINE (CenterX - Radius, CenterY)-(CenterX + Radius, CenterY)
   LINE (CenterX, CenterY - SolidGearPenHoleRadius + 5)-(CenterX, CenterY + Radius)
   LINE (CenterX, CenterY - SolidGearPenHoleRadius - 5)-(CenterX, CenterY - Radius)

   _SETALPHA 128, _RGB32(32, 32, 32)
   _PUTIMAGE (0, 0), ImageTemp, Image

   _DEST Image

   COLOR _RGBA32(64, 64, 64, 96)
   DrawGearOutline CenterX, CenterY, NumberOfTeeth, ToothSize, CutDepth, Scale
   CIRCLE (x, y), 5, _RGBA32(64, 64, 64, 200)

   _FREEIMAGE ImageTemp

END SUB



SUB DisplayImage (Image AS LONG, x AS INTEGER, y AS INTEGER, angle AS SINGLE, mode AS _BYTE)
   'Image is the image handle which we use to reference our image.
   'x,y is the X/Y coordinates where we want the image to be at on the screen.
   'angle is the angle which we wish to rotate the image.
   'mode determines HOW we place the image at point X,Y.
   'Mode 0 we center the image at point X,Y
   'Mode 1 we place the Top Left corner of our image at point X,Y
   'Mode 2 is Bottom Left
   'Mode 3 is Top Right
   'Mode 4 is Bottom Right


   DIM px(3) AS INTEGER, py(3) AS INTEGER, w AS INTEGER, h AS INTEGER
   DIM sinr AS SINGLE, cosr AS SINGLE, i AS _BYTE
   w = _WIDTH(Image): h = _HEIGHT(Image)
   SELECT CASE mode
       CASE 0 'center
           px(0) = -w \ 2: py(0) = -h \ 2
           px(3) = w \ 2: py(3) = -h \ 2
           px(1) = -w \ 2: py(1) = h \ 2
           px(2) = w \ 2: py(2) = h \ 2
       CASE 1 'top left
           px(0) = 0: py(0) = 0
           px(3) = w: py(3) = 0
           px(1) = 0: py(1) = h
           px(2) = w: py(2) = h
       CASE 2 'bottom left
           px(0) = 0: py(0) = -h
           px(3) = w: py(3) = -h
           px(1) = 0: py(1) = 0
           px(2) = w: py(2) = 0
       CASE 3 'top right
           px(0) = -w: py(0) = 0
           px(3) = 0: py(3) = 0
           px(1) = -w: py(1) = h
           px(2) = 0: py(2) = h
       CASE 4 'bottom right
           px(0) = -w: py(0) = -h
           px(3) = 0: py(3) = -h
           px(1) = -w: py(1) = 0: px(2) = 0: py(2) = 0
   END SELECT

   sinr = SIN(angle / 57.2957795131)
   cosr = COS(angle / 57.2957795131)

   FOR i = 0 TO 3
       x2 = (px(i) * cosr + sinr * py(i)) + x
       y2 = (py(i) * cosr - px(i) * sinr) + y
       px(i) = x2
       py(i) = y2
   NEXT

   _MAPTRIANGLE _SEAMLESS(0, 0)-(0, h - 1)-(w - 1, h - 1), Image TO(px(0), py(0))-(px(1), py(1))-(px(2), py(2)), , _SMOOTH
   _MAPTRIANGLE _SEAMLESS(0, 0)-(w - 1, 0)-(w - 1, h - 1), Image TO(px(0), py(0))-(px(3), py(3))-(px(2), py(2)), , _SMOOTH

END SUB
