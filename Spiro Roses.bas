DIM SHARED PI AS _FLOAT
DIM SHARED Degrees AS _FLOAT
DIM SHARED ScreenWidth AS _UNSIGNED INTEGER
DIM SHARED ScreenHeight AS _UNSIGNED INTEGER
DIM Colr AS _UNSIGNED LONG

ScreenWidth = 800
ScreenHeight = 600

SCREEN _NEWIMAGE(ScreenWidth, ScreenHeight, 32)

PI = 3.141592654
Degrees = PI / 180
DO
    _LIMIT 30
    LINE (0, 0)-(ScreenWidth - 1, ScreenHeight - 1), _RGBA(0, 0, 0, 50), BF

    FOR iteration = 0 TO 0

        CenterX = RND * ScreenWidth
        CenterY = RND * ScreenHeight
        Colr = _RGB(RND * 256, RND * 256, RND * 256)

        Design = INT(RND * 10)

        SELECT CASE Design
            CASE 0
                Radius = RND * 150 + 50
                RosesAreRed CenterX, CenterY, Radius, Colr
            CASE 1
                Radius = RND * 30 + 20
                Shape1 CenterX, CenterY, Radius, Colr
            CASE 2
                Radius = RND * 600 + 100
                Shape2 CenterX, CenterY, Radius, Colr
            CASE 3
                Radius = RND * 70 + 10
                Shape3 CenterX, CenterY, Radius, Colr
            CASE 4
                Radius = RND * 50 + 50
                Shape4 CenterX, CenterY, Radius, Colr
            CASE 5
                Radius = RND * 50 + 50
                Shape5 CenterX, CenterY, Radius, Colr
            CASE 6
                Radius = RND * 80 + 20
                Shape6 CenterX, CenterY, Radius, Colr
            CASE 7
                Radius = RND * 200 + 50
                Shape7 CenterX, CenterY, Radius, Colr
            CASE 8
                Radius = RND * 100 + 50
                Shape8 CenterX, CenterY, Radius, Colr
            CASE 9
                Radius = RND * 80 + 30
                Shape9 CenterX, CenterY, Radius, Colr
        END SELECT

    NEXT

    _DISPLAY

LOOP WHILE INKEY$ = ""
SYSTEM

' #################################################################################################
' #                                                                                               #
' #################################################################################################
SUB RosesAreRed (CenterX AS _UNSIGNED INTEGER, CenterY AS _UNSIGNED INTEGER, Radius AS _UNSIGNED INTEGER, Colr AS LONG)

Petals = INT(RND(1) * 20) + 1
q = INT(RND(1) * 20) + 1
dec = Petals / q

' *** SETUP FIRST POSITION
rad = COS(dec)
x = (rad * Radius) * COS(0)
y = (rad * Radius) * SIN(0)
ox = CenterX + x
oy = CenterY + y

FOR i = 0 TO 360 * q
    rad = COS(dec * (i * Degrees))
    x = (rad * Radius) * COS(i * Degrees)
    y = (rad * Radius) * SIN(i * Degrees)
    LINE (ox, oy)-(CenterX + x, CenterY + y), Colr
    ox = CenterX + x
    oy = CenterY + y
NEXT

END SUB

' #################################################################################################
' #                                                                                               #
' #################################################################################################
SUB Shape1 (CenterX AS _UNSIGNED INTEGER, CenterY AS _UNSIGNED INTEGER, Radius AS _UNSIGNED INTEGER, Colr AS LONG)

DIM Theta AS _FLOAT
DIM Rad AS _FLOAT

FOR Theta = 0 TO 12 * PI STEP .05

    Rad = COS(Theta) * SIN(Theta / 3) * SIN(Theta / 2) * Radius * (3 + COS(Theta * 6.333))
    xp = CenterX + Rad * COS(Theta)
    yp = CenterY + Rad * SIN(Theta)

    IF Theta = 0 THEN
        PSET (xp, yp), Colr
    ELSE
        LINE -(xp, yp), Colr
    END IF

NEXT Theta

END SUB


' #################################################################################################
' #                                                                                               #
' #################################################################################################
SUB Shape2 (CenterX AS _UNSIGNED INTEGER, CenterY AS _UNSIGNED INTEGER, Radius AS _UNSIGNED INTEGER, Colr AS LONG)

DIM Theta AS _FLOAT
DIM Rad AS _FLOAT
DIM Angle AS _FLOAT

FOR Theta = 0 TO 2 * PI STEP .015

    Rad = -(.5 * SIN(5 * Theta)) * (.5 * COS(4 * Theta)) * Radius '1000
    Angle = Theta + SIN(Rad / 100)
    xp = CenterX + Rad * COS(Angle)
    yp = CenterY + Rad * SIN(Angle)

    IF Theta = 0 THEN
        PSET (xp, yp), Colr
    ELSE
        LINE -(xp, yp), Colr
    END IF

NEXT Theta

END SUB


' #################################################################################################
' #                                                                                               #
' #################################################################################################
SUB Shape3 (CenterX AS _UNSIGNED INTEGER, CenterY AS _UNSIGNED INTEGER, Radius AS _UNSIGNED INTEGER, Colr AS LONG)

DIM Theta AS _FLOAT
DIM Rad AS _FLOAT
DIM Angle AS _FLOAT

FOR Theta = 0 TO 4 * PI STEP .04

    Rad = (1.05 + SIN(Theta * 4.5)) * Radius
    Angle = Theta - COS(Theta * 10) / 10
    xp = CenterX + Rad * COS(Angle)
    yp = CenterY + Rad * SIN(Angle)

    IF Theta = 0 THEN
        PSET (xp, yp), Colr
    ELSE
        LINE -(xp, yp), Colr
    END IF

NEXT Theta

END SUB


' #################################################################################################
' #                                                                                               #
' #################################################################################################
SUB Shape4 (CenterX AS _UNSIGNED INTEGER, CenterY AS _UNSIGNED INTEGER, Radius AS _UNSIGNED INTEGER, Colr AS LONG)

DIM Theta AS _FLOAT
DIM Rad AS _FLOAT

FOR Theta = 0 TO 4 * PI STEP .02

    xp = CenterX + SIN(Theta * 5) * Radius
    yp = CenterY + COS(Theta * 5.5) * Radius

    IF Theta = 0 THEN
        PSET (xp, yp), Colr
    ELSE
        LINE -(xp, yp), Colr
    END IF

NEXT Theta

END SUB


' #################################################################################################
' #                                                                                               #
' #################################################################################################
SUB Shape5 (CenterX AS _UNSIGNED INTEGER, CenterY AS _UNSIGNED INTEGER, Radius AS _UNSIGNED INTEGER, Colr AS LONG)

DIM Theta AS _FLOAT
DIM Rad AS _FLOAT

FOR Theta = 0 TO 2 * PI STEP .02

    xp = CenterX + SIN(Theta * 5) * COS(Theta * 6) * Radius
    yp = CenterY + COS(Theta * 5.5) * SIN(Theta * 6.5) * Radius

    IF Theta = 0 THEN
        PSET (xp, yp), Colr
    ELSE
        LINE -(xp, yp), Colr
    END IF

NEXT Theta

END SUB


' #################################################################################################
' #                                                                                               #
' #################################################################################################
SUB Shape6 (CenterX AS _UNSIGNED INTEGER, CenterY AS _UNSIGNED INTEGER, Radius AS _UNSIGNED INTEGER, Colr AS LONG)

DIM Theta AS _FLOAT

FOR Theta = 0 TO 4 * PI STEP .004

    xp = CenterX + EXP(SIN(Theta * 10)) * Radius - 100
    t = CenterY + EXP(COS(Theta * 9.5)) * Radius - 100
    yp = t + SIN(xp / 20) * 20
    xp = xp + SIN(t / 20) * 20

    IF Theta = 0 THEN
        PSET (xp, yp), Colr
    ELSE
        LINE -(xp, yp), Colr
    END IF

NEXT Theta

END SUB


' #################################################################################################
' #                                                                                               #
' #################################################################################################
SUB Shape7 (CenterX AS _UNSIGNED INTEGER, CenterY AS _UNSIGNED INTEGER, Radius AS _UNSIGNED INTEGER, Colr AS LONG)

DIM Theta AS _FLOAT
DIM nthet AS _FLOAT

FOR Theta = 0 TO 4 * PI STEP .004

    xt = CenterX + SIN(Theta * 10) * Radius
    yt = CenterY + COS(Theta * 9.5) * Radius
    nthet = xt / 30 + yt / 30
    yp = yt + SIN(nthet) * 20
    xp = xt + COS(nthet) * 20

    IF Theta = 0 THEN
        PSET (xp, yp), Colr
    ELSE
        LINE -(xp, yp), Colr
    END IF

NEXT Theta

END SUB


' #################################################################################################
' #                                                                                               #
' #################################################################################################
SUB Shape8 (CenterX AS _UNSIGNED INTEGER, CenterY AS _UNSIGNED INTEGER, Radius AS _UNSIGNED INTEGER, Colr AS LONG)

DIM Theta AS _FLOAT

FOR Theta = 0 TO 160 STEP .06

    xt = SIN(Theta) * Theta * 2 + CenterX
    yt = COS(Theta) * Theta * 2 + CenterY
    nthet = xt / 30 + yt / 30
    othet = xt / 30 - yt / 30
    yp = yt + SIN(nthet) * 15 + SIN(othet) * 15
    xp = xt + COS(nthet) * 15 + COS(othet) * 15

    IF Theta = 0 THEN
        PSET (xp, yp), Colr
    ELSE
        LINE -(xp, yp), Colr
    END IF

NEXT Theta

END SUB


' #################################################################################################
' #                                                                                               #
' #################################################################################################
SUB Shape9 (CenterX AS _UNSIGNED INTEGER, CenterY AS _UNSIGNED INTEGER, Radius AS _UNSIGNED INTEGER, Colr AS LONG)

DIM Theta AS _FLOAT

FOR Theta = 0 TO 40 * PI STEP .04

    rad = (1.4 + SIN(Theta * 3.05)) * Radius
    xt = SIN(Theta) * rad + CenterX
    yt = COS(Theta) * rad + CenterY
    nthet = xt / 20
    othet = yt / 20
    yp = yt + SIN(nthet) * 15
    xp = xt + COS(othet) * 15

    IF Theta = 0 THEN
        PSET (xp, yp), Colr
    ELSE
        LINE -(xp, yp), Colr
    END IF

NEXT Theta

END SUB

