DEFLNG A-Z
$RESIZE:ON

TYPE Explosion
    ExplosionImageIndex AS _UNSIGNED _BYTE ' Which explosion image are we using
    ExplosionKeyFrame AS _UNSIGNED _BYTE ' Which frame
    X AS _UNSIGNED INTEGER ' X Coordinate
    Y AS _UNSIGNED INTEGER ' Y Coordinate
    FrameDelay AS DOUBLE ' How long it takes between each frame
    CurrentDelay AS DOUBLE ' Current capture of the TIMER
    ShowDelay AS DOUBLE ' Time to wait before the animation start
    CurrentShowDelay AS DOUBLE ' Current capture of the TIMER
END TYPE

DIM MainScreen AS _UNSIGNED LONG
DIM NumOfExplosions AS _UNSIGNED INTEGER
NumOfExplosions = 500 '500

DIM Explosions(NumOfExplosions - 1) AS Explosion
REDIM ExplosionImages(-1, -1) AS _UNSIGNED LONG

MainScreen = _NEWIMAGE(900, 600, 32)

SCREEN MainScreen
_DISPLAYORDER _HARDWARE , _GLRENDER , _HARDWARE1 , _SOFTWARE

SUB_CenterWindow (MainScreen)

DIM NumberOfImages AS _UNSIGNED INTEGER
NumberOfImages = 45 '1440

DIM NewImage(NumberOfImages) AS _UNSIGNED LONG
DIM Images(NumberOfImages) AS _UNSIGNED LONG
DIM Resized AS LONG
DIM TmpImage1 AS _UNSIGNED LONG
DIM TmpImage2 AS _UNSIGNED LONG
DIM FileName AS STRING
DIM FPS AS _UNSIGNED LONG
DIM Angle AS DOUBLE

F = _LOADFONT("C:\Windows\Fonts\arialbd.ttf", 28)

' *** LOAD EXPLOSION IMAGES & SEPERATE INTO INDIVIDUAL IMAGES
FOR i = 0 TO 0
    FileName = "explode_" + RTRIM$(LTRIM$(STR$(i + 1))) + ".png"
    TmpImage1 = _LOADIMAGE(FileName, 32)
    REDIM _PRESERVE ExplosionImages(i, 15) AS _UNSIGNED LONG
    FOR i2 = 0 TO 15
        TmpImage2 = _NEWIMAGE(64, 64, 32)
        _PUTIMAGE (0, 0)-(63, 63), TmpImage1, TmpImage2, ((i2 MOD 4) * 64, INT(i2 / 4) * 64)
        ExplosionImages(i, i2) = _COPYIMAGE(TmpImage2, 33)
        _FREEIMAGE TmpImage2
    NEXT
    _FREEIMAGE TmpImage1
NEXT

FOR i = 0 TO UBOUND(NewImage)
    NewImage(i) = TextToImage("www.TheJoyfulProgramming.com", F, _RGBA(RND * 256, RND * 256, RND * 256, 255), _RGBA(RND * 256, RND * 256, RND * 256, 255), 1)
    Images(i) = _COPYIMAGE(NewImage(i), 33)
    _FREEIMAGE NewImage(i)
NEXT

' *** SETUP EXPLOSION ANIMATION
FOR e = 0 TO NumOfExplosions - 1
    Explosions(e).ExplosionImageIndex = 0
    Explosions(e).ExplosionKeyFrame = 0
    Explosions(e).X = RND * _WIDTH(MainScreen)
    Explosions(e).Y = RND * _HEIGHT(MainScreen)
    Explosions(e).FrameDelay = (1 / 60) * (RND * 4) '0.05
    Explosions(e).CurrentDelay = TIMER(0.001)
    Explosions(e).ShowDelay = (1 / 60) * (RND * 30)
    Explosions(e).CurrentShowDelay = TIMER(0.001)
NEXT


DO
    FPS = FPS + 1

    IF FUNCTION_CheckResize(MainScreen) = 0 THEN

        '_LIMIT 30
        CLS _RGBA(0, 0, 0, 0)
        _SETALPHA 0, _RGB(0, 0, 0)


        Angle = TIMER(0.001) * 30

        ' *** Draw softwre rendered boxes
        'FOR i2 = 1 TO 1
        LINE (0, 0)-(100, 100), _RGBA(255, 0, 0, 2), BF
        'NEXT

        ' *** Draw colored text inside a colored box
        FOR NImage = 0 TO UBOUND(Images)
            DisplayImage Images(NImage), _WIDTH(MainScreen) / 2, _HEIGHT(MainScreen) / 2, Angle + NImage * 8, 4
        NEXT

        ' *** Draw animated explosions
        FOR e = 0 TO NumOfExplosions - 1
            CurrentTimer# = TIMER(0.001)
            IF (CurrentTimer# - Explosions(e).CurrentShowDelay) > Explosions(e).ShowDelay THEN
                DisplayImage ExplosionImages(RND * UBOUND(explosionimages, 1), Explosions(e).ExplosionKeyFrame), Explosions(e).X, Explosions(e).Y, 0, 0
                'DisplayImage ExplosionImages(RND * UBOUND(explosionimages, 1), 0), Explosions(e).X, Explosions(e).Y, 0, 0
                IF (CurrentTimer# - Explosions(e).CurrentDelay) > Explosions(e).FrameDelay THEN
                    Explosions(e).ExplosionKeyFrame = Explosions(e).ExplosionKeyFrame + 1
                    Explosions(e).CurrentDelay = TIMER(0.001)
                    IF Explosions(e).ExplosionKeyFrame > 14 THEN
                        Explosions(e).ExplosionKeyFrame = 0
                        Explosions(e).X = RND * _WIDTH(MainScreen)
                        Explosions(e).Y = RND * _HEIGHT(MainScreen)
                        Explosions(e).CurrentShowDelay = TIMER(0.001)
                    END IF
                END IF
            END IF
        NEXT

        IF TIMER - t# >= 1 THEN
            t# = TIMER
            CurrentFPS = FPS - oldi
            oldi = FPS
            _TITLE "FPS: " + STR$(CurrentFPS)
        END IF

        _DISPLAY

    END IF

LOOP UNTIL _KEYHIT
SYSTEM


FUNCTION TextToImage& (text$, font&, fc&, bfc&, mode AS _BYTE)
'text$ is the text that we wish to transform into an image.
'font& is the handle of the font we want to use.
'fc& is the color of the font we want to use.
'bfc& is the background color of the font.

'Mode 1 is print forwards
'Mode 2 is print backwards
'Mode 3 is print from top to bottom
'Mode 4 is print from bottom up
'Mode 0 got lost somewhere, but it's OK.  We check to see if our mode is < 1 or > 4 and compensate automatically if it is to make it one (default).

IF mode < 1 OR mode > 4 THEN mode = 1
dc& = _DEFAULTCOLOR: bgc& = _BACKGROUNDCOLOR
f& = _FONT
IF font& <> 0 THEN _FONT font&
IF mode < 3 THEN
    'print the text lengthwise
    w& = _PRINTWIDTH(text$): h& = _FONTHEIGHT
ELSE
    'print the text vertically
    FOR i = 1 TO LEN(text$)
        IF w& < _PRINTWIDTH(MID$(text$, i, 1)) THEN w& = _PRINTWIDTH(MID$(text$, i, 1))
    NEXT
    h& = _FONTHEIGHT * (LEN(text$))
END IF
TextToImage& = _NEWIMAGE(w&, h&, 32)
_DEST TextToImage&
IF font& <> 0 THEN _FONT font&
COLOR fc&, bfc&

SELECT CASE mode
    CASE 1
        'Print text forward
        _PRINTSTRING (0, 0), text$
    CASE 2
        'Print text backwards
        temp$ = ""
        FOR i = 0 TO LEN(text$) - 1
            temp$ = temp$ + MID$(text$, LEN(text$) - i, 1)
        NEXT
        _PRINTSTRING (0, 0), temp$
    CASE 3
        'Print text upwards
        'first lets reverse the text, so it's easy to place
        temp$ = ""
        FOR i = 0 TO LEN(text$) - 1
            temp$ = temp$ + MID$(text$, LEN(text$) - i, 1)
        NEXT
        'then put it where it belongs
        FOR i = 1 TO LEN(text$)
            fx = (w& - _PRINTWIDTH(MID$(temp$, i, 1))) / 2 + .99 'This is to center any non-monospaced letters so they look better
            _PRINTSTRING (fx, _FONTHEIGHT * (i - 1)), MID$(temp$, i, 1)
        NEXT
    CASE 4
        'Print text downwards
        FOR i = 1 TO LEN(text$)
            fx = (w& - _PRINTWIDTH(MID$(text$, i, 1))) / 2 + .99 'This is to center any non-monospaced letters so they look better
            _PRINTSTRING (fx, _FONTHEIGHT * (i - 1)), MID$(text$, i, 1)
        NEXT
        _DISPLAY
END SELECT
_DEST 0
COLOR dc&, bgc&
_FONT f&
'_AUTODISPLAY
END FUNCTION


SUB DisplayImage (Image AS LONG, x AS INTEGER, y AS INTEGER, angle AS SINGLE, mode AS _BYTE)
'Image is the image handle which we use to reference our image.
'x,y is the X/Y coordinates where we want the image to be at on the screen.
'angle is the angle which we wish to rotate the image.
'mode determines HOW we place the image at point X,Y.
'Mode 0 we center the image at point X,Y
'Mode 1 we place the Top Left corner of oour image at point X,Y
'Mode 2 is Bottom Left
'Mode 3 is Top Right
'Mode 4 is Bottom Right


DIM px(3) AS INTEGER, py(3) AS INTEGER, w AS INTEGER, h AS INTEGER
DIM sinr AS SINGLE, cosr AS SINGLE, i AS _BYTE
w = _WIDTH(Image): h = _HEIGHT(Image)
SELECT CASE mode
    CASE 0 'center
        px(0) = -w \ 2: py(0) = -h \ 2: px(3) = w \ 2: py(3) = -h \ 2
        px(1) = -w \ 2: py(1) = h \ 2: px(2) = w \ 2: py(2) = h \ 2
    CASE 1 'top left
        px(0) = 0: py(0) = 0: px(3) = w: py(3) = 0
        px(1) = 0: py(1) = h: px(2) = w: py(2) = h
    CASE 2 'bottom left
        px(0) = 0: py(0) = -h: px(3) = w: py(3) = -h
        px(1) = 0: py(1) = 0: px(2) = w: py(2) = 0
    CASE 3 'top right
        px(0) = -w: py(0) = 0: px(3) = 0: py(3) = 0
        px(1) = -w: py(1) = h: px(2) = 0: py(2) = h
    CASE 4 'bottom right
        px(0) = -w: py(0) = -h: px(3) = 0: py(3) = -h
        px(1) = -w: py(1) = 0: px(2) = 0: py(2) = 0
END SELECT
sinr = SIN(angle / 57.2957795131): cosr = COS(angle / 57.2957795131)
FOR i = 0 TO 3
    x2 = (px(i) * cosr + sinr * py(i)) + x: y2 = (py(i) * cosr - px(i) * sinr) + y
    px(i) = x2: py(i) = y2
NEXT
_MAPTRIANGLE (0, 0)-(0, h - 1)-(w - 1, h - 1), Image TO(px(0), py(0))-(px(1), py(1))-(px(2), py(2)), , _SMOOTH
_MAPTRIANGLE (0, 0)-(w - 1, 0)-(w - 1, h - 1), Image TO(px(0), py(0))-(px(3), py(3))-(px(2), py(2)), , _SMOOTH
END SUB

'$include:'FUNCTION_CheckResize.bm'
'$include:'SUB_CenterWindow.bm'

