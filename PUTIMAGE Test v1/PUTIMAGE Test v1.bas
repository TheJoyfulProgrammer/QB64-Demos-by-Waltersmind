CONST MenuItemSingleHeight = 68
CONST MenuItemDoubleHeight = MenuItemSingleHeight * 2

DIM MainWindow AS LONG
DIM BackgroundImage AS LONG
DIM TitleImage AS LONG
DIM UFOImage AS LONG

DIM MenuItemSelectValue AS _BYTE
DIM RadiusX AS _FLOAT
DIM RadiusY AS _FLOAT
DIM CurrentAngle AS _FLOAT
DIM Degrees AS _FLOAT
DIM CenterX AS INTEGER
DIM CenterY AS INTEGER

Degrees = _PI / 180
MenuItemSelectValue = 0

MainWindow = _NEWIMAGE(800, 600, 32)
SCREEN MainWindow


BackgroundImage = _LOADIMAGE("SCREEN_LOAD_v1.png")
TitleImage = _LOADIMAGE("Main_Screen_Title.png")
UFOImage = _LOADIMAGE("UFO-314x174.png")

RadiusX = (_WIDTH(MainWindow) - _WIDTH(UFOImage)) / 2
RadiusY = (_HEIGHT(MainWindow) - _HEIGHT(UFOImage)) / 2
CenterX = _WIDTH(MainWindow) / 2
CenterY = _HEIGHT(MainWindow) / 2


' START THE GAME LOOP HERE
DO

    _LIMIT 30

    _PUTIMAGE , BackgroundImage, MainWindow

    UFOWidth = (_WIDTH(UFOImage) / 2) - ((_WIDTH(UFOImage) / 2) * ABS(SIN(CurrentAngle * Degrees)))
    UFOHeight = (_HEIGHT(UFOImage) / 2) - ((_HEIGHT(UFOImage) / 2) * ABS(SIN(CurrentAngle * Degrees)))

    UFODestX = CenterX + (RadiusX * SIN(CurrentAngle * Degrees) - (_WIDTH(UFOImage) / 2))
    UFODestY = CenterY + (RadiusY * COS(CurrentAngle * Degrees) - (_HEIGHT(UFOImage) / 2))

    UFODestXa = CenterX - ((RadiusX + UFOWidth) * COS((CurrentAngle + 180) * Degrees) + (_WIDTH(UFOImage) / 2)) + UFOWidth
    UFODestYa = (CenterY + (RadiusY + UFOHeight) * SIN((CurrentAngle + 180) * Degrees) - (_HEIGHT(UFOImage) / 2)) + UFOHeight

    UFODestX2 = (UFODestXa + _WIDTH(UFOImage) - UFOWidth * 2)
    UFODestY2 = (UFODestYa + _HEIGHT(UFOImage) - UFOHeight * 2)

    _PUTIMAGE (UFODestX, UFODestY), UFOImage, MainWindow
    _PUTIMAGE (UFODestXa, UFODestYa)-(UFODestX2, UFODestY2), UFOImage, MainWindow

    CurrentAngle = CurrentAngle + 1


    FOR MenuItem = 0 TO 2
        DestX = (_WIDTH(MainWindow) - _WIDTH(TitleImage)) / 2
        DestY = ((_HEIGHT(MainWindow) - ((MenuItemSingleHeight + 30) * 3)) / 2) + MenuItem * (MenuItemSingleHeight + 10) + 40

        SrcX1 = 0
        SrcY1 = MenuItem * MenuItemDoubleHeight + (ABS(MenuItem <> MenuItemSelectValue) * MenuItemSingleHeight)
        SrcX2 = _WIDTH(TitleImage) - 1
        SrcY2 = SrcY1 + MenuItemSingleHeight - 1
        _PUTIMAGE (DestX, DestY), TitleImage, MainWindow, (SrcX1, SrcY1)-(SrcX2, SrcY2)

    NEXT

    k& = _KEYHIT

    SELECT CASE k&

        CASE 27
            SYSTEM ' <ESC>

        CASE 18432 ' <UP ARROW>
            MenuItemSelectValue = MenuItemSelectValue - 1
            IF MenuItemSelectValue < 0 THEN MenuItemSelectValue = 2

        CASE 20480 ' <DOWN ARROW>
            MenuItemSelectValue = (MenuItemSelectValue + 1) MOD 3

    END SELECT

    _DISPLAY

LOOP

