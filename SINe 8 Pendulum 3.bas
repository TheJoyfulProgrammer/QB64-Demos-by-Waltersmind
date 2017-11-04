'******************************************************************************
'*                                                                            *
'*  MrWhy's: Coupled Conical Pendulums                                        *
'*                                                                            *
'*  Using the Ideas of Waltersmind       Date: 12-20-11                       *
'*  Modified By Waltersmind              Date: 12-24-11                       *
'*                                                                            *
'******************************************************************************

DEFDBL A-Z
false = 0
true = 1

CONST Radian = 3.141592654 / 180

'*** User Defined Application Windowed size
AppWindowWidth& = 900
AppWindowHeight& = 700

AppWindowWD2& = AppWindowWidth& / 2
AppWindowHD2& = AppWindowHeight& / 2

ChangeColorDelay = 50
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

'*** Create Application Window
SCREEN AppWinScreenHandle&
_SCREENMOVE _MIDDLE

PendulumAtRestCenterX = AppWindowWD2&
PendulumAtRestCenterY = AppWindowHD2&

PendulumBallSize = 50
PendulumVerticalHeight = AppWindowHD2& - PendulumBallSize - 5
PendulumHorizontalWidth = 300

PendulumVerticalAngle = 0
PendulumHorizontalAngle = 0

PendulumVerticalAngle2 = 0
PendulumHorizontalAngle2 = 0

DO
    PendulumXLoc = PendulumAtRestCenterX + PendulumHorizontalWidth * SIN(PendulumHorizontalAngle * Radian) * COS(PendulumHorizontalAngle * Radian)
    PendulumYLoc = PendulumAtRestCenterY + PendulumVerticalHeight * SIN(PendulumVerticalAngle * Radian)

    PendulumXLoc2 = PendulumAtRestCenterX + PendulumHorizontalWidth * SIN((PendulumHorizontalAngle + 270) * Radian) * COS((PendulumHorizontalAngle + 270) * Radian)
    PendulumYLoc2 = PendulumAtRestCenterY + PendulumVerticalHeight * SIN((PendulumVerticalAngle2 + 270) * Radian)

    SpraySplatter PendulumXLoc, PendulumYLoc, PendulumBallSize, _RGB32(RedStart1 + redInc1 * ChangeColorMoment, GreenStart1 + greenInc1 * ChangeColorMoment, BlueStart1 + blueInc1 * ChangeColorMoment), 3000, 50
    SpraySplatter PendulumXLoc2, PendulumYLoc2, PendulumBallSize, _RGB32(0, 0, 0), 8000, 0

    PendulumHorizontalAngle = (PendulumHorizontalAngle + 1) MOD 180
    PendulumVerticalAngle = (PendulumVerticalAngle + 1) MOD 360

    PendulumHorizontalAngle2 = PendulumHorizontalAngle2 + 1
    PendulumVerticalAngle2 = PendulumVerticalAngle2 + 1

    ChangeColorMoment = (ChangeColorMoment + 1) MOD ChangeColorDelay

    IF ChangeColorMoment = 0 THEN

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

    'FOR t = 1 TO 1000000
    k$ = INKEY$: IF k$ <> "" THEN SYSTEM
    'NEXT

LOOP


SUB SpraySplatter (XCenterLocation, YCenterLocation, SplatterSize, SplatterColor, MinSplatterPoints, AddSplatterPoints)

'MinSplatterPoints = 300 '50
'AddSplatterPoints = 20 '50
NumOfSplatterPoints = RND(1) * MinSplatterPoints + AddSplatterPoints

SplatterRed& = _RED(SplatterColor)
SplatterGreen& = _GREEN(SplatterColor)
SplatterBlue& = _BLUE(SplatterColor)

FOR SplatterPoints = 1 TO NumOfSplatterPoints

    SplatterRadius = RND(1) * SplatterSize
    'SplatterDivisible = (256 / SplatterSize) * (SplatterSize - SplatterRadius)
    SplatterPointAngle = RND(1) * 360
    SplatterAlpha1& = 255 - ((256 / SplatterSize) * SplatterRadius)
    'SplatterRed1& = 255 - ((256 / SplatterSize) * SplatterRadius * SplatterRed&)
    'SplatterGreen1& = 255 - ((256 / SplatterSize) * SplatterRadius)
    'SplatterBlue1& = 255 - ((256 / SplatterSize) * SplatterRadius)

    NewXLoc = XCenterLocation + SplatterRadius * SIN(Radian * SplatterPointAngle)
    NewYLoc = YCenterLocation - SplatterRadius * COS(Radian * SplatterPointAngle)

    PSET (NewXLoc, NewYLoc), _RGBA32(SplatterRed&, SplatterGreen&, SplatterBlue&, SplatterAlpha1&) 'SplatterColor

NEXT


END SUB

