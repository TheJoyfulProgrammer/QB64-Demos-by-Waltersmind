'
'  RADAR DISPLAY DEMO
'
'  Created By: Walter Whitman
'              A.K.A.  Waltersmind
'              The Joyful Programmer
'              www.TheJoyfulProgrammer.com
'              www.TheJoyfulProgrammer.com/qb64/forum/
'
'  Created: December 2016


'  LET'S CHANGE THINGS UP A BIT
RANDOMIZE TIMER

' DEFINE VARIOUS DETAILS ABOUT THE BOGIES
TYPE Bogie
    x AS INTEGER '           '  X-Coordinate of bogie
    y AS INTEGER '           '  Y-Coordinate of bogie
    xc AS INTEGER '          '  X-Coordinate of center of bogie
    yc AS INTEGER '          '  Y-Coordinate of center of bogie
    Angle AS SINGLE '        '  Angle of bogie relative to center of radar
    Distance AS _FLOAT '     '  Distance (radius) from center of radar. This is constantly changing.
    StaticDistance AS _FLOAT '  Static distance from center of radar. This is used to keep bogie image in place until next update
    BeginTime AS DOUBLE '    '  The moment when the bogie is displayed. Helps on the fading out of the bogie.
    SpeedMPH AS _FLOAT '     '  How fast the bogie is heading towards the center of the radar. Values based on jet planes.
END TYPE

CONST BogieNumOfFrames = 20 '            '  How many frames to create for the bogie fading effect
CONST NumOfBogies = 16 '                  '  How many bogies to create and display on the radar
CONST MinutesPerHour = 60 '              '  Defined to help understand some math later in the code
CONST SecondsPerMinute = 60 '            '  Defined to help understand some math later in the code
CONST SpeedOfSoundMPH = 767.269 '        '  1 speed of sound unit is called Mach (Mach 1)
CONST ShortRangeRadarDistanceMiles = 6.2 '  Factual distance short range radars scan
CONST LongRangeRadarDistanceMiles = 62 ' '  Factual distance long rane radars scan

DIM RadarScanDistanceInMiles AS _FLOAT '     '  How far our radar scans
DIM RadarSize AS _UNSIGNED INTEGER '         '  How large the radius of the radar is
DIM RadarRingDistance AS _UNSIGNED INTEGER ' '  Distance in pixels between each one-mile rings

' Short Range Radar Distance = 6.2 Miles
' Long Range Radar Distance = 62 miles
RadarScanDistanceInMiles = ShortRangeRadarDistanceMiles '  Use this to show the short range radar
'RadarScanDistanceInMiles = LongRangeRadarDistanceMiles '  Uncomment to use long range radar

DIM Bogies(NumOfBogies) AS Bogie '            '  Create the array that contains the data of all the bogies
DIM BogieDisplayTime AS DOUBLE '              '  How long to keep the bogies on the radar
DIM BogieFrameTimeSlice AS _FLOAT '           '  How long each frame of the bogie sprite sheet stays on screen in real time. Based on TIMER
DIM BogieImage AS LONG '                      '  The bogie sprite sheet image
DIM BogieImageWidth AS _UNSIGNED INTEGER '    '  How wide in pixels each bogie frame is
DIM BogieImageHeight AS _UNSIGNED INTEGER '   '  How high in pixels each bogie frame is
DIM BogieFramesPerSecond AS _UNSIGNED _BYTE ' '  How fast the bogie fading effect is

BogieFramesPerSecond = 20 '                                   '  How many frames to display in one second.
BogieDisplayTime = BogieNumOfFrames / BogieFramesPerSecond '  '  How long it takes for the bogie image to fade out.
BogieFrameTimeSlice = (BogieDisplayTime / BogieNumOfFrames) ' '  How long each frame of the bogie fading out animation is displayed

BogieImageWidth = 30 '               '  Overall width of the bogie frame.
BogieImageHeight = BogieImageWidth ' '  Overall height of the bogie frame.

DIM SHARED MainWindow AS LONG ' '  The image that holds the main screen (window)
DIM Background AS LONG '        '  The image that the radar is created in
DIM TempImage AS LONG '         '  A temporary image for procedural image creation
DIM TempImage2 AS LONG '        '  A second temporary image for procedural image creation
DIM RadarHandImage AS LONG '    '  The image to store the radar hand in (the rotating hand - like a clock hand)

DIM SHARED WindowWidth AS _UNSIGNED INTEGER '  '  The width of the main window (screen)
DIM SHARED WindowHeight AS _UNSIGNED INTEGER ' '  The height of the main window (screen)

DIM SHARED Degree AS SINGLE ' '  One degree of a circle
Degree = 3.141592653 / 180 '  '  Define the degree

DIM BogieNumOfSlices AS _UNSIGNED INTEGER ' '  Used to draw the three arcs in the bogie image
DIM MaximumDiameter AS _FLOAT '             '  Used to draw the three arcs in the bogie image
DIM SliceDiameterDistance AS _FLOAT '       '  Used to draw the three arcs in the bogie image

BogieNumOfSlices = 6
MaximumDiameter = _PI * 2
SliceDiameterDistance = MaximumDiameter / BogieNumOfSlices

WindowWidth = _DESKTOPWIDTH - 50
WindowHeight = _DESKTOPHEIGHT - 100

MainWindow = _NEWIMAGE(WindowWidth, WindowHeight, 32)
Background = _NEWIMAGE(WindowWidth, WindowHeight, 32)

SCREEN MainWindow
_DELAY 0.1
_SCREENMOVE (_DESKTOPWIDTH / 2 - _WIDTH(_SOURCE) / 2) - 9, (_DESKTOPHEIGHT / 2 - _HEIGHT(_SOURCE) / 2) - 29
_TITLE "The Joyful Programmer's - Radar Display"

$CHECKING:OFF

_DISPLAYORDER _HARDWARE , _SOFTWARE

'  CREATE THE BOGIE SPRITESHEET

PRINT "CREATING THE BOGIES: ["; STRING$(BogieNumOfFrames, "."); ".]"; '  DISPLAY A CRUDE PROGRESS BAR FOR THE BOGIE CREATION PROCESS
LOCATE CSRLIN, POS(0) - 22 '                                          '  REPOSITION THE TEXT CURSOR TO THE FIRST POSITION OF THE PROGRESS BAR

_DISPLAY

'  CREATE A TEMPORARY IMAGE TO STORE THE BOGIE SPRITE SHEET IN
TempImage = _NEWIMAGE(BogieImageWidth * BogieNumOfFrames, BogieImageWidth, 32)

' CREATE A FADING SPRITE SHEET OF BOGIES
FOR BogieImageIndex = 1 TO BogieNumOfFrames

    '  SET THE DESTINATION IMAGE TO THE FIRST TEMP IMAGE
    _DEST TempImage

    '  SET THE COLOR OF THE OVERALL BOGIE IMAGE
    COLOR _RGBA32(64, 255, 64, 255)

    '  DRAW THE ARC'S AROUND THE BOGIE
    FOR Radius% = 1 TO 5 STEP 2 '  DO MULTIPLE LEVEL OF ARCS
        FOR Slices% = 0 TO BogieNumOfSlices STEP 2

            cx% = BogieImageWidth * BogieImageIndex - (BogieImageWidth / 2) - 1
            cy% = BogieImageHeight / 2 - 1
            CurrentRadius% = BogieImageWidth / 2 - Radius%
            StartSlice# = SliceDiameterDistance * Slices%
            EndSlice# = (SliceDiameterDistance * (Slices% + 1)) MOD (2 * _PI)

            CIRCLE (cx%, cy%), CurrentRadius%, , StartSlice#, EndSlice#

        NEXT
    NEXT

    '  DRAW THE BOGIE
    CIRCLE (BogieImageWidth * BogieImageIndex - (BogieImageWidth / 2) - 1, BogieImageHeight / 2 - 1), BogieImageWidth / 2 - 9
    PAINT (BogieImageWidth * BogieImageIndex - (BogieImageWidth / 2) - 1, BogieImageHeight / 2 - 1)
    _SETALPHA (255 / (BogieNumOfFrames + 1)) * BogieImageIndex, _RGBA32(64, 255, 64, 255)

    '  UPDATE THE BOGIE CREATION PROGRESS BAR
    _DEST 0
    PRINT "#";

NEXT

'  TRANSFER THE TEMPORARY BOGIE SPRITESHEET IMAGE TO A HARDWARE IMAGE & DELETE THE TEMP IMAGE
BogieImage = _COPYIMAGE(TempImage, 33)
_FREEIMAGE TempImage

'  DEFINE THE DATA FOR ALL BOGIES
FOR BogieIndex = 0 TO NumOfBogies - 1
    Bogies(BogieIndex).xc = BogieImageWidth / 2
    Bogies(BogieIndex).yc = BogieImageHeight / 2
    Bogies(BogieIndex).Angle = RND * 360
    Bogies(BogieIndex).Distance = RND * ((WindowHeight / 2 - 10) - BogieImageHeight * 2) + BogieImageHeight
    Bogies(BogieIndex).StaticDistance = Bogies(BogieIndex).Distance
    Bogies(BogieIndex).x = 0
    Bogies(BogieIndex).y = 0
    Bogies(BogieIndex).BeginTime = 0
    Bogies(BogieIndex).SpeedMPH = (RND * 2.5) * SpeedOfSoundMPH + SpeedOfSoundMPH
NEXT

'  UPDATE THE BOGIE CREATION PROGRESS BAR
PRINT "#";
PRINT

PRINT

PRINT "CREATING THE RADAR IMAGE: ["; STRING$((WindowHeight / 2 - 10) / 10 + 1, "."); "]"; '  CREATE A CRUDE PROGRESS BAR FOR THE RADAR CREATION PROCESS
LOCATE CSRLIN, POS(0) - ((WindowHeight / 2 - 10) / 10) - 2 '                              '  REPOSITION THE TEXT CURSOR TO THE BEGINNING OF THE PROGRESS BAR
_DISPLAY

'  CREATE A TEMPORARY IMAGE TO HOLD THE RADAR GRAPHICS
TempImage2 = _NEWIMAGE(WindowWidth, WindowHeight, 32)

'  SET THE DRAWING DESTINATION TO THE TEMPORARY IMAGE
_DEST TempImage2

'  DEFINE THE COLOR USED IN THE CENTER GRADIENT OF THE RADAR BODY
TempColor& = _RGB32(0, 200, 0)

RadarSize = WindowHeight / 2 - 10 '                         '  DEFINE HOW BIG THE RADAR WILL BE. THE RADAR IS PROCEDURALY CREATED TO THE SIZE OF THE MAIN WINDOW
RadarRingDistance = RadarSize / RadarScanDistanceInMiles '  '  DEFINE HOW FAR APART THE ONE-MILE MARKER RINGS ARE

TempImage = _NEWIMAGE(WindowWidth, WindowHeight, 32)

'  CREATE THE RADAR IMAGE. HAVE TO DO THIS THE LONG WAY AROUND SINCE QB64 DOES NOT HAVE GRADIENTS.
FOR Radius# = RadarSize TO 0 STEP -10

    '  SET THE DESTINATION IMAGE TO THE TEMP IMAGE
    _DEST TempImage

    CLS '                            '  CLEAR THE TEMP IMAGE TO CREATE THE NEXT PART OF THE RADAR
    _SETALPHA 0, _RGB32(0, 0, 0) '   '  SET THE ALPHA CHANNEL OF THE BLACK (CLEARING) COLOR TO 0 TO ALLOW FOR THIS PART TO BE OVERLAYED ON TO THE RADAR IMAGE

    '  DRAW THE NEXT FILLED CIRCLE THAT MAKES UP THE GRADIENT CIRCLE OF THE RADAR'S BODY
    CIRCLE (_WIDTH(Background) / 2 - 1, _HEIGHT(Background) / 2 - 1), Radius#, TempColor&
    PAINT (_WIDTH(Background) / 2 - 1, _HEIGHT(Background) / 2 - 1), TempColor&, TempColor&

    '  SET THE ALPHA CHANNEL OF THE FILLED CIRCLE TO A LOW VALUE. WHEN IT IS OVERLAID ON THE RADAR IMAGE, THE EFFECT IS CUMMULATIVE
    _SETALPHA 8, TempColor&

    '  DRAW A RING AROUND THE NEW FILLED CIRCLE. THIS ADDS EXTRA AESTHETICS TO THE RADAR IMAGE
    CIRCLE (_WIDTH(Background) / 2 - 1, _HEIGHT(Background) / 2 - 1), Radius#, TempColor&
    _SETALPHA 50, TempColor&

    '  DRAW THIS NEW IMAGE TO THE RADAR IMAGE
    _PUTIMAGE (0, 0), TempImage, TempImage2

    '  UPDATE THE RADAR PROGRESS BAR
    _DEST MainWindow
    PRINT "#";
    _DISPLAY

NEXT

PRINT

'  SET THE IMAGE DESTINATION TO THE TEMPORARY RADAR IMAGE SO WE CAN FINISH THE RADAR.
_DEST TempImage2

'  CREATE THE RIM OF THE RADAR
FOR Radius# = 10 TO 4 STEP -0.25
    CIRCLE (_WIDTH(Background) / 2 - 1, _HEIGHT(Background) / 2 - 1), (WindowHeight / 2 - Radius#), _RGBA32(0, 128, 0, 191 - ((10 - Radius#) * 32))
NEXT


'  CREATE THE RADAR'S INNER RINGS. EACH RING WILL REPRESENT ONE MILE
FOR Radius# = RadarRingDistance TO RadarSize STEP RadarRingDistance
    FOR LineThickness# = -0.5 TO 0.5 STEP 0.25
        CIRCLE (_WIDTH(Background) / 2 - 1, _HEIGHT(Background) / 2 - 1), Radius# + LineThickness#, _RGBA32(0, 128, 0, 200)
    NEXT
NEXT

'  CREATE THE CROSS LINES IN THE RADAR
COLOR _RGBA32(0, 128, 0, 200)

FOR i = -1 TO 1
    LINE (_WIDTH(Background) / 2 + i, _HEIGHT(Background) / 2 - RadarSize)-(_WIDTH(Background) / 2 + i, _HEIGHT(Background) / 2 + RadarSize)
    LINE (_WIDTH(Background) / 2 - RadarSize, _HEIGHT(Background) / 2 + i)-(_WIDTH(Background) / 2 + RadarSize, _HEIGHT(Background) / 2 + i)
NEXT

'  COPY YHE RADAR IMAGE TO A HARDWARE IMAGE AND DELETE BOTH TEMPORARY IMAGES
Background = _COPYIMAGE(TempImage2, 33)
_FREEIMAGE TempImage
_FREEIMAGE TempImage2


cx% = WindowWidth / 2 - 1 '  '  DEFINE THE X-COORDINATE OF THE CENTER OF THE MAIN IMAGE
cy% = WindowHeight / 2 - 1 ' '  DEFINE THE Y-COORDINATE OF THE CENTER OF THE MAIN IMAGE

RadarHandX0% = cx% '       '  DEFINE THE RADAR'S HAND STARTING X-COORDINATE TO THE CENTER OF THE MAIN SCREEN WHICH SHOULD BE THE CENTER OF THE RADAR AS WELL
RadarHandY0% = cy% '       '  DEFINE THE RADAR'S HAND STARTING Y-COORDINATE TO THE CENTER OF THE MAIN SCREEN WHICH SHOULD BE THE CENTER OF THE RADAR AS WELL

RadarHandRadius# = WindowHeight / 2 - 10 ' '  DEFINE THE LENGTH OF THE RADAR HAND TO THE RADIUS OF THE RADAR
RadarAngle# = 0 '                          '  DEFINE THE STARTING ANGLE OF THE RADAR HAND

RadarBogieTolerance = 3 '  HOW FAR AWAY (IN DEGREES) FROM THE RADAR HAND DOES THE BOGIE NEED TO BE BEFORE IT IS DISPLAYED

TempImage = _NEWIMAGE(RadarSize, RadarSize, 32) '  CREATE THE TEMPORARY IMAGE TO HOLD THE RADAR HAND
TempImage2 = _NEWIMAGE(10, 10, 32) '            '  CREATE A SECOND TEMPORARY IMAGE THAT WILL HOLD A SINGLE COLOR BLOCK USED FOR DRAWING THE HAND
_DEST TempImage2 '                              '  SET THE DESTINATION IMAGE TO THE COLORED BLOCK

'  DEFINE THE TRIANGLE COORDINATES TO GRAB THE COLOR FROM
cxSource0% = 0
cySource0% = _HEIGHT(TempImage2) - 1
cxSource1% = _WIDTH(TempImage2) - 1
cySource1% = _HEIGHT(TempImage2) - 1
cxSource2% = _WIDTH(TempImage2) - 1
cySource2% = 0

cxDest0% = 0
cyDest0% = RadarSize

Alpha# = 100
StartAngle# = 90
EndAngle# = 35
AlphaStep# = -1
AlphaDecrement# = (Alpha# / (StartAngle# - EndAngle#)) / ABS(AlphaStep#)

COLOR _RGBA32(0, 200, 0, 220)
LINE (0, 0)-(_WIDTH(TempImage2) - 1, _HEIGHT(TempImage2) - 1), , BF

cxDest1% = RadarSize * SIN(Degree * StartAngle#)
cyDest1% = RadarSize - RadarSize * COS(Degree * StartAngle#)
cxDest2% = RadarSize * SIN(Degree * (StartAngle# - 1))
cyDest2% = RadarSize - RadarSize * COS(Degree * (StartAngle# - 1))

'  DRAW THE FIRST TRIANGLE PORTION OF THE FADING HAND, WHICH WILL BE BRIGHTER THEN THE REST
_MAPTRIANGLE _SEAMLESS(cxSource0%, cySource0%)-(cxSource1%, cySource1%)-(cxSource2%, cySource2%), TempImage2 TO(cxDest0%, cyDest0%)-(cxDest1%, cyDest1%)-(cxDest2%, cyDest2%), TempImage, _SMOOTH

'  DRAW THE FADING PART OF THE RADAR HAND
FOR Angle# = StartAngle# TO EndAngle# STEP AlphaStep#

    CLS
    _SETALPHA 0, _RGB32(0, 0, 0)

    COLOR _RGBA32(0, 200, 0, Alpha#)
    LINE (0, 0)-(_WIDTH(TempImage2) - 1, _HEIGHT(TempImage2) - 1), , BF

    cxDest1% = RadarSize * SIN(Degree * Angle#)
    cyDest1% = RadarSize - RadarSize * COS(Degree * Angle#)
    cxDest2% = RadarSize * SIN(Degree * (Angle# - 4))
    cyDest2% = RadarSize - RadarSize * COS(Degree * (Angle# - 4))

    _MAPTRIANGLE _SEAMLESS(cxSource0%, cySource0%)-(cxSource1%, cySource1%)-(cxSource2%, cySource2%), TempImage2 TO(cxDest0%, cyDest0%)-(cxDest1%, cyDest1%)-(cxDest2%, cyDest2%), TempImage, _SMOOTH

    Alpha# = Alpha# - AlphaDecrement#

NEXT

'  COPY THE RADAR HAND IMAGE TO A HARDWARE IMAGE AND THEN DELETE THE TWO USED TEMPORARY IMAGES
RadarHandImage = _COPYIMAGE(TempImage, 33)
_FREEIMAGE TempImage
_FREEIMAGE TempImage2

'  SET THE DESTINATION IMAGE TO THE MAIN WINDOW IMAGE
_DEST MainWindow

DO

    '  DEFINE HOW MANY FRAMES PER SECOND THE ANIMATION IS
    _LIMIT 60

    HandAlpha# = HandAlphaStart#

    CLS
    _SETALPHA 0, _RGB32(0, 0, 0)
    _SETALPHA 255, _RGB32(0, 0, 0)

    _PUTIMAGE (0, 0), Background

    '  DRAW ALL THE BOGIES
    COLOR _RGB32(255, 255, 255)

    FOR i = 0 TO NumOfBogies - 1

        '  SEE IF THE CURRENT BOGIE IS ACTIVE
        IF Bogies(i).BeginTime > 0 THEN

            '  THE BOGIE IS ACTIVE SO DEFINE ITS LOCATION
            x% = cx% - Bogies(i).StaticDistance * SIN(Degree * Bogies(i).Angle) - Bogies(i).xc
            y% = cy% + Bogies(i).StaticDistance * COS(Degree * Bogies(i).Angle) - Bogies(i).yc

            ' UNCOMMENT THE LINES BELOW TO SEE THE FADING BOGIES MOVE
            'x% = cx% - Bogies(i).Radius * SIN(Degree * Bogies(i).Angle) - Bogies(i).xc
            'y% = cy% + Bogies(i).Radius * COS(Degree * Bogies(i).Angle) - Bogies(i).yc

            '  CHECK TO SEE IF THE CURRENT BOGIE DISPLAY TIME IS WITHIN THE ALLOTED TIME FRAME
            IF TIMER(.001) <= (Bogies(i).BeginTime + BogieDisplayTime) THEN

                '  IT IS SO FIGURE OUT WHICH FRAME TO DRAW
                Frame% = ((Bogies(i).BeginTime + BogieDisplayTime) - TIMER(.001)) / BogieFrameTimeSlice

                '  DRAW THE BOGIE
                _PUTIMAGE (x%, y%), BogieImage, 0, (BogieImageWidth * Frame%, 0)-(BogieImageWidth * Frame% + BogieImageWidth - 1, BogieImageHeight)

            ELSE

                '  THE BOGIE'S DISPLAYED TIME IS UP SO DEACTIVATE THE DRAWING TIME
                Bogies(i).BeginTime = 0

            END IF

        ELSE

            ' THE CURRENT BOGIE IS NOT ACTIVE

            '  CHECK TO SEE IF THE RADAR HAND IS NEAR ENOUGH TO THE BOGIE
            IF ABS(RadarAngle# - Bogies(i).Angle) <= RadarBogieTolerance THEN

                '  THE HAND IS NEAR THE BOGIE SO ACTIVATE THE BOGIE

                '  GET THE EXACT TIME THE BOGIE IS ACTIVATED
                Bogies(i).BeginTime = TIMER(0.001)

                '  STORE THE CURRENT DISTANCE OF THE BOGIE SO THE USER DOES NOT SEE THE FADING BOGIE MOVING
                Bogies(i).StaticDistance = Bogies(i).Distance

                '  CALCULATE THE BOGIES COORDINATES
                x% = cx% - Bogies(i).StaticDistance * SIN(Degree * Bogies(i).Angle) - Bogies(i).xc
                y% = cy% + Bogies(i).StaticDistance * COS(Degree * Bogies(i).Angle) - Bogies(i).yc

                '  DRAW THE FIRST BOGIE FRAME
                _PUTIMAGE (x%, y%), BogieImage, 0, ((_WIDTH(BogieImage) / BogieNumOfFrames) * (BogieNumOfFrames - 1), 0)-((_WIDTH(BogieImage) / BogieNumOfFrames) * BogieNumOfFrames, _HEIGHT(BogieImage) - 1)

            END IF

        END IF

        '  MOVE THE CURRENT BOGIE CLOSER TO THE CENTER OF THE RADAR. ONCE THERE, MOVE IT TO THE EDGE OF THE RADAR.
        Bogies(i).Distance = Bogies(i).Distance - (((Bogies(i).SpeedMPH / RadarScanDistanceInMiles) / MinutesPerHour) / SecondsPerMinute)
        IF Bogies(i).Distance <= 0 THEN Bogies(i).Distance = WindowHeight / 2 - 10

    NEXT

    '  DISPLAY THE RADAR HAND ON TOP OF THE RADAR AND BOGIE'S
    DisplayImage RadarHandImage, _WIDTH(MainWindow) / 2 - 1, _HEIGHT(MainWindow) / 2 - 1, -RadarAngle#, 2

    '  UPDATE THE ROTATION OF THE RADAR HAND BASED ON THE TIMER
    RadarAngle# = (TIMER(.001) * (60 * 3)) MOD 360

    '  SHOW THE NEW RENDERING TO THE USER
    _DISPLAY

    $CHECKING:ON

    '  CHECK TO SEE IF THE ESC WAS PRESSED, AND IF SO, EXIT THE APP
    keys& = _KEYHIT
    IF keys& = 27 THEN SYSTEM

LOOP





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

w = _WIDTH(Image)
h = _HEIGHT(Image)

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

sinr = SIN((angle - 90) * Degree) '/ 57.2957795131)
cosr = COS((angle - 90) * Degree) '/ 57.2957795131)

FOR i = 0 TO 3
    x2 = (px(i) * cosr + sinr * py(i)) + x
    y2 = (py(i) * cosr - px(i) * sinr) + y
    px(i) = x2
    py(i) = y2
NEXT

_MAPTRIANGLE (0, 0)-(0, h - 1)-(w - 1, h - 1), Image TO(px(0), py(0))-(px(1), py(1))-(px(2), py(2)), 0, _SMOOTH
_MAPTRIANGLE (0, 0)-(w - 1, 0)-(w - 1, h - 1), Image TO(px(0), py(0))-(px(3), py(3))-(px(2), py(2)), 0, _SMOOTH

END SUB

