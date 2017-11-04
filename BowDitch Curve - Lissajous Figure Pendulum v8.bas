'******************************************************************************
'*                                                                            *
'*  BowDitch Curve / Lissajous Figure Pendulum: Version #8                    *
'*                                                                            *
'*  Modified By Waltersmind              Date: 01-03-12                       *
'*                                                                            *
'******************************************************************************

DEFDBL A-Z
false = 0
true = 1

COMMON SHARED Radian
Radian = 3.141592654 / 180

COMMON SHARED PendulumBallSize, ChangeColorMoment%, ChangeColorDelay%
COMMON SHARED RedStart1%, RedEnd1%, GreenStart1%, GreenEnd1%, BlueStart1%, BlueEnd1%
COMMON SHARED RedStart2%, RedEnd2%, GreenStart2%, GreenEnd2%, BlueStart2%, BlueEnd2%
COMMON SHARED redInc1, redInc2, greenInc1, greenInc2, blueInc1, blueInc2
COMMON SHARED BackBuffer1Width&, BackBuffer1Height&, BackBuffer1CenterX&, BackBuffer1CenterY&
COMMON SHARED AppWindowWidth%, AppWindowHeight%, AppWindowWD2%, AppWindowHD2%

AppWindowWidth% = 900
AppWindowHeight% = 700

AppWindowWD2% = AppWindowWidth% / 2
AppWindowHD2% = AppWindowHeight% / 2

FramesPerSecond% = 30 '60
TimerDelay# = 1 / FramesPerSecond%
StartingTime# = TIMER(.001)

DIM SHARED FastSin(360) AS DOUBLE
DIM SHARED FastCos(360) AS DOUBLE
DIM SHARED BackBufferScreenPointX(3) AS INTEGER
DIM DestX1%(3)
DIM DestY1%(3)

FOR Angle = 0 TO 360

    FastSin(Angle) = SIN(Angle * Radian)
    FastCos(Angle) = COS(Angle * Radian)

NEXT

ChangeColorDelay% = 500
ChangeColorMoment% = 0

RedStart1% = RND(1) * 256: GreenStart1% = RND(1) * 256: BlueStart1% = RND(1) * 256
RedStart2% = RND(1) * 256: GreenStart2% = RND(1) * 256: BlueStart2% = RND(1) * 256

RedEnd1% = RND(1) * 256: GreenEnd1% = RND(1) * 256: BlueEnd1% = RND(1) * 256
RedEnd2% = RND(1) * 256: GreenEnd2% = RND(1) * 256: BlueEnd2% = RND(1) * 256

redInc1 = -(RedStart1% - RedEnd1%) / ChangeColorDelay%
redInc2 = -(RedStart2% - RedEnd2%) / ChangeColorDelay%

greenInc1 = -(GreenStart1% - GreenEnd1%) / ChangeColorDelay%
greenInc2 = -(GreenStart2% - GreenEnd2%) / ChangeColorDelay%

blueInc1 = -(BlueStart1% - BlueEnd1%) / ChangeColorDelay%
blueInc2 = -(BlueStart2% - BlueEnd2%) / ChangeColorDelay%

AppWinScreenHandle& = _NEWIMAGE(AppWindowWidth%, AppWindowHeight%, 32)
BackBuffer1& = _NEWIMAGE(AppWindowWidth%, AppWindowHeight%, 32)

SCREEN AppWinScreenHandle&
_SCREENMOVE _MIDDLE

BackBuffer1Width& = _WIDTH(BackBuffer1&)
BackBuffer1Height& = _HEIGHT(BackBuffer1&)
BackBuffer1CenterX& = BackBuffer1Width& / 2
BackBuffer1CenterY& = BackBuffer1Height& / 2
BackBufferScreenPointX(0) = -BackBuffer1CenterX&
BackBufferScreenPointY(0) = -BackBuffer1CenterY&
BackBufferScreenPointX(1) = -BackBuffer1CenterX&
BackBufferScreenPointY(1) = BackBuffer1CenterY&
BackBufferScreenPointX(2) = BackBuffer1CenterX&
BackBufferScreenPointY(2) = BackBuffer1CenterY&
BackBufferScreenPointX(3) = BackBuffer1CenterX&
BackBufferScreenPointY(3) = -BackBuffer1CenterY&


PendulumAtRestCenterX% = AppWindowWD2%
PendulumAtRestCenterY% = AppWindowHD2%

PendulumVerticalHeight% = AppWindowHD2% - PendulumBallSize - 5
PendulumHorizontalWidth% = AppWindowWidth% - PendulumBallSize - 5 '600

PendulumVerticalAngle = 0
PendulumHorizontalAngle = 0

PendulumXLocOld% = PendulumAtRestCenterX% + PendulumHorizontalWidth% * SIN(PendulumHorizontalAngle * Radian) * COS(PendulumHorizontalAngle * Radian)
PendulumYLocOld% = PendulumAtRestCenterY% + PendulumVerticalHeight% * SIN(PendulumVerticalAngle * Radian)

'Image1ScaleAngle& = 0
'MinImageScale1 = .9
'MaxImageScale1 = 1.15
'ImageScaleAdjust1 = MaxImageScale1 - MinImageScale1
'Image1Xloc& = _WIDTH(BackBuffer1&) / 2 '+ PicOffsetX1
'Image1Yloc& = _HEIGHT(BackBuffer1&) / 2 '+ PicOffsetY1
Image1PixelScale% = 0

_DEST BackBuffer1&

PStep = (1 / 360)
PAngle = 0

PHAngleMin = 1
PHAngleMax = 8
PHAngleAdjust = PHAngleMax - PHAngleMin

PVAngleMin = 3
PVAngleMax = 8
PVAngleAdjust = PHVngleMax - PHVngleMin

COMMON SHARED SplatterZBack, SplatterZFront, SplatterZAdjust, SplatterZAngle

SplatterZBack = 5
SplatterZFront = 125
SplatterZAdjust = SplatterZFront - SplatterZBack
SplatterZAngle = 0

PendulumBallSize = SplatterZBack

DO

    PendulumXLocNew% = PendulumAtRestCenterX% + (PendulumHorizontalWidth% / 2) * COS(PendulumHorizontalAngle * Radian)
    PendulumYLocNew% = PendulumAtRestCenterY% + PendulumVerticalHeight% * SIN(PendulumVerticalAngle * Radian)

    SpraySplatterLine PendulumXLocOld%, PendulumYLocOld%, PendulumXLocNew%, PendulumYLocNew%

    PendulumHorizontalAngle = PendulumHorizontalAngle + PHAngleMin + PHAngleAdjust * ABS(SIN(PAngle * Radian)) / 2 '5.5
    PendulumVerticalAngle = PendulumVerticalAngle + PVAngleMin + PVAngleAdjust * ABS(SIN(PAngle * Radian)) / 2 '5.5'+ 4 '8
    PAngle = (PAngle + 1) MOD 360

    PendulumXLocOld% = PendulumXLocNew%: PendulumYLocOld% = PendulumYLocNew%

    k$ = INKEY$: IF k$ <> "" THEN SYSTEM

    IF (TIMER - StartingTime#) >= TimerDelay# THEN

        _PUTIMAGE (0, 0)-(AppWindowWidth%, AppWindowHeight%), BackBuffer1&, AppWinScreenHandle&, (0, 0)-(AppWindowWidth%, AppWindowHeight%)
        _DISPLAY
        _PUTIMAGE (Image1PixelScale%, Image1PixelScale%)-(AppWindowWidth% - Image1PixelScale%, AppWindowHeight% - Image1PixelScale%), AppWinScreenHandle&, BackBuffer1&, (0, 0)-(AppWindowWidth%, AppWindowHeight%)
        LINE (0, 0)-(AppWindowWidth%, AppWindowHeight%), _RGBA32(0, 0, 0, 54), BF

        StartingTime# = TIMER(.001)

    END IF

LOOP

'******************************************************************************
'*                                                                            *
'*  SUB UpdateColors ()                                                       *
'*                                                                            *
'******************************************************************************
SUB UpdateColors ()

ChangeColorMoment% = (ChangeColorMoment% + 1) MOD ChangeColorDelay%

IF ChangeColorMoment% = 0 THEN

    RedStart1% = RedEnd1%: GreenStart1% = GreenEnd1%: BlueStart1% = BlueEnd1%
    RedStart2% = RedEnd2%: GreenStart2% = GreenEnd2%: BlueStart2% = BlueEnd2%

    RedEnd1% = RND(1) * 256: GreenEnd1% = RND(1) * 256: BlueEnd1% = RND(1) * 256
    RedEnd2% = RND(1) * 256: GreenEnd2% = RND(1) * 256: BlueEnd2% = RND(1) * 256

    redInc1 = -(RedStart1% - RedEnd1%) / ChangeColorDelay%
    redInc2 = -(RedStart2% - RedEnd2%) / ChangeColorDelay%

    greenInc1 = -(GreenStart1% - GreenEnd1%) / ChangeColorDelay%
    greenInc2 = -(GreenStart2% - GreenEnd2%) / ChangeColorDelay%

    blueInc1 = -(BlueStart1% - BlueEnd1%) / ChangeColorDelay%
    blueInc2 = -(BlueStart2% - BlueEnd2%) / ChangeColorDelay%

END IF

END SUB


'******************************************************************************
'*                                                                            *
'*  SUB SpraySplatter (X, Y, Size, Color)                                     *
'*                                                                            *
'******************************************************************************
SUB SpraySplatter (XCenterLocation%, YCenterLocation%, SplatterSize, SplatterColor)

MinSplatterPoints% = 5 * SplatterSize
AddSplatterPoints% = SplatterSize
NumOfSplatterPoints% = RND(1) * MinSplatterPoints% + AddSplatterPoints%

SplatterRed% = _RED(SplatterColor)
SplatterGreen% = _GREEN(SplatterColor)
SplatterBlue% = _BLUE(SplatterColor)

FOR SplatterPoints% = 1 TO NumOfSplatterPoints%

    SplatterRadius% = RND(1) * SplatterSize
    SplatterPointAngle% = RND(1) * 360
    SplatterAlpha1% = 255 - ((256 / SplatterSize) * SplatterRadius%)

    NewXLoc% = XCenterLocation% + SplatterRadius% * FastSin(SplatterPointAngle%)
    NewYLoc% = YCenterLocation% - SplatterRadius% * FastCos(SplatterPointAngle%)

    PSET (NewXLoc%, NewYLoc%), _RGBA32(SplatterRed%, SplatterGreen%, SplatterBlue%, SplatterAlpha1%)

NEXT

END SUB


'******************************************************************************
'*                                                                            *
'*  SUB SpraySplatterLine (OldXLoc%, OldYLoc%, NewXLoc%, NewYLoc%)            *
'*                                                                            *
'******************************************************************************
SUB SpraySplatterLine (OldXLoc%, OldYLoc%, NewXLoc%, NewYLoc%)

LineDeltaX% = ABS(NewXLoc% - OldXLoc%)
LineDeltaY% = ABS(NewYLoc% - OldYLoc%)
LinePointX% = OldXLoc%
LinePointY% = OldYLoc%

IF NewXLoc% >= OldXLoc% THEN
    XSlopeIncrement1% = 1
    XSlopeIncrement2% = 1
ELSE
    XSlopeIncrement1% = -1
    XSlopeIncrement2% = -1
END IF

IF NewYLoc% >= OldYLoc% THEN
    YSlopeIncrement1% = 1
    YSlopeIncrement2% = 1
ELSE
    YSlopeIncrement1% = -1
    YSlopeIncrement2% = -1
END IF

IF LineDeltaX% >= LineDeltaY% THEN
    XSlopeIncrement1% = 0
    YSlopeIncrement2% = 0
    Denominator% = LineDeltaX%
    Numerator% = LineDeltaX% / 2
    NumeratorAdd% = LineDeltaY%
    NumberOfPixelsToPlot% = LineDeltaX%
ELSE
    XSlopeIncrement2% = 0
    YSlopeIncrement1% = 0
    Denominator% = LineDeltaY%
    Numerator% = LineDeltaY% / 2
    NumeratorAdd% = LineDeltaX%
    NumberOfPixelsToPlot% = LineDeltaY%
END IF

FOR CurrentLinePixel% = 0 TO NumberOfPixelsToPlot%

    SpraySplatter LinePointX%, LinePointY%, PendulumBallSize, _RGB32(RedStart1% + redInc1 * ChangeColorMoment%, GreenStart1% + greenInc1 * ChangeColorMoment%, BlueStart1% + blueInc1 * ChangeColorMoment%)
    Numerator% = Numerator% + NumeratorAdd%
    PendulumBallSize = SplatterZBack + SplatterZAdjust * ABS(SIN(SplatterZAngle * Radian)) / 2
    SplatterZAngle = (SplatterZAngle + .05)
    IF SplatterZAngle > 360 THEN SplatterZAngle = SplatterZAngle - 360

    IF Numerator% >= Denomiator% THEN
        Numerator% = Numerator% - Denominator%
        LinePointX% = LinePointX% + XSlopeIncrement1%
        LinePointY% = LinePointY% + YSlopeIncrement1%
    END IF

    LinePointX% = LinePointX% + XSlopeIncrement2%
    LinePointY% = LinePointY% + YSlopeIncrement2%

    UpdateColors

NEXT

END SUB