ScreenWidth& = 800
ScreenHeight& = 600
Object1MaxWidth& = 80
Object1MaxHeight& = 80
CenterX% = Object1MaxWidth& / 2
CenterY% = Object1MaxHeight& / 2
NumSteps = 50 '100
MainScreen~& = _NEWIMAGE(ScreenWidth&, ScreenHeight&, 32)
BackBuffer1~& = _NEWIMAGE(Object1MaxWidth&, Object1MaxHeight&, 32)

SCREEN MainScreen~&
_DEST BackBuffer1~&

StartColor~& = _RGB(RND * 256, RND * 256, RND * 256)
EndColor~& = _RGB(RND * 256, RND * 256, RND * 256)

DO
    _LIMIT 60

    redInc! = -(_RED32(StartColor~&) - _RED32(EndColor~&)) / NumSteps
    greenInc! = -(_GREEN32(StartColor~&) - _GREEN32(EndColor~&)) / NumSteps
    blueInc! = -(_BLUE32(StartColor~&) - _BLUE32(EndColor~&)) / NumSteps
    'alphaInc! = -(_ALPHA32(StartColor~& - _ALPHA32(EndColor~&) / NumSteps

    FOR numCircles = 0 TO NumSteps
        Red% = _RED32(StartColor~&) + redInc! * numCircles 'RND * 256
        Green% = _GREEN32(StartColor~&) + greenInc! * numCircles 'RND * 256
        Blue% = _BLUE32(StartColor~&) + blueInc! * numCircles 'RND * 256

        FOR qtyCircles = 0 TO 20
            CLS

            radius = RND * (Object1MaxWidth& / 2 - 2)
            ImageX% = (radius - (Object1MaxWidth& / 2)) + RND * (ScreenWidth& - radius * 2) '+ Radius
            ImageY% = (radius - (Object1MaxHeight& / 2)) + RND * (ScreenHeight& - radius * 2) ' + Radius

            CIRCLE (CenterX%, CenterY%), radius, _RGB(Red%, Green%, Blue%)
            PAINT (CenterX%, CenterY%), _RGB(Red%, Green%, Blue%)
            'CIRCLE (CenterX%, CenterY%), radius - 3, _RGB(0, 0, 0)
            'PAINT (CenterX%, CenterY%), _RGB(0, 0, 0)

            _SETALPHA 0, _RGB(0, 0, 0)
            _PUTIMAGE (ImageX%, ImageY%), BackBuffer1~&, MainScreen~&, (0, 0)-(Object1MaxWidth& - 1, Object1MaxHeight& - 1)
        NEXT

        _DISPLAY
        IF INKEY$ <> "" THEN SYSTEM
    NEXT

    SWAP StartColor~&, EndColor~&
    EndColor~& = _RGB(RND * 256, RND * 256, RND * 256)

LOOP WHILE INKEY$ = ""
SYSTEM
