DIM SHARED NumberOfRays AS _UNSIGNED INTEGER
DIM SHARED RayAngleWidth AS _FLOAT
DIM SHARED Degree AS _FLOAT
DIM SHARED AspectRatio AS DOUBLE
DIM SHARED Logo AS LONG

_TITLE "The Joyful Programmer's Spinning Sun Rays"

SCREEN _NEWIMAGE(800, 142, 32)

Logo = _LOADIMAGE("TheJoyfulProgrammer_LOGO1.png", 33)

NumberOfRays = 30
Degree = _PI / 180
RayAngleWidth = (360 / NumberOfRays) * Degree

AspectRatio = _WIDTH(_DEST) / _HEIGHT(_DEST)

DO
    _LIMIT 60

    _PUTIMAGE ((_WIDTH(0) - _WIDTH(Logo)) / 2, (_HEIGHT(0) - _HEIGHT(Logo)) / 2), Logo

    k& = _KEYHIT
    IF k& = 27 THEN SYSTEM

    _DISPLAY

LOOP



SUB _GL () STATIC

    DIM Angle AS _FLOAT
    DIM CurrentAngle AS _FLOAT
    DIM LeftAngle AS _FLOAT
    DIM RightAngle AS _FLOAT
    DIM CenterX AS _FLOAT
    DIM CenterY AS _FLOAT
    DIM Scale AS _FLOAT

    CenterX = 0
    CenterY = -1
    Scale = 3 * AspectRatio

    _GLRENDER _BEHIND

    _glMatrixMode _GL_PROJECTION
    _glOrtho -AspectRatio, AspectRatio, -1, 1, -1, 1

    _glClearColor 0.211, 0.533, 0.854, 1
    _glEnable (_GL_BLEND)

    FOR Angle = 0 TO _PI(2) - RayAngleWidth STEP RayAngleWidth * 2
        LeftAngle = ((Angle - CurrentAngle) - (RayAngleWidth / 2))
        RightAngle = ((Angle - CurrentAngle) + (RayAngleWidth / 2))
        _glColor4f 1, 1, 1, 0.1
        _glBegin _GL_TRIANGLES
        _glVertex2f CenterX, CenterY
        _glVertex2f COS(LeftAngle) * Scale, SIN(LeftAngle) * Scale + CenterY
        _glVertex2f COS(RightAngle) * Scale, SIN(RightAngle) * Scale + CenterY
        _glEnd
    NEXT

    CurrentAngle = CurrentAngle + 0.0012

END SUB

