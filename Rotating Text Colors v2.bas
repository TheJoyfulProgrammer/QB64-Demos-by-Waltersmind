' ColorState:
'              Byte    01 = Red State (Available Values: 0 = LOCKED, 1 = FADE IN, 2 = FADE OUT)
'              Byte 02-03 = Red's Current Step (Available Values: 00 - MAX VALUE (BYTES 10-11))
'              Byte    04 = Green State (Available Values: 0 = LOCKED, 1 = FADE IN, 2 = FADE OUT)
'              Byte 05-06 = Green's Current Step (Available Values: 00 - MAX VALUE (BYTES 10-11))
'              Byte    07 = Blue State (Available Values: 0 = LOCKED, 1 = FADE IN, 2 = FADE OUT)
'              Byte 08-09 = Blue's Current Step (Available Values: 00 - MAX VALUE (BYTES 10-11))
'              Byte 10-11 = Max Number of steps per color (Available Values: 00 - FF)
'
DIM SHARED ColorState AS STRING * 11

'ColorState = "02010000020" ' Start the ColorState off with bright red and fade in on green
ColorState = "02010000020" ' Start the ColorState off with bright red and fade in on green

SCREEN _NEWIMAGE(906, 600, 32)
_TITLE "Rotating Colors in Text Strings Ver 2"

Timer1 = _FREETIMER
ON TIMER(Timer1, .01) GOSUB UpdateColorState

_PRINTMODE _KEEPBACKGROUND

TIMER(Timer1) ON
DO
    _LIMIT 30

    LOCATE 3, 5: PrintColor "Welcome to my world of colors! Oh so beautiful colors they are!"
    LOCATE 5, 5: PrintColor "I love rotating colors on these lines of text."
    LOCATE 7, 5: PrintColor "This could be expanded to any amount of colors the developer chooses."

    LOCATE 14, 11: PrintColor "²²²²²²²²\ ²²\                          ²²²²²\                      ²²²²²²\            ²²\"
    LOCATE 15, 11: PrintColor "\__²²  __|²² |                         \__²² |                    ²²  __²²\           ²² |"
    LOCATE 16, 11: PrintColor "   ²² |   ²²²²²²²\   ²²²²²²\              ²² | ²²²²²²\  ²²\   ²²\ ²² /  \__|²²\   ²²\ ²² |"
    LOCATE 17, 11: PrintColor "   ²² |   ²²  __²²\ ²²  __²²\             ²² |²²  __²²\ ²² |  ²² |²²²²\     ²² |  ²² |²² |"
    LOCATE 18, 11: PrintColor "   ²² |   ²² |  ²² |²²²²²²²² |      ²²\   ²² |²² /  ²² |²² |  ²² |²²  _|    ²² |  ²² |²² |"
    LOCATE 19, 11: PrintColor "   ²² |   ²² |  ²² |²²   ____|      ²² |  ²² |²² |  ²² |²² |  ²² |²² |      ²² |  ²² |²² |"
    LOCATE 20, 11: PrintColor "   ²² |   ²² |  ²² |\²²²²²²²\       \²²²²²²  |\²²²²²²  |\²²²²²²² |²² |      \²²²²²²  |²² |"
    LOCATE 21, 11: PrintColor "   \__|   \__|  \__| \_______|       \______/  \______/  \____²² |\__|       \______/ \__|"
    LOCATE 22, 11: PrintColor "                                                        ²²\   ²² |"
    LOCATE 23, 11: PrintColor "                                                        \²²²²²²  |"
    LOCATE 24, 11: PrintColor "                                                         \______/"
    LOCATE 25, 4: PrintColor "²²²²²²²\"
    LOCATE 26, 4: PrintColor "²²  __²²\"
    LOCATE 27, 4: PrintColor "²² |  ²² | ²²²²²²\   ²²²²²²\   ²²²²²²\   ²²²²²²\  ²²²²²²\  ²²²²²²\²²²²\  ²²²²²²\²²²²\   ²²²²²²\   ²²²²²²\"
    LOCATE 28, 4: PrintColor "²²²²²²²  |²²  __²²\ ²²  __²²\ ²²  __²²\ ²²  __²²\ \____²²\ ²²  _²²  _²²\ ²²  _²²  _²²\ ²²  __²²\ ²²  __²²\"
    LOCATE 29, 4: PrintColor "²²  ____/ ²² |  \__|²² /  ²² |²² /  ²² |²² |  \__|²²²²²²² |²² / ²² / ²² |²² / ²² / ²² |²²²²²²²² |²² |  \__|"
    LOCATE 30, 4: PrintColor "²² |      ²² |      ²² |  ²² |²² |  ²² |²² |     ²²  __²² |²² | ²² | ²² |²² | ²² | ²² |²²   ____|²² |"
    LOCATE 31, 4: PrintColor "²² |      ²² |      \²²²²²²  |\²²²²²²² |²² |     \²²²²²²² |²² | ²² | ²² |²² | ²² | ²² |\²²²²²²²\ ²² |"
    LOCATE 32, 4: PrintColor "\__|      \__|       \______/  \____²² |\__|      \_______|\__| \__| \__|\__| \__| \__| \_______|\__|"
    LOCATE 33, 4: PrintColor "                              ²²\   ²² |"
    LOCATE 34, 4: PrintColor "                              \²²²²²²  |"
    LOCATE 35, 4: PrintColor "                               \______/"

    LOCATE 12, 2: PrintColor "É" + STRING$(109, "Í") + "»"

    FOR y = 13 TO 36
        LOCATE y, 2: PrintColor "º" + SPACE$(109) + "º"
    NEXT

    LOCATE 37, 2: PrintColor "È" + STRING$(109, "Í") + "¼"


    _DISPLAY

LOOP WHILE INKEY$ = ""

TIMER(Timer1) FREE

SYSTEM



UpdateColorState:

ColorState = AlterColorState$(ColorState)

RETURN


'
' PrintColor SUB
'
SUB PrintColor (Text AS STRING)

    DIM CurrentColorState AS STRING * 11
    DIM ColorStep AS DOUBLE

    CurrentColorState = ColorState
    ColorStep = 256 / VAL("&h" + MID$(CurrentColorState, 10, 2))

    FOR C = 1 TO LEN(Text)

        Red = VAL("&H" + MID$(CurrentColorState, 2, 2)) * ColorStep
        Green = VAL("&H" + MID$(CurrentColorState, 5, 2)) * ColorStep
        Blue = VAL("&H" + MID$(CurrentColorState, 8, 2)) * ColorStep

        COLOR _RGB32(Red, Green, Blue)

        PRINT MID$(Text, C, 1);

        CurrentColorState = AlterColorState$(CurrentColorState)

    NEXT

END SUB


'
' AlterColorState$ FUNCTION
'
FUNCTION AlterColorState$ (OldColorState AS STRING * 11)

    DIM MaxStep AS _UNSIGNED _BYTE

    MaxStep = VAL("&h" + MID$(OldColorState, 10, 2))

    ' Do logic on the RED color
    SELECT CASE MID$(OldColorState, 1, 1)

        ' Check to see of the RED step needs to increment
        CASE "1"
            ' Get the CurrentStep of the RED color and increment it.
            CurrentStep = VAL("&h" + MID$(OldColorState, 2, 2)) + 1

            ' Store the new CurrentStep value
            MID$(OldColorState, 2, 2) = RIGHT$("0" + HEX$(CurrentStep), 2)

            ' See if the Current Step for the RED color is at it's max
            IF CurrentStep = MaxStep THEN
                ' Lock the RED color state
                MID$(OldColorState, 1, 1) = "0"
                ' Since we know this is the RED color and we just locked it, then
                ' set the BLUE color state to FadeOut
                MID$(OldColorState, 7, 1) = "2"
            END IF

            ' Check to see of the RED step needs to decrement
        CASE "2"

            ' Get the CurrentStep of the RED color and decrement it.
            CurrentStep = VAL("&h" + MID$(OldColorState, 2, 2)) - 1

            ' Store the new CurrentStep value
            MID$(OldColorState, 2, 2) = RIGHT$("0" + HEX$(CurrentStep), 2)

            ' See of the CurrentStep for the RED color is at zero
            IF CurrentStep = 0 THEN
                ' Lock the RED color state
                MID$(OldColorState, 1, 1) = "0"
                ' Since we know this is the RED color and we just locked it, then
                ' set the BLUE color state to FadeIn
                MID$(OldColorState, 7, 1) = "1"
            END IF

    END SELECT

    ' Do logic on the GREEN color
    SELECT CASE MID$(OldColorState, 4, 1)

        ' Check to see of the RED step needs to increment
        CASE "1"
            ' Get the CurrentStep of the RED color and increment it.
            CurrentStep = VAL("&h" + MID$(OldColorState, 5, 2)) + 1

            ' Store the new CurrentStep value
            MID$(OldColorState, 5, 2) = RIGHT$("0" + HEX$(CurrentStep), 2)

            ' See if the Current Step for the GREEN color is at it's max
            IF CurrentStep = MaxStep THEN
                ' Lock the GREEN color state
                MID$(OldColorState, 4, 1) = "0"
                ' Since we know this is the GREEN color and we just locked it, then
                ' set the RED color state to FadeOut
                MID$(OldColorState, 1, 1) = "2"
            END IF

            ' Check to see of the GREEN step needs to decrement
        CASE "2"

            ' Get the CurrentStep of the RED color and decrement it.
            CurrentStep = VAL("&h" + MID$(OldColorState, 5, 2)) - 1

            ' Store the new CurrentStep value
            MID$(OldColorState, 5, 2) = RIGHT$("0" + HEX$(CurrentStep), 2)

            ' See of the CurrentStep for the RED color is at zero
            IF CurrentStep = 0 THEN
                ' Lock the GREEN color state
                MID$(OldColorState, 4, 1) = "0"
                ' Since we know this is the GREEN color and we just locked it, then
                ' set the RED color state to FadeIn
                MID$(OldColorState, 1, 1) = "1"
            END IF

    END SELECT


    ' Do logic on the BLUE color
    SELECT CASE MID$(OldColorState, 7, 1)

        ' Check to see of the BLUE step needs to increment
        CASE "1"
            ' Get the CurrentStep of the BLUE color and increment it.
            CurrentStep = VAL("&h" + MID$(OldColorState, 8, 2)) + 1

            ' Store the new CurrentStep value
            MID$(OldColorState, 8, 2) = RIGHT$("0" + HEX$(CurrentStep), 2)

            ' See if the Current Step for the BLUE color is at it's max
            IF CurrentStep = MaxStep THEN
                ' Lock the BLUE color state
                MID$(OldColorState, 7, 1) = "0"
                ' Since we know this is the BLUE color and we just locked it, then
                ' set the GREEN color state to FadeOut
                MID$(OldColorState, 4, 1) = "2"
            END IF

            ' Check to see of the BLUE step needs to decrement
        CASE "2"

            ' Get the CurrentStep of the BLUE color and decrement it.
            CurrentStep = VAL("&h" + MID$(OldColorState, 8, 2)) - 1

            ' Store the new CurrentStep value
            MID$(OldColorState, 8, 2) = RIGHT$("0" + HEX$(CurrentStep), 2)

            ' See of the CurrentStep for the BLUE color is at zero
            IF CurrentStep = 0 THEN
                ' Lock the BLUE color state
                MID$(OldColorState, 7, 1) = "0"
                ' Since we know this is the BLUE color and we just locked it, then
                ' set the GREEN color state to FadeIn
                MID$(OldColorState, 4, 1) = "1"
            END IF

    END SELECT

    AlterColorState$ = OldColorState

END FUNCTION

