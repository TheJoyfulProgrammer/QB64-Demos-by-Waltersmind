CONST Cols = 300
CONST Rows = 100
CONST Thickness = 80 * 80
CONST Spacing = 3
CONST Margin = 100
CONST Drag = .95
CONST Ease = .25
CONST Num_Particles = Cols * Rows
CONST WindowWidth = Cols * Spacing + Margin * 2
CONST WindowHeight = Rows * Spacing + Margin * 2
CONST WindowWidthHalf = WindowWidth / 2
CONST WindowHeightHalf = WindowHeight / 2
CONST WindowWidth45 = WindowWidth * 0.45
CONST WindowHeight45 = WindowHeight * 0.45
CONST TRUE = 1
CONST FALSE = 0

TYPE Particle
    vx AS SINGLE
    vy AS SINGLE
    x AS SINGLE
    y AS SINGLE
    OldX AS SINGLE
    OldY AS SINGLE
END TYPE

DIM Particles(Num_Particles) AS Particle
DIM MainWindow AS LONG
DIM Image AS LONG

man = FALSE
tog = TRUE

FOR I = 0 TO Num_Particles - 1
    Particles(I).x = Margin + Spacing * (I MOD Cols)
    Particles(I).OldX = Particles(I).x
    Particles(I).y = Margin + Spacing * FIX(I / Cols)
    Particles(I).OldY = Particles(I).y
NEXT

Msg1$ = "Translated from JavaScript to QB64 by Walter Whitman"
Msg2$ = "<1> 1x1 Pixels    <2> 3x3 Boxes    <ESC> Exit Demo"

Msg1x = (WindowWidth - (LEN(Msg1$) * 8)) / 2
Msg1y = Margin / 2

Msg2x = (WindowWidth - (LEN(Msg2$) * 8)) / 2
Msg2y = WindowHeight - Margin / 2

SCREEN _NEWIMAGE(WindowWidth, WindowHeight, 32)
_SCREENMOVE (_DESKTOPWIDTH \ 2 - _WIDTH \ 2) - 3, (_DESKTOPHEIGHT \ 2 - _HEIGHT \ 2) - 29
_TITLE "30,000 Particles"


Image = _LOADIMAGE("Rainbow-v1-300x100.png")
_SOURCE Image

'  ### GAME LOOP ###
Shape = 1

_PRINTMODE _KEEPBACKGROUND

DO

    _LIMIT 30
    CLS

    DO WHILE _MOUSEINPUT
        mx = _MOUSEX
        my = _MOUSEY
        man = TRUE
    LOOP


    IF man = FALSE THEN
        time = TIMER(0.001)
        mx = WindowWidthHalf + (COS(time * 2.1) * COS(time * 0.9)) * WindowWidth45
        my = WindowHeightHalf + (SIN(time * 3.2) * TAN(SIN(time * 0.8))) * WindowHeight45
    END IF

    $CHECKING:OFF

    FOR I = 0 TO Num_Particles - 1
        dx = mx - Particles(I).x
        dy = my - Particles(I).y
        d = dx * dx + dy * dy
        f = -Thickness / d

        IF d < Thickness THEN
            t = _ATAN2(dy, dx)
            Particles(I).vx = Particles(I).vx + f * COS(t)
            Particles(I).vy = Particles(I).vy + f * SIN(t)
        END IF

        Particles(I).vx = Particles(I).vx * Drag
        Particles(I).vy = Particles(I).vy * Drag
        Particles(I).x = Particles(I).x + Particles(I).vx + (Particles(I).OldX - Particles(I).x) * Ease
        Particles(I).y = Particles(I).y + Particles(I).vy + (Particles(I).OldY - Particles(I).y) * Ease

        xx = I MOD Cols
        yy = INT(I / Cols)

        SELECT CASE Shape

            CASE 1

                PSET (Particles(I).x, Particles(I).y), POINT(xx, yy)

            CASE 2

                LINE (Particles(I).x - 1, Particles(I).y - 1)-(Particles(I).x + 1, Particles(I).y + 1), POINT(xx, yy), BF

        END SELECT

    NEXT

    $CHECKING:ON

    _PRINTSTRING (Msg1x, Msg1y), Msg1$
    _PRINTSTRING (Msg2x, Msg2y), Msg2$

    _DISPLAY

    k& = _KEYHIT

    SELECT CASE k&

        CASE 27

            SYSTEM

        CASE 49

            Shape = 1

        CASE 50

            Shape = 2

    END SELECT

LOOP
