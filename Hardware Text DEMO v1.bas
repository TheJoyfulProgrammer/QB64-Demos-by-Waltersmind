CONST NumberOfBalls = 500

TYPE Ball
    x AS INTEGER
    y AS INTEGER
    X_Direction AS _BYTE
    Y_Direction AS _BYTE
    Text_Character AS _UNSIGNED _BYTE
END TYPE

DIM Main_Window AS LONG
DIM Ball_Image AS LONG
DIM Text_Sprite_Sheet(16) AS LONG
DIM Temporary_Image AS LONG

DIM Balls(NumberOfBalls) AS Ball

DIM Colors(16) AS _UNSIGNED LONG

DIM Text_X0 AS INTEGER
DIM Text_Y0 AS INTEGER
DIM Text_X_Direction AS INTEGER
DIM Text_Y_Direction AS INTEGER

DIM Window_Width AS _UNSIGNED INTEGER
DIM Window_Height AS _UNSIGNED INTEGER

DIM Text_Sprite_Margin AS INTEGER
DIM Text_Sprite_Stepping AS _FLOAT

DIM Counting_Number AS _UNSIGNED LONG

Window_Width = _DESKTOPWIDTH - 25
Window_Height = _DESKTOPHEIGHT - 90

Main_Window = _NEWIMAGE(Window_Width, Window_Height, 32)

_SCREENHIDE

' GET THE PALETTE COLORS OF SCREEN 0
SCREEN 0

FOR C = 0 TO 15
    Colors(C) = _RGBA32(_RED(C), _GREEN(C), _BLUE(C), _ALPHA(C))
NEXT


SCREEN Main_Window

_DELAY 0.4

_SCREENMOVE (_DESKTOPWIDTH - Window_Width) / 2 - 3, (_DESKTOPHEIGHT - Window_Height) / 2 - 35
_SCREENSHOW



'  SETUP THE DATA FOR THE BALLS
FOR i = 0 TO UBOUND(balls)

    Balls(i).x = RND * _WIDTH(Main_Window)
    Balls(i).y = RND * _HEIGHT(Main_Window)

    Balls(i).X_Direction = RND * 2
    Balls(i).Y_Direction = RND * 2

    IF Balls(i).X_Direction = 0 THEN Balls(i).X_Direction = -1
    IF Balls(i).Y_Direction = 0 THEN Balls(i).Y_Direction = -1

    BallXSpeed = RND * 4 + 1
    BallYSpeed = RND * 4 + 1

    Balls(i).X_Direction = Balls(i).X_Direction * BallXSpeed
    Balls(i).Y_Direction = Balls(i).Y_Direction * BallYSpeed

    Balls(i).Text_Character = INT(RND * 2) + 1

NEXT


'  CREATE A TEMPORARY IMAGE TO STORE THE FONTS IN. THIS WILL BE A SPRITESHEET.
'  FOR THIS DEMO, I AM USING THE STANDARD FONT IN QB64. TO USE OTHER FONTS, YOU
'  WILL NEED TO RECALCULATE THE SIZE OF THE SPRITESHEET TO HOLD THE FONT.
Temporary_Image = _NEWIMAGE(8 * 16, 16 * 16, 32)
_DEST Temporary_Image

_PRINTMODE _KEEPBACKGROUND

'  CREATE ALL 16 COLORED SPRITE SHEETS
FOR Colr = 0 TO 15

    COLOR _RGB32(_RED(Colors(Colr)), _GREEN(Colors(Colr)), _BLUE(Colors(Colr))) 'Colors(Colr) '_RGB32(255, 255, 0)

    FOR C = 0 TO 255
        x = 8 * (C MOD 16)
        y = 16 * INT(C / 16)
        _PRINTSTRING (x, y), CHR$(C)
    NEXT

    '  COPY TEXT SPRITE SHEET OVER TO HARDWARE IMAGE
    Text_Sprite_Sheet(Colr) = _COPYIMAGE(Temporary_Image, 33)

NEXT

'  DELETE TEMP IMAGE
_FREEIMAGE Temporary_Image

'  CREATE A TEMPORARY IMAGE TO STORE THE BALL IMAGE IN
Temporary_Image = _NEWIMAGE(64, 64, 32)
_DEST Temporary_Image

'  CREATE THE COLORFUL BALL
FOR Radius = _WIDTH(Temporary_Image) / 2 - 1 TO 0 STEP -2
    NewColor& = _RGB32(0, Radius + 32, 0) '_RGB32(RND * 64 + 96, RND * 64 + 96, RND * 64 + 96)
    CIRCLE (_WIDTH(Temporary_Image) / 2 - 1, _HEIGHT(Temporary_Image) / 2 - 1), Radius, NewColor&
    PAINT (_WIDTH(Temporary_Image) / 2 - 1, _HEIGHT(Temporary_Image) / 2 - 1), NewColor&
NEXT

'hwPrintStr (_WIDTH(Temporary_Image) - 8) / 2, (_HEIGHT(Temporary_Image) - 16) / 2, Text_Sprite_Sheet(3), CHR$(2)
'hwPrintStr 8, 8, Text_Sprite_Sheet(15), "#"

'  COPY BALL TEMP IMAGE OVER TO HARDWARE IMAGE
Ball_Image = _COPYIMAGE(Temporary_Image, 33)

'  DELETE TEMP IMAGE
_FREEIMAGE Temporary_Image


_SOURCE 0
_DEST 0

Msg1$ = "TJP'S HARDWARE ACCELERATED TEXT DEMO"
Msg2$ = "<---===== THESE ARE THE TEXT SPRITE SHEETS IN 16 COLORS =====--->"

Text_X0 = RND * (Window_Width - 8 * LEN(Msg1$))
Text_Y0 = RND * (Window_Height - 16)

Text_X_Direction = RND * 2
Text_Y_Direction = RND * 2

IF Text_X_Direction = 0 THEN Text_X_Direction = -1
IF Text_Y_Direction = 0 THEN Text_Y_Direction = -1

TextXSpeed = RND * 3
TextYSpeed = RND * 3

Text_X_Direction = Text_X_Direction * TextXSpeed
Text_Y_Direction = Text_Y_Direction * TextYSpeed

Text_Sprite_Margin = 32
Text_Sprite_Stepping = (Window_Width - 0 - (Text_Sprite_Margin * 3)) / (UBOUND(Text_Sprite_Sheet) + 0)

'  GAME LOOP
DO

    _LIMIT 60


    '  DRAW A BUNCH OFF BALLS AT RANDOM
    FOR i = 0 TO UBOUND(balls)

        _PUTIMAGE (Balls(i).x - _WIDTH(Ball_Image) / 2, Balls(i).y - _HEIGHT(Ball_Image) / 2), Ball_Image, 0

        hwPrintStr Balls(i).x - _WIDTH(Ball_Image) / 8 + 4, Balls(i).y - _HEIGHT(Ball_Image) / 16 - 4, Text_Sprite_Sheet(2), CHR$(Balls(i).Text_Character)

        Balls(i).x = Balls(i).x + Balls(i).X_Direction

        IF Balls(i).x < 0 OR Balls(i).x > _WIDTH(Main_Window) THEN
            Balls(i).X_Direction = -Balls(i).X_Direction
        END IF

        Balls(i).y = Balls(i).y + Balls(i).Y_Direction

        IF Balls(i).y < 0 OR Balls(i).y > _HEIGHT(Main_Window) THEN
            Balls(i).Y_Direction = -Balls(i).Y_Direction
        END IF

    NEXT

    FOR y = -2 TO 2
        FOR x = -2 TO 2
            hwPrintStr Text_X0 + x, Text_Y0 + y, Text_Sprite_Sheet(0), Msg1$
        NEXT
    NEXT

    hwPrintStr Text_X0, Text_Y0, Text_Sprite_Sheet(INT(RND * 16)), Msg1$

    MsgNumber$ = "Counting Number: " + LTRIM$(STR$(Counting_Number))
    Counting_Number = Counting_Number + 13

    FOR y = -2 TO 2
        FOR x = -2 TO 2
            hwPrintStr (_WIDTH(Main_Window) - (8 * LEN(MsgNumber$))) / 2 + x, _HEIGHT(Main_Window) - _HEIGHT(Text_Sprite_Sheet(14)) - Text_Sprite_Margin - 60 + y, Text_Sprite_Sheet(0), MsgNumber$
        NEXT
    NEXT

    hwPrintStr (_WIDTH(Main_Window) - (8 * LEN(MsgNumber$))) / 2, _HEIGHT(Main_Window) - _HEIGHT(Text_Sprite_Sheet(14)) - Text_Sprite_Margin - 60, Text_Sprite_Sheet(14), MsgNumber$

    FOR y = -2 TO 2
        FOR x = -2 TO 2
            hwPrintStr (_WIDTH(Main_Window) - (8 * LEN(Msg2$))) / 2 + x, _HEIGHT(Main_Window) - _HEIGHT(Text_Sprite_Sheet(14)) - Text_Sprite_Margin - 40 + y, Text_Sprite_Sheet(0), Msg2$
        NEXT
    NEXT

    hwPrintStr (_WIDTH(Main_Window) - (8 * LEN(Msg2$))) / 2, _HEIGHT(Main_Window) - _HEIGHT(Text_Sprite_Sheet(14)) - Text_Sprite_Margin - 40, Text_Sprite_Sheet(14), Msg2$

    FOR Colr = 0 TO 15

        x2 = Colr * Text_Sprite_Stepping + Text_Sprite_Margin
        y2 = Window_Height - _HEIGHT(Text_Sprite_Sheet(Colr)) - Text_Sprite_Margin

        FOR y = -1 TO 1
            FOR x = -1 TO 1
                IF Colr = 0 THEN
                    _PUTIMAGE (x2 + x, y2 + y), Text_Sprite_Sheet(8), 0
                ELSE
                    _PUTIMAGE (x2 + x, y2 + y), Text_Sprite_Sheet(0), 0
                END IF
            NEXT

            _PUTIMAGE (x2, y2), Text_Sprite_Sheet(Colr), 0
        NEXT

    NEXT

    _DISPLAY

    Text_X0 = Text_X0 + Text_X_Direction
    Text_Y0 = Text_Y0 + Text_Y_Direction

    IF Text_X0 < 0 OR Text_X0 > (_WIDTH(Main_Window) - 8 * LEN(Msg1$)) THEN Text_X_Direction = -Text_X_Direction
    IF Text_Y0 < 0 OR Text_Y0 > (_HEIGHT(Main_Window) - 16) THEN Text_Y_Direction = -Text_Y_Direction

    Keys& = _KEYHIT
    IF Keys& = 27 THEN SYSTEM

LOOP




SUB hwPrintStr (x_Start AS INTEGER, y_Start AS INTEGER, Text_Sprite_Sheet AS LONG, String_To_Print AS STRING)

    '  THIS DEMO SUB DOES NOT WRAP TEXT ON THE SCREEN, NOR DOES IT ADVANCE LINES.
    '  ALSO THIS DEMO SUB ASSUMES

    '  LOOP THROUGH THE STRING
    FOR c = 1 TO LEN(String_To_Print)

        '  GET THE CURRENT CHARACTER ASC VALUE
        Char = ASC(MID$(String_To_Print, c, 1))

        '  DEFINE THE X, Y COORDINATES OF THE CHARACTER IN THE SPRITE SHEET. THIS DEMO
        '  ASSUMES IT IS QB64'S DEFAULT FONT
        Sprite_Sheet_Character_X = 8 * (Char MOD 16)
        Sprite_Sheet_Character_Y = 16 * INT(Char / 16)

        '  DRAW THE TEXT ON SCREEN USING HARDWARE ACCELERATION
        _PUTIMAGE (x_Start + (c - 1) * 8, y_Start), Text_Sprite_Sheet, 0, (Sprite_Sheet_Character_X, Sprite_Sheet_Character_Y)-(Sprite_Sheet_Character_X + 7, Sprite_Sheet_Character_Y + 15)

    NEXT


END SUB


