' #############################################################################
' #                                                                           #
' #  UFO in space with a tail that fades out.                                 #
' #                                                                           #
' #  Created By:  Walter Whitman                                              #
' #               a.k.a. Waltersmind and The Joyful Programmer                #
' #                                                                           #
' #  Date:  11/13/2016                                                        #
' #                                                                           #
' #  This demo on uses software rending to accomplish the animation.          #
' #                                                                           #
' #############################################################################

CONST Radian = 3.141592654 / 180


TYPE UFOS
    x AS INTEGER
    y AS INTEGER
    'image AS LONG
    imageAlpha AS _UNSIGNED _BYTE
END TYPE


REDIM SHARED UFO(-1) AS UFOS

DIM WindowWidth AS _UNSIGNED INTEGER
DIM WindowHeight AS _UNSIGNED INTEGER
DIM WindowTopLeftX AS _UNSIGNED INTEGER
DIM WindowTopLeftY AS _UNSIGNED INTEGER

DIM NumOfUFOs AS _UNSIGNED _BYTE
DIM UFOimage AS LONG

DIM MainWindow AS LONG
DIM SHARED BackgroundImage AS LONG
DIM SHARED FastSin(360) AS DOUBLE
DIM SHARED FastCos(360) AS DOUBLE
DIM SteppingSpeed AS _UNSIGNED _BYTE

DesktopImage& = _SCREENIMAGE

WindowWidth = _WIDTH(DesktopImage&) - 50
WindowHeight = _HEIGHT(DesktopImage&) - 100
WindowTopLeftX = (_WIDTH(DesktopImage&) - WindowWidth) / 2 - 3
WindowTopLeftY = (_HEIGHT(DesktopImage&) - WindowHeight) / 2 - 29


MainWindow = _NEWIMAGE(WindowWidth, WindowHeight, 32)


'  TRY 3 HERE TO GET A LITTLE MORE REALISTIC LOOK
NumOfUFOs = 15


'  AN OLD HACK TO REMOVE CONSTANT CALCULATIONS OF COMMON SIN & COS VALUES.
'  WE DO NOT NEED A HIGH-RESOLUTION COS/SIN TABLE HERE.
FOR Angle = 0 TO 359
    FastSin(Angle) = SIN(Angle * Radian)
    FastCos(Angle) = COS(Angle * Radian)
NEXT

'  THIS VALUE TELL THE APP HOW MANY TIMES TO CALCULATE THE NEXT (X,Y) COORDINATES. THIS ALLOWS THE
'  UFO IMAGE TO APPEAR TO SPEED UP A BIT. I COULD OF USE SOME MATH INSTEAD OF A LOOP, BUT I WAS IN
'  A HURRY TO GET THIS POSTED.
SteppingSpeed = 4


SCREEN MainWindow
_DELAY 1
_SCREENMOVE WindowTopLeftX, WindowTopLeftY

_TITLE "UFO In Space with Fading Tail - By: Waltersmind @ TheJoyfulProgrammer.com"

REDIM UFO(NumOfUFOs - 1) AS UFOS


'  Background image is courtesy of NASA.gov.
'  Image URL: http://www.nasa.gov/image-feature/goddard/2016/hubble-peers-into-the-storm
PRINT "LOADING BACKGROUND IMAGE... ";
BackgroundImage = _LOADIMAGE("Background_01.jpg", 32)
PRINT "DONE..."


'  UFO image was created by Waltersmind for The Joyful Programmer
'  IN THIS DEMO, WE WILL LOAD THE UFO IMAGE INTO THE FIRST UFO INDEX AND JUST COPY IT TO THE OTHERS.
'  THIS WILL KEEP US FROM LOADING IT AND THEN FREEING IT AFTER IT IS PUT IN THE OTHER UFO ARRAY INDEXES.
PRINT "LOADING UFO IMAGE... ";
UFOimage = _LOADIMAGE("UFO-157x87.png", 32)
PRINT "DONE..."


'  THIS DEMO USES THE BOWDITCH / LISSAJOUS CURVE
PendulumVerticalAngle = 0
PendulumHorizontalAngle = 0


'  DEFINE THE DATA FOR THE FIRST UFO.
PRINT "CREATING DATA FOR UFO #"; LTRIM$(STR$(i)); "... ";
UFO(0).x = WindowWidth / 2 + WindowWidth * SIN(PendulumHorizontalAngle * Radian) * COS(PendulumHorizontalAngle * Radian)
UFO(0).y = WindowHeight / 2 + (WindowHeight - 100) * SIN(PendulumVerticalAngle * Radian)
UFO(0).imageAlpha = (255 / (UBOUND(UFO) + 2)) * 2
PRINT "DONE..."


'  DEFINE THE DATA FOR ALL THE REST OF THE UFO'S. ALL WE NEED TO DO IS COPY THE (X,Y) COORDINATES AND THE IMAGE
'  USED IN THE FIRST UFO INDEX.
PRINT "SETTING UP UFO DATA... "
FOR i = 1 TO UBOUND(UFO)
    PRINT "CREATING DATA FOR UFO #"; LTRIM$(STR$(i)); "... ";
    UFO(i).x = UFO(i - 1).x 'WindowWidth / 2 + WindowWidth * SIN(PendulumHorizontalAngle * Radian) * COS(PendulumHorizontalAngle * Radian)
    UFO(i).y = UFO(i - 1).y 'WindowHeight / 2 + (WindowHeight - 100) * SIN(PendulumVerticalAngle * Radian)
    UFO(i).imageAlpha = (255 / (UBOUND(UFO) + 2)) * (i + 2)
    PRINT "DONE..."
NEXT



DO

    _LIMIT 15


    '  TURN OFF ALL ERROR CHECKING AND EVENTS (tell QB64 not to add such code to final executable)
    $CHECKING:OFF


    '  DRAW THE BACKGROUND IMAGE
    _PUTIMAGE (0, 0)-(WindowWidth - 1, WindowHeight - 1), BackgroundImage, 0, (0, 0)-(_WIDTH(BackgroundImage) - 1, _HEIGHT(BackgroundImage) - 1)


    '  DRAW ALL UFO'S
    FOR i = 0 TO UBOUND(UFO)
        _SETALPHA UFO(i).imageAlpha, _RGBA32(0, 0, 0, 1) TO _RGBA32(255, 255, 255, 255), UFOimage
        _PUTIMAGE (UFO(i).x - (_WIDTH(UFOimage) / 2), UFO(i).y - (_HEIGHT(UFOimage) / 2)), UFOimage, 0
    NEXT


    '  SINCE EACH UFO UP TO THE ONE BEFORE THE LAST JUST TAKES THE NEXT UFO (X,Y) COORDINATES,
    '  ALL WE NEED TO COPY THE NEXT ONE TO THE CURRENT ONE.
    FOR i = 0 TO UBOUND(UFO) - 1
        UFO(i).x = UFO(i + 1).x
        UFO(i).y = UFO(i + 1).y
    NEXT


    '  CALCULATE THE LAST UFO WITH ALL NEW (X,Y) COORDINATES
    UFO(UBOUND(UFO)).x = WindowWidth / 2 + WindowWidth * SIN(PendulumHorizontalAngle * Radian) * COS(PendulumHorizontalAngle * Radian)
    UFO(UBOUND(UFO)).y = WindowHeight / 2 + (WindowHeight / 2) * SIN(PendulumVerticalAngle * Radian)


    '  A HACK TO SKIP SO MANY STEPS IN OUR ANIMATION. IT HELPS SHOW THE TAIL BETTER
    FOR i = 1 TO SteppingSpeed
        PendulumHorizontalAngle = 1.000013 * PendulumHorizontalAngle + 1.01 '1.0000001# *
        PendulumVerticalAngle = PendulumVerticalAngle + 1
    NEXT


    '  TURN ERROR CHECKING AND EVENTS BACK ON SINCE WE NEED THEM NOW
    $CHECKING:ON


    _DISPLAY


    '  READ THE KEYBOARD TO SEE IF ANY KEY HAS BEEN PRESSED
    k = _KEYHIT


    '  IF THE <ESC> KEY IS PRESSED THEN CLOSED THE PROJECT
    IF k = 27 THEN

        '  FREE BACKGROUND IMAGE
        _FREEIMAGE (BackgroundImage)

        '  FREE ALL UFO IMAGES USED
        _FREEIMAGE (UFOimage)

        '  EXIT PROJECT TO SYSTEM
        SYSTEM

    END IF

LOOP

