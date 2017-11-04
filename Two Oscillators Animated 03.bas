'******************************************************************************
'*                                                                            *
'*  MrWhy's: Coupled Conical Pendulums                                        *
'*                                                                            *
'*  Using the Ideas of Waltersmind       Date: 12-20-11                       *
'*  Modified By Waltersmind              Date: 12-24-11                       *
'*                                                                            *
'******************************************************************************

DEFDBL A-Z

CONST FALSE = 0
CONST TRUE = 1
CONST Radian = 3.141592654 / 180

DIM RotAngle1 AS SINGLE
DIM RotAngle2 AS SINGLE
DIM UpdateTimer AS DOUBLE

RotAngle1 = 0
RotAngle2 = 90

'*** User Defined Application Windowed size
AppWindowWidth& = 900
AppWindowHeight& = 700

'*** Set frames per second. This allows the app to refresh the visual page at timed intervals.
FramesPerSecond = 1 / 60

BoxSize = 20

LineBoxSize1 = 1
LineBoxSize2 = 1
LineBoxMaxSize1 = 7
LineBoxMaxSize2 = 7
LineBoxSizeAngle1 = 0
LineBoxSizeAngle2 = 180

scaleX = AppWindowWidth&
scaleY = AppWindowHeight&

BackBufferMarginSize = 400
BackBufferSingleMarginSize = BackBufferMarginSize / 2

ChangeColorDelay = 500
ChangeColorMoment = 0

'*** Setup colors
RedStart1 = RND(1) * 256: GreenStart1 = RND(1) * 256: BlueStart1 = RND(1) * 256
RedStart2 = RND(1) * 256: GreenStart2 = RND(1) * 256: BlueStart2 = RND(1) * 256

RedEnd1 = RND(1) * 256: GreenEnd1 = RND(1) * 256: BlueEnd1 = RND(1) * 256
RedEnd2 = RND(1) * 256: GreenEnd2 = RND(1) * 256: BlueEnd2 = RND(1) * 256

redInc1 = -(RedStart1 - RedEnd1) / ChangeColorDelay
redInc2 = -(RedStart2 - RedEnd2) / ChangeColorDelay

greenInc1 = -(GreenStart1 - GreenEnd1) / ChangeColorDelay
greenInc2 = -(GreenStart2 - GreenEnd2) / ChangeColorDelay

blueInc1 = -(BlueStart1 - BlueEnd1) / ChangeColorDelay
blueInc2 = -(BlueStart2 - BlueEnd2) / ChangeColorDelay

'*** Create a IMAGE for the Application's window and set it to 32-Bit
AppWinScreenHandle& = _NEWIMAGE(AppWindowWidth&, AppWindowHeight&, 32)
BackBuffer_1& = _NEWIMAGE(AppWindowWidth& + BackBufferMarginSize, AppWindowHeight& + BackBufferMarginSize, 32)
BackBuffer_2& = _NEWIMAGE(AppWindowWidth& + BackBufferMarginSize, AppWindowHeight& + BackBufferMarginSize, 32)
BackBuffer_3& = _NEWIMAGE(AppWindowWidth& + BackBufferMarginSize, AppWindowHeight& + BackBufferMarginSize, 32)

_CLEARCOLOR _RGB(0, 0, 0), BackBuffer_1&
_CLEARCOLOR _RGB(0, 0, 0), BackBuffer_2&
_CLEARCOLOR _RGB(0, 0, 0), BackBuffer_3&

'*** Create Application Window
SCREEN AppWinScreenHandle&
_SCREENMOVE _MIDDLE

_DEST BackBuffer_2&


'******************************************************************************
'*                                                                            *
'*  Time to make MrWhy's graphics                                             *
'*                                                                            *
'******************************************************************************

dt = .0005
cd = .0 '2
col = 1
x1o = cd: y1o = 0
x2o = -cd: y2o = 0
x3o = -cd: y3o = cd
x4o = -cd: y4o = -cd
x5o = 0: y5o = cd
x6o = 0: y6o = -cd
x1 = x1o: x2 = x2o: x3 = x3o: x4 = x4o
y1 = y1o: y2 = y2o: y3 = y3o: y4 = y4o
x5 = x5o: x6 = x6o
y5 = y5o: y6 = y6o
x1 = x1 + .2: '***** try .04
x2 = x2 - .3
'x3 = x3 - .2
'x4 = x4 - .1
v1y = .0008
v2y = -.0005 '************************try -.00003
'v3y = .000023
'v4y = .000023
'v1x = .00012 '***** try rem out this line
m1 = 2: m2 = 7.8 ': m3 = 1.02: m4 = 1.03: m5 = 1.04: m6 = 1.05
nsq = .0000125 '****try 00000012,11, 09,08 etc
n1sq = nsq: n2sq = nsq: n3sq = nsq: n4sq = nsq: n5sq = nsq: n6sq = nsq
n = nsq / 2
n12sq = n: n13sq = n: n14sq = n: n15sq = n: n16sq = n
n23sq = n: n24 = n: n25sq = n: n26sq = n
n34sq = n: n35 = n: n36sq = n
n45sq = n: n46sq = n
n56sq = n

UpdateTimer = TIMER(0.001) + FramesPerSecond

DO

    accn1x = -n1sq * (x1 - x1o) - n12sq * ((x1 - x2) - (x1o - x2o)) ' - n13sq * ((x1 - x3) - (x1o - x3o))
    accn1y = -n1sq * (y1 - y1o) - n12sq * ((y1 - y2) - (y1o - y2o)) ' - n13sq * ((y1 - y3) - (y1o - y3o))

    v1x = v1x + accn1x / m1
    v1y = v1y + accn1y / m1

    accn2x = -n2sq * (x2 - x2o) - n12sq * ((x2 - x1) - (x2o - x1o)) ' - n23sq * ((x2 - x3) - (x2o - x3o))
    accn2y = -n2sq * (y2 - y2o) - n12sq * ((y2 - y1) - (y2o - y1o)) ' - n23sq * ((y2 - y3) - (y2o - y3o))
    v2x = v2x + accn2x / m2
    v2y = v2y + accn2y / m2

    accn3x = -n3sq * (x3 - x3o) - n23sq * ((x3 - x2) - (x3o - x2o)) - n13sq * ((x3 - x1) - (x3o - x1o))
    accn3x = accn3x - n34sq * ((x3 - x4) - (x3o - x4o)) - n35sq * ((x3 - x5) - (x3o - x5o)) - n36sq * ((x3 - x6) - (x3o - x6o))
    accn3y = -n3sq * (y3 - y3o) - n23sq * ((y3 - y2) - (y3o - y2o)) - n13sq * ((y3 - y1) - (y3o - y1o))
    accn3y = accn3y - n34sq * ((y3 - y4) - (y3o - y4o)) - n35sq * ((y3 - y5) - (y3o - y5o)) - n36sq * ((y3 - y6) - (y3o - y6o))
    v3x = v3x + accn3x / m3
    v3y = v3y + accn3y / m3

    accn4x = -n4sq * (x4 - x4o) - n24sq * ((x4 - x2) - (x4o - x2o)) - n34sq * ((x4 - x3) - (x4o - x3o))
    accn4x = accn4x - n14sq * ((x4 - x1) - (x4o - x1o)) - n45sq * ((x4 - x5) - (x4o - x5o)) - n46sq * ((x4 - x6) - (x4o - x6o))
    accn4y = -n4sq * (y4 - y4o) - n24sq * ((y4 - y2) - (y4o - y2o)) - n34sq * ((y4 - y3) - (y4o - y3o))
    accn4y = accn4y - n14sq * ((y4 - y1) - (y4o - y1o)) - n45sq * ((y4 - y5) - (y4o - y5o)) - n46sq * ((y4 - y6) - (y4o - y6o))

    v4x = v4x + accn4x / m4
    v4y = v4y + accn4y / m4

    accn5x = -n5sq * (x5 - x5o) - n25sq * ((x5 - x2) - (x5o - x2o)) - n35sq * ((x5 - x3) - (x5o - x3o))
    accn5x = accn5x - n15sq * ((x5 - x1) - (x5o - x1o)) - n45sq * ((x5 - x4) - (x5o - x4o)) - n46sq * ((x6 - x4) - (x6o - x4o))
    accn5y = -n5sq * (y5 - y5o) - n24sq * ((y5 - y2) - (y5o - y2o)) - n35sq * ((y5 - y3) - (y5o - y3o))
    accn5y = accn5y - n15sq * ((y5 - y1) - (y5o - y1o)) - n45sq * ((y5 - y4) - (y5o - y4o)) - n56sq * ((y5 - y6) - (y5o - y6o))
    v5x = v5x + accn5x / m5
    v5y = v5y + accn5y / m5

    accn6x = -n6sq * (x6 - x6o) - n26sq * ((x6 - x2) - (x6o - x2o)) - n36sq * ((x6 - x3) - (x6o - x3o))
    accn6x = accn6x - n16sq * ((x6 - x1) - (x6o - x1o)) - n46sq * ((x6 - x4) - (x6o - x4o)) - n56sq * ((x6 - x5) - (x6o - x5o))
    accn6y = -n6sq * (y6 - y6o) - n26sq * ((y6 - y2) - (y6o - y2o)) - n36sq * ((y6 - y3) - (y6o - y3o))
    accn6y = accn6y - n16sq * ((y6 - y1) - (y6o - y1o)) - n46sq * ((y6 - y4) - (y6o - y4o)) - n56sq * ((y6 - y5) - (y6o - y5o))
    v6x = v6x + accn6x / m6
    v6y = v6y + accn6y / m6

    x1 = x1 + v1x: y1 = y1 + v1y
    x2 = x2 + v2x: y2 = y2 + v2y
    x3 = x3 + v3x: y3 = y3 + v3y
    x4 = x4 + v4x: y4 = y4 + v4y
    x5 = x5 + v5x: y5 = y5 + v5y
    x6 = x6 + v6x: y6 = y6 + v6y

    cx1 = x1 * AppWindowWidth& + AppWindowWidth& / 2
    cy1 = y1 * AppWindowHeight& + AppWindowHeight& / 2
    cx2 = x2 * AppWindowWidth& + AppWindowWidth& / 2
    cy2 = y2 * AppWindowHeight& + AppWindowHeight& / 2

    LineBoxSize1 = RND(1) * BoxSize * SIN(LineBoxAngle1 * Radian) '* COS(LineBoxAngle1 * Radian)
    LineBoxSize2 = RND(1) * BoxSize * SIN(LineBoxAngle2 * Radian) '* COS(LineBoxAngle2 * Radian)

    LineBoxAngle1 = RND(1) * 360
    LineBoxAngle2 = RND(1) * 360

    _DEST BackBuffer_2&
    SpraySplatter cx1, cy1, BoxSize, _RGB32(RedStart1 + redInc1 * ChangeColorMoment, GreenStart1 + greenInc1 * ChangeColorMoment, BlueStart1 + blueInc1 * ChangeColorMoment)

    _DEST BackBuffer_3&
    SpraySplatter cx2, cy2, BoxSize, _RGB32(RedStart2 + redInc2 * ChangeColorMoment, GreenStart2 + greenInc2 * ChangeColorMoment, BlueStart2 + blueInc2 * ChangeColorMoment)

    ChangeColorMoment = (ChangeColorMoment + 1) MOD ChangeColorDelay

    IF ChangeColorMoment = 0 THEN

        '*** Setup colors
        RedStart1 = RedEnd1: GreenStart1 = GreenEnd1: BlueStart1 = BlueEnd1
        RedStart2 = RedEnd2: GreenStart2 = GreenEnd2: BlueStart2 = BlueEnd2

        RedEnd1 = RND(1) * 256: GreenEnd1 = RND(1) * 256: BlueEnd1 = RND(1) * 256
        RedEnd2 = RND(1) * 256: GreenEnd2 = RND(1) * 256: BlueEnd2 = RND(1) * 256

        redInc1 = -(RedStart1 - RedEnd1) / ChangeColorDelay
        redInc2 = -(RedStart2 - RedEnd2) / ChangeColorDelay

        greenInc1 = -(GreenStart1 - GreenEnd1) / ChangeColorDelay
        greenInc2 = -(GreenStart2 - GreenEnd2) / ChangeColorDelay

        blueInc1 = -(BlueStart1 - BlueEnd1) / ChangeColorDelay
        blueInc2 = -(BlueStart2 - BlueEnd2) / ChangeColorDelay

    END IF

    IF TIMER(0.001) > UpdateTimer THEN


        RotAng1 = RotAngle1 * Radian
        RotAng2 = RotAngle2 * Radian

        PicOffsetX1 = BackBufferSingleMarginSize * SIN(RotAng1)
        PicOffsetY1 = BackBufferSingleMarginSize * COS(RotAng1)
        PicOffsetX2 = BackBufferSingleMarginSize * SIN(RotAng2)
        PicOffsetY2 = BackBufferSingleMarginSize * COS(RotAng2)

        RotAngle1 = (RotAngle1 + 2) MOD 360
        RotAngle2 = (RotAngle2 + 2) MOD 360

        _DEST AppWinScreenHandle&

        '*** Clear Screen by putting a black box on it. Seems faster than CLS.
        LINE (0, 0)-(AppWindowWidth& + BackBufferMarginSize, AppWindowWidth& + BackBufferMarginSize), _RGB32(0, 0, 0), BF

        _PUTIMAGE (PicOffsetX1 + 1, PicOffsetY1 + 1)-(AppWindowWidth& + BackBufferMarginSize, AppWindowHeight& + BackBufferMarginSize), BackBuffer_2&, AppWinScreenHandle&
        _PUTIMAGE (PicOffsetX2 + 1, PicOffsetY2 + 1)-(AppWindowWidth& + BackBufferMarginSize, AppWindowHeight& + BackBufferMarginSize), BackBuffer_3&, AppWinScreenHandle&

        UpdateTimer = TIMER(0.001) + FramesPerSecond

        _DISPLAY

    END IF

    k$ = INKEY$: IF k$ <> "" THEN SYSTEM

LOOP


SUB SpraySplatter (XCenterLocation, YCenterLocation, SplatterSize, SplatterColor)

    NumOfSplatterPoints = RND(1) * 100

    FOR SplatterPoints = 1 TO NumOfSplatterPoints

        SplatterRadius = RND(1) * SplatterSize
        SplatterPointAngle = RND(1) * 360

        NewXLoc = XCenterLocation + SplatterRadius * SIN(Radian * SplatterPointAngle)
        NewYLoc = YCenterLocation - SplatterRadius * COS(Radian * SplatterPointAngle)

        PSET (NewXLoc, NewYLoc), SplatterColor

    NEXT


END SUB








