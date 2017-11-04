DIM SHARED ScreenWidth AS INTEGER
DIM SHARED ScreenHeight AS INTEGER
DIM SHARED CurrentTestScreen AS LONG
DIM Radius AS INTEGER
DIM CenterX AS INTEGER
DIM CenterY AS INTEGER
DIM Colr AS LONG
DIM NumOfTests AS LONG
DIM TimesToTest AS INTEGER

REDIM TestTotal(-1, -1)
REDIM TestAverage(-1)

ScreenWidth = 800
ScreenHeight = 600
CenterX = ScreenWidth - (ScreenWidth / 4) - 10
CenterY = ScreenHeight / 2
Radius = 200
TestSeconds = 2
NumOfTests = 5
TimesToTest = 10

REDIM TestTotal(NumOfTests, TimesToTest)
REDIM TestAverage(NumOfTests)

ScreenMain = _NEWIMAGE(ScreenWidth, ScreenHeight, 32)
ScreenBackBuffer = _NEWIMAGE(ScreenWidth, ScreenHeight, 32)

SCREEN ScreenMain
_TITLE "Circle speed test using the Pythagorean Theorm - LINE vs _MEMFILL vs _MEMPUT"

CurrentTestScreen = ScreenMain


' ********** START THE TESTS **********
COLOR _RGB(255, 255, 0)
PRINT "Each test runs for"; TestSeconds; "seconds."
PRINT "Each test speed number represents how many circles are drawn in"; TestSeconds; "seconds."
PRINT
PRINT
COLOR _RGB(64, 255, 64)
PRINT "QB64 LINE ", "_MEMFILL  ", "_MEMPUT   ", "QB LINE #2", "_MEMPUT #2"
COLOR _RGB(218, 0, 215)
PRINT "----------", "----------", "----------", "----------", "----------"

FOR OtherIteration = TimesToTest TO 1 STEP -1

   ' :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
   ' :                                                                                               :
   ' :  TIGHTER TESTING PROCEDURES                                                                   :
   ' :                                                                                               :
   ' :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

   FOR currenttest = 0 TO NumOfTests - 1

       COLOR _RGB(128, 128, 128)
       PRINT "T:"; LTRIM$(RTRIM$(STR$(OtherIteration))); ")";
       IF OtherIteration < 10 THEN PRINT " ";

       BeginTimer# = TIMER
       DO
           '_LIMIT 60

           FOR i = 1 TO 100 ' ### An abitary number

               Count = Count + 1
               Colr = _RGBA32(RND * 255, RND * 255, RND * 255, 255)

               SELECT CASE currenttest
                   CASE 0
                       DrawFilledCircle CenterX, CenterY, Radius, Colr
                   CASE 1
                       MemCircle CurrentTestScreen, CenterX, CenterY, Radius, Colr
                   CASE 2
                       DrawFilledCircle2 CurrentTestScreen, CenterX, CenterY, Radius, Colr
                   CASE 3
                       OctantCircle CurrentTestScreen, CenterX, CenterY, Radius, Colr
                   CASE 4
                       OctantCircleMEMPUT CurrentTestScreen, CenterX, CenterY, Radius, Colr
               END SELECT

               IF TIMER - BeginTimer# >= TestSeconds THEN EXIT DO
           NEXT

           _DISPLAY

       LOOP UNTIL _KEYHIT

       TestTotal(currenttest, TimesToTest - OtherIteration) = Count

       COLOR _RGB(255, 255, 255)

       IF currenttest < NumOfTests - 1 THEN
           PRINT Count,
       ELSE
           PRINT Count
       END IF

       Count = 0

       _DISPLAY

   NEXT
NEXT

_DISPLAY

COLOR _RGB(218, 0, 215)
PRINT "==========", "==========", "==========", "==========", "=========="
COLOR _RGB(64, 255, 64)
PRINT "TEST TOTAL ", "TEST TOTAL", "TEST TOTAL", "TEST TOTAL", "TEST TOTAL"
COLOR _RGB(218, 0, 215)
PRINT "----------", "----------", "----------", "----------", "----------"
COLOR _RGB(255, 255, 255)

FOR i = 0 TO NumOfTests - 1

   CurrentTestTotal = 0
   FOR i2 = 0 TO TimesToTest - 1

       CurrentTestTotal = CurrentTestTotal + TestTotal(i, i2)

   NEXT

   PRINT CurrentTestTotal,
   TestAverage(i) = CurrentTestTotal / TimesToTest

NEXT

PRINT

COLOR _RGB(218, 0, 215)
PRINT "==========", "==========", "==========", "==========", "=========="
COLOR _RGB(64, 255, 64)
PRINT "AVERAGE   ", "AVERAGE   ", "AVERAGE   ", "AVERAGE   ", "AVERAGE   "
COLOR _RGB(218, 0, 215)
PRINT "----------", "----------", "----------", "----------", "----------"
COLOR _RGB(255, 255, 255)

FOR i = 0 TO NumOfTests - 1
   PRINT TestAverage(i),
NEXT

PRINT
COLOR _RGB(218, 0, 215)
PRINT "----------", "----------", "----------", "----------", "----------"

_DISPLAY


'DO: LOOP WHILE INKEY$ = ""

' #################################################################################################
' #                                                                                               #
' #################################################################################################
SUB DrawFilledCircle (CenterX AS INTEGER, CenterY AS INTEGER, Radius AS INTEGER, Colr AS LONG)

RadiusSquared = Radius ^ 2

FOR y = 0 TO Radius
   x = SQR(RadiusSquared - y ^ 2)
   LINE (CenterX - x, CenterY - y)-(CenterX + x, CenterY - y), Colr&
   LINE (CenterX - x, CenterY + y)-(CenterX + x, CenterY + y), Colr&
NEXT

END SUB


' #################################################################################################
' #                                                                                               #
' #################################################################################################
SUB DrawFilledCircle2 (ScreenHandle AS LONG, CenterX AS INTEGER, CenterY AS INTEGER, Radius AS _UNSIGNED LONG, Colr AS _UNSIGNED LONG)

DIM ImageMemory AS _MEM
DIM ImageXOffset AS _OFFSET
DIM ImageOffset AS _OFFSET
DIM ImageEndOffset AS _OFFSET
DIM ImageByteWidth AS _UNSIGNED INTEGER
DIM XCoordinate AS INTEGER
DIM YCoordinate AS INTEGER
DIM RadiusSquared AS _UNSIGNED LONG
DIM LineWidth AS _UNSIGNED INTEGER

ImageMemory = _MEMIMAGE(ScreenHandle)

$CHECKING:OFF

YCoordinate = 0
ImageByteWidth = _WIDTH(ScreenHandle) * 4
ImageXOffset = ImageMemory.OFFSET + CenterX * 4
RadiusSquared = Radius ^ 2

DO
   XCoordinate = SQR(RadiusSquared - YCoordinate ^ 2)
   LineWidth = XCoordinate * 8

   ' *** Draw Top-Left and Top-Right quadrants of the circle
   ImageOffset = ImageXOffset + ImageByteWidth * (CenterY - YCoordinate)
   ImageEndOffset = ImageOffset + LineWidth

   DO
       _MEMPUT ImageMemory, ImageOffset - XCoordinate * 4, Colr AS _UNSIGNED LONG
       ImageOffset = ImageOffset + 4

   LOOP WHILE ImageOffset <= ImageEndOffset

   ' *** Draw Bottom-Left and Botton-Right quandrants of the circle
   ImageOffset = ImageXOffset + ImageByteWidth * (CenterY + YCoordinate)
   ImageEndOffset = ImageOffset + LineWidth

   DO
       _MEMPUT ImageMemory, ImageOffset - XCoordinate * 4, Colr AS _UNSIGNED LONG
       ImageOffset = ImageOffset + 4

   LOOP WHILE ImageOffset <= ImageEndOffset
   YCoordinate = YCoordinate + 1

LOOP UNTIL YCoordinate >= Radius

$CHECKING:ON
_MEMFREE ImageMemory

END SUB


' #################################################################################################
' #                                                                                               #
' #################################################################################################
SUB MemCircle (ScreenHandle AS LONG, XC AS INTEGER, YC AS INTEGER, R AS INTEGER, Kolor AS _UNSIGNED LONG)
'To use this AS a filled circle routine, this MUST be used with 32 bit color screens.
'ScreenHandle is the screen we want to draw the circle on.  0 for the default screen
'XC is the X Center of our Circle.
'YC is the Y Center of our Circle.
'R is the Radius of our Circle.
'Kolor is the color we want to make our circle.

DIM m AS _MEM
m = _MEMIMAGE(ScreenHandle)
DIM O AS _OFFSET, O1 AS _OFFSET
DIM W AS INTEGER
DIM x AS INTEGER, y AS INTEGER

$CHECKING:OFF

y = 0
W = _WIDTH(ScreenHandle) * 4
O1 = m.OFFSET + XC * 4
R2 = R ^ 2
DO
   x = SQR(R2 - y ^ 2)
   O = O1 + W * (YC - y)
   _MEMFILL m, O - x * 4, x * 8, Kolor
   O = O1 + W * (YC + y)
   _MEMFILL m, O - x * 4, x * 8, Kolor
   y = y + 1
LOOP UNTIL y >= R
$CHECKING:ON
_MEMFREE m
END SUB


' #################################################################################################
' #                                                                                               #
' #################################################################################################
SUB OctantCircle (ScreenHandle AS LONG, CenterX AS INTEGER, CenterY AS INTEGER, Radius AS INTEGER, Colr AS _UNSIGNED LONG)

DIM X AS INTEGER
DIM y AS INTEGER
DIM RadiusError AS LONG

X = Radius
y = 0
RadiusError = 1 - X

DO

   LINE (CenterX + -y, CenterY + -X)-(CenterX + y, CenterY + -X), Colr, BF
   LINE (CenterX + -X, CenterY + -y)-(CenterX + X, CenterY + -y), Colr, BF
   LINE (CenterX + X, CenterY + y)-(CenterX + -X, CenterY + y), Colr, BF
   LINE (CenterX + y, CenterY + X)-(CenterX + -y, CenterY + X), Colr, BF

   y = y + 1

   IF RadiusError < 0 THEN
       RadiusError = RadiusError + y + y + 1
   ELSE
       X = X - 1
       RadiusError = RadiusError + 2 * (y - X + 1)
   END IF

   'IF INKEY$ <> "" THEN SYSTEM

LOOP WHILE X >= y

END SUB


' #################################################################################################
' #                                                                                               #
' #################################################################################################
SUB OctantCircleMEMPUT (ScreenHandle AS LONG, CenterX AS INTEGER, CenterY AS INTEGER, Radius AS INTEGER, Colr AS _UNSIGNED LONG)

DIM ImageMemory AS _MEM
DIM ImageXOffset AS _OFFSET
DIM ImageOffset AS _OFFSET
DIM ImageEndOffset AS _OFFSET
DIM ImageByteWidth AS _UNSIGNED INTEGER
DIM XCoordinate AS INTEGER
DIM YCoordinate AS INTEGER
DIM RadiusSquared AS _UNSIGNED LONG
DIM LineWidth AS _UNSIGNED INTEGER
DIM X AS INTEGER
DIM y AS INTEGER
DIM RadiusError AS LONG

X = Radius
y = 0
RadiusError = 1 - X

ImageMemory = _MEMIMAGE(ScreenHandle)
ImageByteWidth = _WIDTH(ScreenHandle) * 4
'ImageXOffset = ImageMemory.OFFSET + CenterX * 4

DO

   ' ### FIRST SECTION
   '     LINE (CenterX + -y, CenterY + -X)-(CenterX + y, CenterY + -X), Colr, BF
   ImageXOffset = ImageMemory.OFFSET + (CenterX + -y) * 4
   ImageOffset = ImageXOffset + ImageByteWidth * (CenterY + -X)
   ImageEndOffset = ImageOffset + ((CenterX + y) - (CenterX + -y)) * 4

   DO
       _MEMPUT ImageMemory, ImageOffset, Colr AS _UNSIGNED LONG
       ImageOffset = ImageOffset + 4
   LOOP WHILE ImageOffset <= ImageEndOffset

   ' ### SECOND SECTION
   '     LINE (CenterX + -X, CenterY + -y)-(CenterX + X, CenterY + -y), Colr, BF
   ImageXOffset = ImageMemory.OFFSET + (CenterX + -X) * 4
   ImageOffset = ImageXOffset + ImageByteWidth * (CenterY + -y)
   ImageEndOffset = ImageOffset + ((CenterX + X) - (CenterX + -X)) * 4

   DO
       _MEMPUT ImageMemory, ImageOffset, Colr AS _UNSIGNED LONG
       ImageOffset = ImageOffset + 4
   LOOP WHILE ImageOffset <= ImageEndOffset

   ' ### THIRD SECTION
   '     LINE (CenterX + X, CenterY + y)-(CenterX + -X, CenterY + y), Colr, BF
   ImageXOffset = ImageMemory.OFFSET + (CenterX + -X) * 4
   ImageOffset = ImageXOffset + ImageByteWidth * (CenterY + y)
   ImageEndOffset = ImageOffset + ((CenterX + X) - (CenterX + -X)) * 4

   DO
       _MEMPUT ImageMemory, ImageOffset, Colr AS _UNSIGNED LONG
       ImageOffset = ImageOffset + 4
   LOOP WHILE ImageOffset <= ImageEndOffset

   ' ### FOURTH SECTION
   '     LINE (CenterX + y, CenterY + X)-(CenterX + -y, CenterY + X), Colr, BF
   ImageXOffset = ImageMemory.OFFSET + (CenterX + -y) * 4
   ImageOffset = ImageXOffset + ImageByteWidth * (CenterY + X)
   ImageEndOffset = ImageOffset + ((CenterX + y) - (CenterX + -y)) * 4

   DO
       _MEMPUT ImageMemory, ImageOffset, Colr AS _UNSIGNED LONG
       ImageOffset = ImageOffset + 4
   LOOP WHILE ImageOffset <= ImageEndOffset

   y = y + 1

   IF RadiusError < 0 THEN
       RadiusError = RadiusError + y + y + 1
   ELSE
       X = X - 1
       RadiusError = RadiusError + 2 * (y - X + 1)
   END IF

LOOP WHILE X >= y

END SUB