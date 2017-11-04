$RESIZE:ON

TYPE Counties
    StartX AS INTEGER
    StartY AS INTEGER
    EndX AS INTEGER
    EndY AS INTEGER
    CountyImage AS LONG
    CountyMask AS LONG
END TYPE

TYPE TempLocation
    X AS INTEGER
    Y AS INTEGER
END TYPE

DIM SHARED Canvas AS LONG
DIM SHARED County_Map AS LONG
DIM SHARED MainWindow AS LONG
DIM SHARED DeskTop AS _UNSIGNED LONG
DIM SHARED DeskTop_Width AS _UNSIGNED LONG
DIM SHARED DeskTop_Height AS _UNSIGNED LONG
DIM SHARED MapMargin AS INTEGER
DIM SHARED MapRatio AS SINGLE
DIM SHARED Numbers AS LONG
DIM SHARED TempLocations(65) AS TempLocation

REDIM SHARED County(48) AS Counties
REDIM SHARED Mask(-1) AS LONG ' *** This will be a common array for all masking operations. Set it to -1 until we find out how big it needs to be.

' *** Get information about the current desktop
DeskTop = _SCREENIMAGE ' *** Capture the Desktop image
DeskTop_Width = _WIDTH(DeskTop) ' *** Get the Desktop Width
DeskTop_Height = _HEIGHT(DeskTop) ' *** Get the Desktop Height

' *** Increase this value to add more space between the map and the purple-outlined edge.
MapMargin = 30

' *** Create the main application Window
MainWindow = _NEWIMAGE(1280, 720, 32) 'DeskTop_Width - 100, DeskTop_Height - 200, 32)
SCREEN MainWindow

' *** Old way of centering the screen
_SCREENMOVE (DeskTop_Width - _WIDTH(MainWindow)) / 2, (DeskTop_Height - _HEIGHT(MainWindow)) / 2 - 29 ' *** Center Window

' *** Load the needed images
County_Map = _LOADIMAGE("Algeria-Mask-Map-1080p.png")
Numbers = _LOADIMAGE("Numbers_220x30.png")

' *** The "Canvas" image is where the map scene is rendered before it is placed on to the application's main window.
Canvas = _NEWIMAGE(_WIDTH(County_Map) + MapMargin * 2, _HEIGHT(County_Map) + MapMargin * 2, 32)

MapRatio = _WIDTH(Canvas) / _HEIGHT(Canvas)

' *** Now we enlarge the Mask() array to the size of the overall country map.
REDIM SHARED Mask(_WIDTH(County_Map) * _HEIGHT(County_Map) + 4) AS LONG

FOR i = 1 TO 48
    ' *** Set the starting X & Y coordinates to a negative value for later testing
    County(i).StartX = -1
    County(i).StartY = -1
NEXT

' *** Read in temperature locations from the DATA section
FOR i = 0 TO 65
    READ TempLocations(i).X, TempLocations(i).Y
NEXT

_SOURCE County_Map

' *** Scan the entire map, pixel-by-pixel, to gather positioning information about the individual counties.
FOR y% = 0 TO _HEIGHT(County_Map) - 1
    FOR x% = 0 TO _WIDTH(County_Map) - 1
        ' *** Test the value in the RED channel only to see if it is nonzero
        IF _RED32(POINT(x%, y%)) > 0 THEN
            ' *** Get the current County number. This is possible because each county in the loaded map image
            ' *** has all three color channels, which are identical, divisible by five. The first county has
            ' *** the color value of _RGB(15, 15, 15).
            CurrentCounty% = (_RED32(POINT(x%, y%)) - 10) / 5

            ' *** Test the County image boundary and modify it as needed.
            IF County(CurrentCounty%).StartX > x% THEN County(CurrentCounty%).StartX = x%
            IF County(CurrentCounty%).StartY > y% THEN County(CurrentCounty%).StartY = y%
            IF County(CurrentCounty%).EndX < x% THEN County(CurrentCounty%).EndX = x%
            IF County(CurrentCounty%).EndY < y% THEN County(CurrentCounty%).EndY = y%
        END IF
    NEXT
NEXT


' *** Since my first idea failed that was suppose to do this in a much simpler way, I decided to do this in a
' *** more archaic way, by brute force.

' *** Let's loop through all counties and create an image for each one.
FOR CurrentCounty% = 1 TO 48

    ' *** Get the width of the current county map
    CountyWidth% = County(CurrentCounty%).EndX - County(CurrentCounty%).StartX + 1

    ' *** Get the height of the current county map
    CountyHeight% = County(CurrentCounty%).EndY - County(CurrentCounty%).StartY + 1

    ' *** The "CountyImage" image is where the color or colors of the county background is drawn.
    County(CurrentCounty%).CountyImage = _NEWIMAGE(CountyWidth%, CountyHeight%, 32)

    ' *** The "CountyMask" image will contain a white [_RGB(255, 255, 255)] version of the county which will be
    ' *** used to mask parts of the county background stored in te "CountyImage" image.
    County(CurrentCounty%).CountyMask = _NEWIMAGE(CountyWidth%, CountyHeight%, 32)

    ' *** Scan through all pixels in the area of the current county on the country map to recreate the image in
    ' *** the new county map.

    ' *** Set the destination image to the current county mask image, and the source to the Algeria county map.
    _DEST County(CurrentCounty%).CountyMask
    _SOURCE County_Map

    ' *** Check to see if the current pixels contains the current county value and if so, draw white pixels on the new
    ' *** county image so it can use later as a mask
    FOR y% = 0 TO CountyHeight%
        FOR x% = 0 TO CountyWidth%
            IF (_RED32(POINT(x% + County(CurrentCounty%).StartX, y% + County(CurrentCounty%).StartY)) - 10) / 5 = CurrentCounty% THEN PSET (x%, y%), _RGB(255, 255, 255)
        NEXT
    NEXT
NEXT

CurrentCounty% = 0

DO

    _LIMIT 3

    ' *** Let's check to see if the user resized the screen, and if so, adjust the screen accordingly.
    SUB_CheckResize (MainWindow)

    ' *** Draw a colored background on the canvas image
    _DEST Canvas
    LINE (0, 0)-(_WIDTH(Canvas), _HEIGHT(Canvas)), _RGB(0, 0, 80), BF

    ' *** Loop through the counties and draw each one.
    FOR CurrentCounty% = 1 TO 48

        _DEST County(CurrentCounty%).CountyImage
        _SOURCE County(CurrentCounty%).CountyMask

        ' *** Draw the background for the current county.
        LINE (0, 0)-(_WIDTH(County(CurrentCounty%).CountyImage) - 1, _HEIGHT(County(CurrentCounty%).CountyImage) - 1), _RGB(RND * 256, RND * 256, RND * 256), BF

        ' *** Store the county image into an array so it can be used as a mask.
        GET (0, 0)-(_WIDTH(County(CurrentCounty%).CountyImage) - 1, _HEIGHT(County(CurrentCounty%).CountyImage) - 1), Mask()

        ' *** Remove everything outside of the county with the county clipping mask.
        PUT (0, 0), Mask(), _CLIP AND

        MapTop% = 5 ' *** Distance from the top of the application window
        MapBottom% = _HEIGHT(MainWindow) - 5 ' *** Distance from the bottom of the application window
        MapHeight% = MapBottom% - MapTop% ' *** Get the new canvas height
        NewWidth% = MapHeight% * MapRatio ' *** Get the new canvas width
        StartX% = (_WIDTH(MainWindow) - NewWidth%) / 2 ' *** Set the x-coordinate to where the canvas will be drawn in the center of the application window.

        ' *** Place the newly colored county image onto the canvas image.
        _PUTIMAGE (County(CurrentCounty%).StartX + MapMargin, County(CurrentCounty%).StartY + MapMargin), County(CurrentCounty%).CountyImage, Canvas
    NEXT

    ' *** Place temperature numbers on the map.
    FOR i = 0 TO 65
        ' *** For this demo, let's get a random temperature and store it in a string
        Temp$ = LTRIM$(RTRIM$(STR$(INT(RND * 200) - 100)))

        ' *** Get the center coordinates for the text on the map
        CenterX% = TempLocations(i).X - (LEN(Temp$) / 2) * (_WIDTH(Numbers) / 11)
        CenterY% = TempLocations(i).Y - _HEIGHT(Numbers) / 2

        ' *** Loop through all characters of the current temperature
        FOR Char = 1 TO LEN(Temp$)
            ' *** Get the next character
            CurrentChar$ = MID$(Temp$, Char, 1)

            ' *** Get the current x-coordinate of the current symbol
            IF CurrentChar$ = "-" THEN
                PosX% = (_WIDTH(Numbers) / 11) * 10
            ELSE
                PosX% = (_WIDTH(Numbers) / 11) * VAL(CurrentChar$)
            END IF

            ' *** Draw current character
            _PUTIMAGE (CenterX% + (Char - 1) * (_WIDTH(Numbers) / 11) + MapMargin, CenterY% + MapMargin), Numbers, Canvas, (PosX%, 0)-(PosX% + (_WIDTH(Numbers) / 11), _HEIGHT(Numbers))

        NEXT
    NEXT

    ' *** Now we can draw everything onto the application's main window
    _DEST MainWindow
    CLS

    ' *** Draw a scaled version of the canvas onto the application window.
    _PUTIMAGE (StartX%, MapTop%)-(StartX% + NewWidth%, MapBottom%), Canvas, MainWindow

    ' *** Draw a border around the scaled canvas image.
    LINE (StartX%, MapTop%)-(StartX% + NewWidth%, MapBottom%), _RGB(255, 0, 255), B

    _DISPLAY

LOOP WHILE INKEY$ = ""

TemperatureLocations:

DATA 843,4,836,34,865,52,819,67,800,39,800,14,747,14
DATA 738,45,705,59,708,13,768,90,658,14,620,14,605,63,558,57
DATA 517,50,468,59,498,83,441,76,465,102,413,90,377,111,346,124
DATA 360,148,395,140,433,135,453,190,476,150,528,120,567,114
DATA 632,151,658,114,683,96,743,136,856,116,755,219,818,220,592,204
DATA 619,239,504,246,449,223,414,283,645,268,717,278,783,323,350,338
DATA 313,406,602,403,794,409,786,507,462,494,30,570,413,622
DATA 586,608,648,653,737,626,851,603,958,570,958,767,785,731
DATA 644,751,557,825,735,827,735,866,512,934,750,1036


' *************************************************************************************************
' *                                                                                               *
' *  CheckResize: This SUB checks if the user resized the window, and if so, recreates the        *
' *               ORIGINAL SCREEN image to the new window size.                                   *
' *                                                                                               *
' *               Developer Note: You must use $RESIZE:ON, $RESIZE:SMOOTH, or $RESIZE:SMOOTH at   *
' *                               the beginning of your project for this to work.                 *
' *                               This SUB only works in QB64-GL only.                            *
' *                                                                                               *
' *************************************************************************************************
SUB SUB_CheckResize (CurrentScreen AS _UNSIGNED LONG)

' *** Define local variable for temporary screen
DIM TempScreen AS _UNSIGNED LONG

' *** Check to see if the user resized the window. If so, change the SCREEN image to the correct size.
IF _RESIZE THEN

    ' *** First, create a copy of the current SCREEN image.
    TempScreen = _COPYIMAGE(CurrentScreen)

    ' *** Set the SCREEN to the copied image, releasing the current SCREEN image.
    SCREEN TempScreen

    ' *** Remove (FREE) the original SCREEN image.
    _FREEIMAGE CurrentScreen

    ' *** Create a new "original" SCREEN image.
    CurrentScreen = _NEWIMAGE(_RESIZEWIDTH, _RESIZEHEIGHT, 32)

    ' *** Set the SCREEN to the new "original" image, releasing the copied SCREEN image.
    SCREEN CurrentScreen

    ' *** Remove (FREE) the copied SCREEN image.
    _FREEIMAGE TempScreen

END IF

END SUB


