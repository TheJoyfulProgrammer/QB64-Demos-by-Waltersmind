CONST TRUE = -1
CONST FALSE = 0

TYPE Gradient
    Spectrum AS _MEM
END TYPE

DIM SHARED NumberOfRays AS _UNSIGNED INTEGER
DIM SHARED RayAngleWidth AS _FLOAT
DIM SHARED Degree AS _FLOAT
DIM SHARED AspectRatio AS DOUBLE
DIM SHARED Logo AS LONG

DIM SHARED Gradients(0) AS Gradient

_TITLE "The Joyful Programmer's Spinning Sun Rays"

SCREEN _NEWIMAGE(800, 142, 32)

temp& = _LOADIMAGE("TheJoyfulProgrammer_LOGO1.png", 32)
Logo = _COPYIMAGE(temp&, 33)

NumberOfRays = 30
Degree = _PI / 180
RayAngleWidth = (360 / NumberOfRays) * Degree

AspectRatio = _WIDTH(_DEST) / _HEIGHT(_DEST)

DefineGradient Gradients(0), "S00 RGBC00000 SC8 RGB300000 SFF RGBC00000"

DO
    '_LIMIT 1


    k& = _KEYHIT
    IF k& = 27 THEN SYSTEM

    _PUTIMAGE ((_WIDTH(0) - _WIDTH(Logo)) / 2, (_HEIGHT(0) - _HEIGHT(Logo)) / 2), Logo

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



SUB DefineGradient (CurrentGradient AS Gradient, GradientString AS STRING)

    CONST EsNone = 0
    CONST EsColorStop = 1
    CONST EsRGB = 2
    CONST isRGB = 1
    CONST isRGBA = 2

    DIM StartPosition AS _UNSIGNED INTEGER
    DIM EndPosition AS _UNSIGNED INTEGER
    DIM StopColor AS _UNSIGNED LONG
    DIM StopPosition AS _UNSIGNED _BYTE
    DIM EncodeStatus AS INTEGER
    DIM ColorType AS _BYTE
    DIM Red AS _UNSIGNED _BYTE
    DIM Green AS _UNSIGNED _BYTE
    DIM Blue AS _UNSIGNED _BYTE
    DIM Alpha AS _UNSIGNED _BYTE
    DIM SavedGradientData AS _MEM
    DIM TempGradientData AS _MEM
    DIM GradientData AS _MEM

    ' GRADIENTDATA CONTAINS 5 BYTES TO HOLD 1-BYTE COLOR STOP POSITION, 4-BYTES FOR RGBA COLORS
    GradientData = _MEMNEW(5)

    StartPosition = 1
    EndPosition = StartPosition

    IF GradientString = "" THEN
        IF _MEMEXISTS(SavedGradientData) = TRUE THEN _MEMFREE SavedGradientData
        IF _MEMEXISTS(TempGradientData) = TRUE THEN _MEMFREE TempGradientData
        IF _MEMEXISTS(GradientData) = TRUE THEN _MEMFREE GradientData
        IF _MEMEXISTS(CurrentGradient.Spectrum) = TRUE THEN _MEMFREE CurrentGradient.Spectrum
        EXIT SUB
    END IF

    GradientString = UCASE$(GradientString)

    DO

        SELECT CASE MID$(GradientString, StartPosition, 1)


            CASE "S" ' "S" REPRESENTS THE CURRENT COLOR STOP

                ' CHECK TO MAKE SURE THERE ARE TWO CHARACTERS AFTER THE "S"
                IF LEN(GradientString) - StartPosition < 3 THEN
                    IF _MEMEXISTS(SavedGradientData) = TRUE THEN _MEMFREE SavedGradientData
                    IF _MEMEXISTS(TempGradientData) = TRUE THEN _MEMFREE TempGradientData
                    IF _MEMEXISTS(GradientData) = TRUE THEN _MEMFREE GradientData
                    IF _MEMEXISTS(CurrentGradient.Spectrum) = TRUE THEN _MEMFREE CurrentGradient.Spectrum
                    EXIT SUB
                END IF

                ' CHECK TO MAKE SURE THE TWO NUMBERS ARE IN HEXIDECIMAL
                IF isHex(MID$(GradientString, StartPosition + 1, 2)) = FALSE THEN
                    IF _MEMEXISTS(SavedGradientData) = TRUE THEN _MEMFREE SavedGradientData
                    IF _MEMEXISTS(TempGradientData) = TRUE THEN _MEMFREE TempGradientData
                    IF _MEMEXISTS(GradientData) = TRUE THEN _MEMFREE GradientData
                    IF _MEMEXISTS(CurrentGradient.Spectrum) = TRUE THEN _MEMFREE CurrentGradient.Spectrum
                    EXIT SUB
                END IF

                ' GET THE COLOR STOP POSITION
                StopPosition = VAL("&h" + MID$(GradientString, StartPosition + 1, 2))

                ' STORE THE "COLOR STOP" DATA INTO THE GRADIENT MEMORY
                _MEMPUT GradientData, GradientData.OFFSET, StopPosition

                ' INCREMENT THE START POSITION
                StartPosition = StartPosition + 3

                ' INCREMENT MEMORY POSITION
                'MemPosition = MemPosition + 1

                ' SET THE ENCODE STATUS TO LET THE NEXT ITERATION KNOW WHAT IS EXPECTED.
                EncodeStatus = EsColorStop

            CASE "R"

                ' CHECK TO SEE IF A COLOR STOP POSITION WAS DEFINED. IF NOT< THEN THERE WAS AN ERROR
                IF EncodeStatus <> EsColorStop THEN
                    IF _MEMEXISTS(SavedGradientData) = TRUE THEN _MEMFREE SavedGradientData
                    IF _MEMEXISTS(TempGradientData) = TRUE THEN _MEMFREE TempGradientData
                    IF _MEMEXISTS(GradientData) = TRUE THEN _MEMFREE GradientData
                    IF _MEMEXISTS(CurrentGradient.Spectrum) = TRUE THEN _MEMFREE CurrentGradient.Spectrum
                    EXIT SUB
                END IF

                ' CHECK TO MAKE SURE THERE IS MORE CHARATERS AFTER THE "R". IF NOT, THERE IS AN ERROR
                IF LEN(GradientString) - StartPosition < 4 THEN
                    IF _MEMEXISTS(SavedGradientData) = TRUE THEN _MEMFREE SavedGradientData
                    IF _MEMEXISTS(TempGradientData) = TRUE THEN _MEMFREE TempGradientData
                    IF _MEMEXISTS(GradientData) = TRUE THEN _MEMFREE GradientData
                    IF _MEMEXISTS(CurrentGradient.Spectrum) = TRUE THEN _MEMFREE CurrentGradient.Spectrum
                    EXIT SUB
                END IF

                ' CHECK TO SEE IF RGBA OR RGB WAS USED TO DEFINE THE STOP COLOR
                IF MID$(GradientString, StartPosition, 4) <> "RGBA" THEN

                    ' THE FOUR CHARACTERS ARE NOT "RGBA" SO CHECK TO SEE IF IT IS "RGB"
                    IF MID$(GradientString, StartPosition, 3) <> "RGB" THEN
                        ' THE THREE CHARACTERS ARE NOT RGB EITHER, SO THERE IS AN ERROR
                        IF _MEMEXISTS(SavedGradientData) = TRUE THEN _MEMFREE SavedGradientData
                        IF _MEMEXISTS(TempGradientData) = TRUE THEN _MEMFREE TempGradientData
                        IF _MEMEXISTS(GradientData) = TRUE THEN _MEMFREE GradientData
                        IF _MEMEXISTS(CurrentGradient.Spectrum) = TRUE THEN _MEMFREE CurrentGradient.Spectrum
                        EXIT SUB
                    ELSE

                        ' YES, IT IS "RGB" SO SET THE START POSITION PAST THOSE LETTERS
                        StartPosition = StartPosition + 3

                        ' NOW CHECK TO MAKE SURE THE NEXT SIX CHARACTERS ARE A 6-DIGIT HEXIDECIMAL VALUE
                        IF isHex(MID$(GradientString, StartPosition, 6)) = FALSE THEN
                            ' IS NOT A 6-DIGIT HEXIDECIMAL VALUE, SO THERE IS AN ERROR
                            IF _MEMEXISTS(SavedGradientData) = TRUE THEN _MEMFREE SavedGradientData
                            IF _MEMEXISTS(TempGradientData) = TRUE THEN _MEMFREE TempGradientData
                            IF _MEMEXISTS(GradientData) = TRUE THEN _MEMFREE GradientData
                            IF _MEMEXISTS(CurrentGradient.Spectrum) = TRUE THEN _MEMFREE CurrentGradient.Spectrum
                            EXIT SUB
                        END IF

                        ' WE CAN SAFELY SAY THE COLOR TYPE IS "RGB"
                        ColorType = isRGB

                        ' SET THE ALPHA TO "FF" SINCE AN ALPHA COLOR WASN'T DEFINED
                        Alpha = 255

                    END IF

                ELSE

                    ' YES, IT IS "RGB" SO SET THE START POSITION PAST THOSE LETTERS
                    StartPosition = StartPosition + 4

                    ' NOW CHECK TO MAKE SURE THE NEXT EIGHT CHARACTERS ARE A 8-DIGIT HEXIDECIMAL VALUE
                    IF isHex(MID$(GradientString, StartPosition, 8)) = FALSE THEN
                        ' IS NOT A 6-DIGIT HEXIDECIMAL VALUE, SO THERE IS AN ERROR
                        IF _MEMEXISTS(SavedGradientData) = TRUE THEN _MEMFREE SavedGradientData
                        IF _MEMEXISTS(TempGradientData) = TRUE THEN _MEMFREE TempGradientData
                        IF _MEMEXISTS(GradientData) = TRUE THEN _MEMFREE GradientData
                        IF _MEMEXISTS(CurrentGradient.Spectrum) = TRUE THEN _MEMFREE CurrentGradient.Spectrum
                        EXIT SUB
                    END IF

                    ' THE COLOR TYPE IS RGBA
                    ColorType = isRGBA

                    ' WE CAN SET THE RGBA ALPHA VALUE HERE SINCE WE NEED TO MAKE SURE IT
                    ' EXISTS IN THE GRADIENT STRING
                    Alpha = VAL("&H" + MID$(GradientString, StartPosition, 6))

                END IF

                ' AT THIS POINT, THE ALPHA COLOR VALUE HAS BEEN DEFINED, SO WE NEED TO DEFINE
                ' THE RED, GREEN, AND BLUE VALUES AS WELL
                Red = VAL("&H" + MID$(GradientString, StartPosition, 2))
                Green = VAL("&H" + MID$(GradientString, StartPosition + 2, 2))
                Blue = VAL("&H" + MID$(GradientString, StartPosition + 4, 2))

                StopColor = _RGBA32(Red, Green, Blue, Alpha)

                ' SAVE THE COLOR DATA IN THE GRADIENT DATA MEMORY
                _MEMPUT GradientData, GradientData.OFFSET + 1, StopColor

                ' WE ARE DONE DEFINING THE STOP POSITION AND COLOR, SO SET STATUS AS NONE
                EncodeStatus = EsNone

                ' INCREASE THE START POSITION PAST THE RGB OR RGBA COLOR HEX DATA
                StartPosition = StartPosition + 6 + -2 * (ColorType = isRGBA)

                ' SINCE WE ARE ONLY LOOKING FOR THE COLOR STOP POSITION AND COLOR VALUES HERE,
                ' WE CAN NOW STORE THE CURRENT ENCODED DATA INTO MEMORY

                ' CREATE A TEMPORARY MEMORY BLOCK TO BACKUP THE SAVED GRADIENT DATA
                TempGradientData = _MEMNEW(SavedGradientData.SIZE + GradientData.SIZE)

                IF _MEMEXISTS(SavedGradientData) THEN
                    ' COPY THE SAVED GRADIENT MEMORY BLOCK TO THE TEMPORARY MEMORY BLOCK
                    _MEMCOPY SavedGradientData, SavedGradientData.OFFSET, SavedGradientData.SIZE TO TempGradientData, TempGradientData.OFFSET
                    ' REMOVE CURRENT USED MEMORY BLOCK FOR THE SAVED GRADIENT DATA
                    _MEMFREE SavedGradientData
                END IF

                ' COPY THE GRADIENT DATA INTO THE TEMPORY MEMORY BLOCK
                _MEMCOPY GradientData, GradientData.OFFSET, GradientData.SIZE TO TempGradientData, TempGradientData.OFFSET + TempGradientData.SIZE - GradientData.SIZE

                ' CREATE A NEW, BUT BIGGER MEMORY BLOCK FOR THE SAVED GRADIENT DATA
                SavedGradientData = _MEMNEW(TempGradientData.SIZE)

                ' COPY THE TEMPORARY GRADIENT DATA MEMORY BLCK TO THE SAVED GRADIENT DATA MEMORY BLOCK
                _MEMCOPY TempGradientData, TempGradientData.OFFSET, TempGradientData.SIZE TO SavedGradientData, SavedGradientData.OFFSET

                ' REMOVE THE TEMPORARY GRADIENT DATA MEMORY BLOCK
                _MEMFREE TempGradientData

            CASE ELSE
                StartPosition = StartPosition + 1

        END SELECT

    LOOP WHILE StartPosition < LEN(GradientString)


    ' IF THE LAST STOP POSITION IS NOT 255 (&hFF) THEN CREATE IT AND COPY THE LAST RGBA COLOR
    IF StopPosition < 255 THEN
        ' SET THE COLOR STOP POSITION
        StopPosition = 255

        ' STORE THE "COLOR STOP" DATA INTO THE GRADIENT MEMORY
        _MEMPUT GradientData, GradientData.OFFSET, StopPosition

        ' SAVE THE COLOR DATA IN THE GRADIENT DATA MEMORY
        _MEMPUT GradientData, GradientData.OFFSET + 1, StopColor

        ' CREATE A TEMPORARY MEMORY BLOCK TO BACKUP THE SAVED GRADIENT DATA
        TempGradientData = _MEMNEW(SavedGradientData.SIZE + GradientData.SIZE)

        IF _MEMEXISTS(SavedGradientData) THEN
            ' COPY THE SAVED GRADIENT MEMORY BLOCK TO THE TEMPORARY MEMORY BLOCK
            _MEMCOPY SavedGradientData, SavedGradientData.OFFSET, SavedGradientData.SIZE TO TempGradientData, TempGradientData.OFFSET
            ' REMOVE CURRENT USED MEMORY BLOCK FOR THE SAVED GRADIENT DATA
            _MEMFREE SavedGradientData
        END IF

        ' COPY THE GRADIENT DATA INTO THE TEMPORY MEMORY BLOCK
        _MEMCOPY GradientData, GradientData.OFFSET, GradientData.SIZE TO TempGradientData, TempGradientData.OFFSET + TempGradientData.SIZE - GradientData.SIZE

        ' CREATE A NEW, BUT BIGGER MEMORY BLOCK FOR THE SAVED GRADIENT DATA
        SavedGradientData = _MEMNEW(TempGradientData.SIZE)

        ' COPY THE TEMPORARY GRADIENT DATA MEMORY BLCK TO THE SAVED GRADIENT DATA MEMORY BLOCK
        _MEMCOPY TempGradientData, TempGradientData.OFFSET, TempGradientData.SIZE TO SavedGradientData, SavedGradientData.OFFSET

        ' REMOVE THE TEMPORARY GRADIENT DATA MEMORY BLOCK
        _MEMFREE TempGradientData

    END IF

    ' RELEASE ANY MEMORY USED IN THE CURRENT GRADIENT DATA MEMORY BLOCK
    IF _MEMEXISTS(CurrentGradient.Spectrum) = TRUE THEN _MEMFREE CurrentGradient.Spectrum

    ' CREATE THE CURRENT GRADIENT DATA MEMORY BLOCK
    CurrentGradient.Spectrum = _MEMNEW(SavedGradientData.SIZE)

    _MEMCOPY SavedGradientData, SavedGradientData.OFFSET, SavedGradientData.SIZE TO CurrentGradient.Spectrum, CurrentGradient.Spectrum.OFFSET

    ' FREE ALL MEMORY BLOCKS USED IN THIS SUB-ROUTINE
    IF _MEMEXISTS(SavedGradientData) = TRUE THEN _MEMFREE SavedGradientData
    IF _MEMEXISTS(TempGradientData) = TRUE THEN _MEMFREE TempGradientData
    IF _MEMEXISTS(GradientData) = TRUE THEN _MEMFREE GradientData

END SUB



FUNCTION isHex (TestString AS STRING)

    DIM HexString AS STRING
    DIM BadChars AS _UNSIGNED LONG

    HexString = "0123456789ABCDEF"

    FOR i = 1 TO LEN(TestString)
        IF INSTR(HexString, UCASE$(MID$(TestString, i, 1))) = 0 THEN BadChars = BadChars + 1
    NEXT

    IF BadChars = 0 THEN
        isHex = TRUE
    ELSE
        isHex = FALSE
    END IF

END FUNCTION

