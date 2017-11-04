DIM GreenCircleRadius AS _FLOAT
DIM GreenCircleDiameter AS _FLOAT
DIM YellowCircleRadius AS _FLOAT
DIM YellowCircleDiameter AS _FLOAT
DIM PurpleCircleRadius AS _FLOAT
DIM RedCircleRadius AS _FLOAT

DIM GreenCircleBoundingBoxDiagonalDistance AS _FLOAT
DIM GCBBDDOutsideOfCircle AS _FLOAT

DIM CenterX AS INTEGER
DIM CenterY AS INTEGER

DIM Degrees AS _FLOAT

Degrees = _PI / 180

SCREEN _NEWIMAGE(700, 500, 32)


GreenCircleRadius = 39.51
GreenCircleDiameter = GreenCircleRadius * 2

YellowCircleRadius = 60
YellowCircleDiameter = YellowCircleRadius * 2

GreenCircleBoundingBoxDiagonalDistance = 1.414213562373095 * GreenCircleDiameter

PurpleCircleRadius = GreenCircleBoundingBoxDiagonalDistance / 2 + GreenCircleRadius
RedCircleRadius = PurpleCircleRadius + YellowCircleDiameter

CenterX = (_WIDTH / 4) * 2.5
CenterY = _HEIGHT / 2

'  PURPLE CIRCLE
CIRCLE (CenterX, CenterY), PurpleCircleRadius, _RGB32(255, 0, 255)

'  RED CIRCLE
CIRCLE (CenterX, CenterY), RedCircleRadius, _RGB32(255, 0, 0)

'  GREEN CIRCLE
CIRCLE (CenterX + GreenCircleRadius, CenterY - GreenCircleRadius), GreenCircleRadius, _RGB32(0, 255, 0)
LINE (CenterX + GreenCircleRadius, CenterY)-(CenterX + GreenCircleRadius, CenterY - GreenCircleDiameter), _RGB32(0, 160, 0)
LINE (CenterX, CenterY - GreenCircleRadius)-(CenterX + GreenCircleDiameter, CenterY - GreenCircleRadius), _RGB32(0, 160, 0)

'  YELLOW CIRCLE - I AM USING A SIMPLE HACK TO PLACE THE YELLOW CIRCLE
YellowCircleX = CenterX + (PurpleCircleRadius + YellowCircleRadius) * COS(Degrees * 45)
YellowCircleY = CenterY - (PurpleCircleRadius + YellowCircleRadius) * SIN(Degrees * 45)

CIRCLE (YellowCircleX, YellowCircleY), YellowCircleRadius, _RGB32(255, 255, 0)
LINE (YellowCircleX - YellowCircleRadius, YellowCircleY)-(YellowCircleX + YellowCircleRadius, YellowCircleY), _RGB32(255, 255, 0)
LINE (YellowCircleX, YellowCircleY - YellowCircleRadius)-(YellowCircleX, YellowCircleY + YellowCircleRadius), _RGB32(255, 255, 0)

'  WHITE LINES
LINE (CenterX, 0)-(CenterX, CenterY), _RGB32(255, 255, 255)
LINE -(_WIDTH, CenterY), _RGB32(255, 255, 255)

'  TEAL BOX
LINE (CenterX, CenterY)-(CenterX + GreenCircleDiameter, CenterY - GreenCircleDiameter), _RGB32(102, 208, 239), B
LINE (CenterX, CenterY)-(CenterX + GreenCircleDiameter, CenterY - GreenCircleDiameter), _RGB32(102, 208, 239)

LOCATE 2, 1

COLOR _RGB32(255, 200, 0), 0
PRINT " Green Circle Radius: "
PRINT " ";
COLOR 0, _RGB32(0, 255, 0)
PRINT GreenCircleRadius
PRINT

COLOR _RGB32(255, 200, 0), 0
PRINT " Purple Circle Radius: "
PRINT " ";
COLOR 0, _RGB32(255, 0, 255)
PRINT PurpleCircleRadius
PRINT

COLOR _RGB32(255, 200, 0), 0
PRINT " Yellow Circle Radius: "
PRINT " ";
COLOR 0, _RGB32(255, 255, 0)
PRINT YellowCircleRadius
PRINT

COLOR _RGB32(255, 200, 0), 0
PRINT " Red Circle Radius: "
PRINT " ";
COLOR 0, _RGB32(255, 0, 0)
PRINT RedCircleRadius


SLEEP
SYSTEM





