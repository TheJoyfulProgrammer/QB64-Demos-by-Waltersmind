_TITLE "Zombie Adventure: Part #1 - The Search for Genesis"

' *** DEFINE THE LENGTH OF THE GAME SLOT NAME. THE SIZE 27 WAS DETERMINED TO BE
' *** THE PERFECT SIZE AS IT IS THE MAXIMUM SPACE AVAILABLE FOR TWO SLOTS IN
' *** SCREEN 12
CONST Len_SavedGameName = 27

' *** DEFINE THE VARIOUS LEVELS OF THE ZOMBIE'S MIND
CONST Mind_BrainDead = 1
CONST Mind_Weak = 2
CONST Mind_Understanding = 3
CONST Mind_Sharp = 4

CONST TRUE = -1
CONST FALSE = 0

DIM SHARED Degrees AS DOUBLE
Degrees = _PI / 180

DIM SHARED directions(1 TO 200) AS STRING

directions(1) = "S" ' *
directions(2) = "NE" ' *
directions(3) = "WS" ' *
directions(4) = "NES" ' *
directions(5) = "NS" ' *
directions(6) = "NW" ' *
directions(7) = "E" ' *
directions(8) = "EW" ' *
directions(9) = "WS" ' *
directions(10) = "NS" ' *
directions(11) = "NE" ' *
directions(12) = "EW" ' *
directions(13) = "NW" ' *
directions(14) = "ES" ' *
directions(15) = "WE" ' *
directions(16) = "EW" ' *
directions(17) = "EW" ' *
directions(18) = "NW" ' *
directions(19) = "NS" ' *
directions(20) = "ES" ' *
directions(21) = "NW" ' *
directions(22) = "ES" ' *
directions(23) = "NW" ' *
directions(24) = "NS" ' *
directions(25) = "SE" ' *
directions(26) = "EW" ' *
directions(27) = "NW" ' *
directions(28) = "NSW" ' *
directions(29) = "E" ' *
directions(30) = "EWS" ' *
directions(31) = "NEW" ' *
directions(32) = "NW" ' *
directions(33) = "S" ' *
directions(34) = "WS" ' *
directions(35) = "E" ' *
directions(36) = "EW" ' *
directions(37) = "NE" ' *
directions(38) = "NSEW" ' *
directions(39) = "W" ' *
directions(40) = "EW" ' *
directions(41) = "ES" ' *
directions(42) = "N" ' *
directions(43) = "SE" ' *
directions(44) = "NW" ' *
directions(45) = "EWS" ' *
directions(46) = "NW" ' *
directions(47) = "ES" ' *
directions(48) = "W" ' *
directions(49) = "NWE" ' *
directions(50) = "E" ' *
directions(51) = "WS" ' *
directions(52) = "EW" ' *
directions(53) = "NE" ' *
directions(54) = "NS" ' *
directions(55) = "NSEW" ' *
directions(56) = "EW" ' *
directions(57) = "NW" ' *
directions(58) = "NSW" ' *
directions(59) = "NE" ' *
directions(60) = "S" ' *
directions(61) = "N" ' *
directions(62) = "E" ' *
directions(63) = "SE" ' *
directions(64) = "EW" ' *
directions(65) = "WS" ' *
directions(66) = "ES" ' *
directions(67) = "EW" ' *
directions(68) = "WE" ' *
directions(69) = "WE" ' *
directions(70) = "WS" ' *
directions(71) = "NE" ' *
directions(72) = "EWS" ' *
directions(73) = "EWS" ' *
directions(74) = "WS" ' *
directions(75) = "NSW" ' *
directions(76) = "NSEW" ' *
directions(77) = "NSE" ' *
directions(78) = "NE" ' *
directions(79) = "NEW" ' *
directions(80) = "NSW" ' *
directions(81) = "NE" ' *
directions(82) = "EW" ' *
directions(83) = "WS" ' *
directions(84) = "NS" ' *
directions(85) = "NSW" ' *
directions(86) = "NS" ' *
directions(87) = "NW" ' *
directions(88) = "NEW" ' *
directions(89) = "NS" ' *
directions(90) = "ES" ' *
directions(91) = "EW" ' *
directions(92) = "NE" ' *
directions(93) = "NS" ' *
directions(94) = "WS" ' *
directions(95) = "EW" ' *
directions(96) = "SE" ' *
directions(97) = "NS" ' *
directions(98) = "NS" ' *
directions(99) = "NS" ' *
directions(100) = "NE" ' *
directions(101) = "EW" ' *
directions(102) = "EWS" ' *
directions(103) = "NW" ' *
directions(104) = "ES" ' *
directions(105) = "W" ' *
directions(106) = "NE" ' *
directions(107) = "EW" ' *
directions(100) = "NE" ' *
directions(101) = "EW" ' *
directions(102) = "EWS" ' *
directions(103) = "NW" ' *
directions(104) = "ES" ' *
directions(105) = "W" ' *
directions(106) = "NE" ' *
directions(107) = "EW" ' *
directions(108) = "EWS" ' *
directions(109) = "NW" ' *
directions(110) = "S" ' *
directions(111) = "NS" ' *
directions(112) = "NW" ' *
directions(113) = "EW" ' *
directions(114) = "NSE" ' *
directions(115) = "S" ' *
directions(116) = "NW" ' *
directions(117) = "NE" ' *
directions(118) = "WS" ' *
directions(119) = "EW" ' *
directions(120) = "NE" ' *
directions(121) = "NS" ' *
directions(122) = "WS" ' *
directions(123) = "ES" ' *
directions(124) = "NW" ' *
directions(125) = "ES" ' *
directions(126) = "NE" ' *
directions(127) = "WS" ' *
directions(128) = "NESW" ' *
directions(129) = "E" ' *
directions(130) = "N"
directions(131) = "EW" ' *
directions(132) = "NSEW"
directions(133) = "S"
directions(134) = "N"
directions(135) = "EW"
directions(136) = "WS"
directions(137) = "NS"
directions(138) = "NS"
directions(139) = "NSEW"
directions(140) = "EW"
directions(141) = "WS"
directions(142) = "NS"
directions(143) = "N"
directions(144) = "ES"
directions(145) = "NS"
directions(146) = "NE"
directions(147) = "WS"
directions(148) = "N"
directions(149) = "NW"
directions(150) = "EW"
directions(151) = "NE"
directions(152) = "NS"
directions(153) = "WS"
directions(154) = "ES"
directions(155) = "NW"
directions(156) = "ES"
directions(157) = "NS"
directions(158) = "NE"
directions(159) = "WS"
directions(160) = "NS"
directions(161) = "NE"
directions(162) = "EW"
directions(163) = "EWS"
directions(164) = "NW"
directions(165) = "ES"
directions(166) = "EW"
directions(167) = "W"
directions(168) = "NSE"
directions(169) = "W"
directions(170) = "NW"
directions(171) = "ES"
directions(172) = "NW"
directions(173) = "EW"
directions(174) = "NE"
directions(175) = "NS"
directions(176) = "NS"
directions(177) = "WS"
directions(178) = "W" ' *** NO EAST - PATH IS BLOCKED WHEN YOU ENTER THIS ROOM

directions(179) = "ES"
directions(180) = "NS"
directions(181) = "NS"
directions(182) = "NW"
directions(183) = "NE"
directions(184) = "NS"
directions(185) = "NS"
directions(186) = "WS"
directions(187) = "ES"
directions(188) = "NS"
directions(189) = "NS"
directions(190) = "NW"
directions(191) = "ES"
directions(192) = "NS"
directions(193) = "NS"
directions(194) = "NS"
directions(195) = "NS"
directions(196) = "NS"
directions(197) = "NS"
directions(198) = "NS"
directions(199) = "NS"
directions(200) = "N"

' *** DEFINE NPC'S (NON PLAYER CHARACTER'S) HERE. THIS INFORMATION GETS SAVED
DIM SHARED NPC_Joan AS INTEGER
DIM SHARED NPC_Billy AS INTEGER
DIM SHARED NPC_Pa AS INTEGER
DIM SHARED NPC_Ma AS INTEGER
DIM SHARED NPC_OldMan AS INTEGER
DIM SHARED NPC_Woman AS INTEGER
DIM SHARED NPC_Teen AS INTEGER
DIM SHARED NPC_Soldier AS INTEGER
DIM SHARED NPC_Pilot AS INTEGER
DIM SHARED NPC_Man AS INTEGER
DIM SHARED NPC_Cop AS INTEGER
DIM SHARED NPC_Doctor AS INTEGER
DIM SHARED NPC_Nurse AS INTEGER
DIM SHARED NPC_Coward AS INTEGER
DIM SHARED NPC_Lady AS INTEGER
DIM SHARED NPC_Kid AS INTEGER
DIM SHARED NPC_Driver AS INTEGER
DIM SHARED NPC_General AS INTEGER
DIM SHARED Zombie_Health AS INTEGER

' *** DEFINE ALL NPC'S HIT POINTS
NPC_Joan = 1
NPC_Billy = 1
NPC_Pa = 1
NPC_Ma = 1
NPC_OldMan = 1
NPC_Woman = 1
NPC_Teen = 1
NPC_Soldier = 1
NPC_Pilot = 1
NPC_Man = 255
NPC_Cop = 100
NPC_Doctor = 75
NPC_Nurse = 1
NPC_Coward = 1
NPC_Lady = 1
NPC_Kid = 1
NPC_Driver = 1
NPC_General = 150

DIM SHARED Zombie_Health_Max AS INTEGER
DIM SHARED Health_Blocks_Max AS INTEGER
DIM SHARED Health_Blocks AS INTEGER
DIM SHARED Zombie_Health_Percentage AS _UNSIGNED _BYTE
DIM SHARED Zombie_Mental_Awareness AS _UNSIGNED _BYTE
DIM SHARED Zombie_Mental_Awareness_Message AS STRING

Health_Blocks_Max = 66

' *** DEFINE OTHER INFORMATION THAT GETS SAVED
DIM SHARED CurrentRoom AS INTEGER
DIM SHARED SavedGameName AS STRING * LEN_SAVEDGAMENAME
DIM SHARED DOOM_Time AS DOUBLE
DIM SHARED DOOM AS DOUBLE
DIM SHARED GameTime AS DOUBLE
DIM SHARED Game_Max_Minutes AS _UNSIGNED INTEGER
DIM SHARED Game_Max_Seconds AS _UNSIGNED _BYTE
DIM SHARED Game_Timer_Started AS _BYTE
DIM SHARED Radio_Playing AS _BYTE
DIM SHARED Radio_Message_Heard AS _BYTE

DIM SHARED Has_BackPack AS _BYTE
DIM SHARED Talked_To_General AS _BYTE
DIM SHARED Zombie_Data_Amount AS _UNSIGNED _BYTE
DIM SHARED Zombie_Vaccine_Amount AS _UNSIGNED INTEGER

Game_Max_Minutes = 120 '45 '240 '45
Game_Max_Seconds = 0
GameTime = Game_Max_Minutes * 60 + Game_Max_Seconds


' ***
DIM SHARED SaveGameFILE$
DIM SHARED MaxSlots AS _BYTE
DIM SHARED GotStick AS _BYTE
DIM SHARED GameLoaded AS _BYTE
DIM SHARED GameSaved AS _BYTE

' *** DEFINE IMAGE HOLDERS HERE
DIM SHARED Img_MainScreen AS _UNSIGNED LONG
DIM SHARED Img_MainMenuItems AS _UNSIGNED LONG
DIM SHARED Img_House AS _UNSIGNED LONG
DIM SHARED Img_Credits AS _UNSIGNED LONG
DIM SHARED Img_Town AS _UNSIGNED LONG
DIM SHARED Img_Ending AS _UNSIGNED LONG

DIM Select_Menu_Title AS _UNSIGNED _BYTE

DIM SHARED Data_MainScreen$
DIM SHARED Data_MainMenuItems$

DIM SHARED Palette_Original AS STRING * 96
DIM SHARED Palette_ElementLoadingScreen AS STRING * 96
DIM SHARED Palette_MainScreen AS STRING * 96
DIM SHARED Palette_IntroScreen AS STRING * 96
DIM SHARED Palette_Credits AS STRING * 96
DIM SHARED Palette_LoadScreen AS STRING * 96
DIM SHARED Palette_SaveScreen AS STRING * 96
DIM SHARED Palette_HouseScreen AS STRING * 96
DIM SHARED Palette_TownScreen AS STRING * 96
DIM SHARED Palette_EndingScreen AS STRING * 96

MaxSlots = 12
GotStick = 1
SaveGameFILE$ = "Zombie_Adventure_SAVED_GAMES.dat"

'$include: 'Data_MainScreen.bi'
'$include: 'Data_MainMenuItems.bi'
'$include: 'Img_Others.bi'

DIM SHARED SlotSize AS LONG

'*** GET TOTAL SIZE OF A SLOT OF DATA
SlotSize = LEN(SavedGameName)
SlotSize = SlotSize + LEN(DOOM_Time)
SlotSize = SlotSize + LEN(Game_Timer_Started)
SlotSize = SlotSize + LEN(CurrentRoom)
SlotSize = SlotSize + LEN(Radio_Playing)
SlotSize = SlotSize + LEN(NPC_Joan)
SlotSize = SlotSize + LEN(Radio_Message_Heard)
SlotSize = SlotSize + LEN(Has_BackPack)
SlotSize = SlotSize + LEN(Talked_To_General)
SlotSize = SlotSize + LEN(Zombie_Data_Amount)
SlotSize = SlotSize + LEN(Zombie_Vaccine_Amount)
SlotSize = SlotSize + LEN(NPC_Billy)
SlotSize = SlotSize + LEN(NPC_Pa)
SlotSize = SlotSize + LEN(NPC_Ma)
SlotSize = SlotSize + LEN(NPC_OldMan)
SlotSize = SlotSize + LEN(NPC_Woman)
SlotSize = SlotSize + LEN(NPC_Teen)
SlotSize = SlotSize + LEN(NPC_Soldier)
SlotSize = SlotSize + LEN(NPC_Pilot)
SlotSize = SlotSize + LEN(NPC_Man)
SlotSize = SlotSize + LEN(NPC_Cop)
SlotSize = SlotSize + LEN(NPC_Doctor)
SlotSize = SlotSize + LEN(NPC_Nurse)
SlotSize = SlotSize + LEN(NPC_Coward)
SlotSize = SlotSize + LEN(NPC_Lady)
SlotSize = SlotSize + LEN(NPC_Kid)
SlotSize = SlotSize + LEN(NPC_Driver)
SlotSize = SlotSize + LEN(NPC_General)
SlotSize = SlotSize + LEN(Zombie_Health)

DIM SHARED RoomDescriptionX AS _UNSIGNED _BYTE
DIM SHARED RoomDescriptionY AS _UNSIGNED _BYTE
DIM SHARED ZombieMessageX AS _UNSIGNED _BYTE
DIM SHARED ZombieMessageY AS _UNSIGNED _BYTE
DIM SHARED RoomActionPerformed AS _BYTE

DIM SHARED Sound_Main AS LONG
DIM SHARED Sound_Credits AS LONG
DIM SHARED Sound_House AS LONG
DIM SHARED Sound_Town AS LONG
DIM SHARED Sound_Ending AS LONG

' *** CHECK TO SEE IF WE NEED TO CREATE THE SAVED GAME DATA FILE
CreateGameDataFile

' *** WE NEED TO GO AHEAD AND SWITCH TO THE GRAPHICS MODE SO WE CAN START DEFINING OUR COLOR PALETTES
SCREEN 12

' -----------------------------------------------------------------------------
'   DEFINE COLOR PALETTES USED IN THE GAME
' -----------------------------------------------------------------------------

' *** SAVE SCREEN 12's ORIGINAL PALETTE COLORS
Palette_Original = ConvertPaletteToString$(0)

' *** DEFINE THE COLORS USED IN THE ELEMENT LOADING SCREEN
Palette_ElementLoadingScreen = Palette_Original
AddColorToPaletteString Palette_ElementLoadingScreen, 0, _RGB32(87, 131, 104)
AddColorToPaletteString Palette_ElementLoadingScreen, 2, _RGB32(172, 194, 158)


' *** DEFINE THE COLORS USED ON THE MAIN MENU SCREEN'S PALETTE. THE BACKGROUND
' *** IMAGE USES THE PALETTE COLORS 0-10, WHICH LEAVES US WITH FIVE COLORS TO
' *** USE ON OTHER THINGS.
AddColorToPaletteString Palette_MainScreen, 0, _RGB32(0, 0, 0)
AddColorToPaletteString Palette_MainScreen, 1, _RGB32(22, 35, 33)
AddColorToPaletteString Palette_MainScreen, 2, _RGB32(7, 12, 10)
AddColorToPaletteString Palette_MainScreen, 3, _RGB32(31, 48, 45)
AddColorToPaletteString Palette_MainScreen, 4, _RGB32(44, 67, 61)
AddColorToPaletteString Palette_MainScreen, 5, _RGB32(57, 85, 80)
AddColorToPaletteString Palette_MainScreen, 6, _RGB32(164, 211, 187)
AddColorToPaletteString Palette_MainScreen, 7, _RGB32(14, 23, 20)
AddColorToPaletteString Palette_MainScreen, 8, _RGB32(72, 108, 100)
AddColorToPaletteString Palette_MainScreen, 9, _RGB32(91, 135, 126)
AddColorToPaletteString Palette_MainScreen, 10, _RGB32(124, 173, 159)
AddColorToPaletteString Palette_MainScreen, 11, _RGB32(118, 227, 42)
AddColorToPaletteString Palette_MainScreen, 12, _RGB32(50, 103, 13)
AddColorToPaletteString Palette_MainScreen, 13, _RGB32(188, 188, 188)
AddColorToPaletteString Palette_MainScreen, 14, _RGB32(94, 94, 94)
AddColorToPaletteString Palette_MainScreen, 15, _RGB32(255, 255, 0)

' *** DEFINE THE COLORS USED ON THE INTRODUCTION PAGE. WE WANT TO USE THE SAME
' *** COLORS AS THE MAIN SCREEN SINCE WE ARE USING THE SAME BACKGROUND IMAGE,
' *** BUT WE NEED TO CHANGE SOME OF THE COLORS TO USE FOR THE INFORMATION TEXT
' *** BOX AND THE "PRESS ANY KEY" BAR AT THE BOTTOM.
Palette_IntroScreen = Palette_MainScreen
AddColorToPaletteString Palette_IntroScreen, 11, _RGB32(0, 0, 128)
AddColorToPaletteString Palette_IntroScreen, 12, _RGB32(0, 255, 0)
AddColorToPaletteString Palette_IntroScreen, 13, _RGB32(0, 80, 0)
AddColorToPaletteString Palette_IntroScreen, 14, _RGB32(0, 40, 0)
AddColorToPaletteString Palette_IntroScreen, 15, _RGB32(255, 255, 0)

' *** DEFINE THE COLORS USED ON THE CREDIT SCREEN'S PALETTE. THE BACKGROUND
' *** IMAGE USES THE PALETTE COLORS 0-10, WHICH LEAVES US WITH FIVE COLORS TO
' *** USE ON OTHER THINGS.
AddColorToPaletteString Palette_Credits, 0, _RGB32(21, 23, 22)
AddColorToPaletteString Palette_Credits, 1, _RGB32(35, 40, 41)
AddColorToPaletteString Palette_Credits, 2, _RGB32(45, 54, 60)
AddColorToPaletteString Palette_Credits, 3, _RGB32(61, 79, 93)
AddColorToPaletteString Palette_Credits, 4, _RGB32(66, 67, 67)
AddColorToPaletteString Palette_Credits, 5, _RGB32(89, 88, 87)
AddColorToPaletteString Palette_Credits, 6, _RGB32(92, 105, 115)
AddColorToPaletteString Palette_Credits, 7, _RGB32(112, 126, 136)
AddColorToPaletteString Palette_Credits, 8, _RGB32(149, 147, 143)
AddColorToPaletteString Palette_Credits, 9, _RGB32(184, 196, 198)
AddColorToPaletteString Palette_Credits, 10, _RGB32(139, 154, 162)
AddColorToPaletteString Palette_Credits, 11, _RGB32(0, 0, 128)
AddColorToPaletteString Palette_Credits, 12, _RGB32(0, 255, 0)
AddColorToPaletteString Palette_Credits, 13, _RGB32(0, 80, 0)
AddColorToPaletteString Palette_Credits, 14, _RGB32(255, 0, 0)
AddColorToPaletteString Palette_Credits, 15, _RGB32(255, 255, 0)

' *** DEFINE THE COLORS USED ON THE HOUSE SCREEN'S PALETTE. THE BACKGROUND
' *** IMAGE USES THE PALETTE COLORS 0-10, WHICH LEAVES US WITH FIVE COLORS TO
' *** USE ON OTHER THINGS.
AddColorToPaletteString Palette_HouseScreen, 0, _RGB32(0, 0, 0)
AddColorToPaletteString Palette_HouseScreen, 1, _RGB32(14, 13, 21)
AddColorToPaletteString Palette_HouseScreen, 2, _RGB32(26, 31, 44)
AddColorToPaletteString Palette_HouseScreen, 3, _RGB32(35, 48, 74)
AddColorToPaletteString Palette_HouseScreen, 4, _RGB32(50, 67, 105)
AddColorToPaletteString Palette_HouseScreen, 5, _RGB32(93, 94, 72)
AddColorToPaletteString Palette_HouseScreen, 6, _RGB32(74, 89, 128)
AddColorToPaletteString Palette_HouseScreen, 7, _RGB32(100, 115, 151)
AddColorToPaletteString Palette_HouseScreen, 8, _RGB32(135, 145, 166)
AddColorToPaletteString Palette_HouseScreen, 9, _RGB32(185, 189, 199)
AddColorToPaletteString Palette_HouseScreen, 10, _RGB32(143, 143, 107)
AddColorToPaletteString Palette_HouseScreen, 11, _RGB32(0, 0, 128)
AddColorToPaletteString Palette_HouseScreen, 12, _RGB32(0, 255, 0)
AddColorToPaletteString Palette_HouseScreen, 13, _RGB32(0, 80, 0)
AddColorToPaletteString Palette_HouseScreen, 14, _RGB32(255, 0, 0)
AddColorToPaletteString Palette_HouseScreen, 15, _RGB32(255, 255, 0)

' *** DEFINE THE COLORS USED ON THE TOWN SCREEN'S PALETTE. THE BACKGROUND
' *** IMAGE USES THE PALETTE COLORS 0-10, WHICH LEAVES US WITH FIVE COLORS TO
' *** USE ON OTHER THINGS.
AddColorToPaletteString Palette_TownScreen, 0, _RGB32(12, 9, 6)
AddColorToPaletteString Palette_TownScreen, 1, _RGB32(26, 18, 14)
AddColorToPaletteString Palette_TownScreen, 2, _RGB32(39, 27, 21)
AddColorToPaletteString Palette_TownScreen, 3, _RGB32(52, 37, 27)
AddColorToPaletteString Palette_TownScreen, 4, _RGB32(69, 48, 34)
AddColorToPaletteString Palette_TownScreen, 5, _RGB32(86, 61, 42)
AddColorToPaletteString Palette_TownScreen, 6, _RGB32(109, 77, 52)
AddColorToPaletteString Palette_TownScreen, 7, _RGB32(133, 99, 65)
AddColorToPaletteString Palette_TownScreen, 8, _RGB32(162, 126, 81)
AddColorToPaletteString Palette_TownScreen, 9, _RGB32(194, 161, 106)
AddColorToPaletteString Palette_TownScreen, 10, _RGB32(231, 207, 154)
AddColorToPaletteString Palette_TownScreen, 11, _RGB32(0, 0, 128)
AddColorToPaletteString Palette_TownScreen, 12, _RGB32(0, 255, 0)
AddColorToPaletteString Palette_TownScreen, 13, _RGB32(0, 80, 0)
AddColorToPaletteString Palette_TownScreen, 14, _RGB32(255, 0, 0)
AddColorToPaletteString Palette_TownScreen, 15, _RGB32(255, 255, 0)

' *** THE LOAD SCREEN COLOR PALETTE IS IDENTICAL TO SCREEN 12'S ORIGINAL
' *** COLORS, EXCEPT FOR ONE COLOR IS CHANGED.
Palette_LoadScreen = Palette_Original
AddColorToPaletteString Palette_LoadScreen, 3, _RGB32(0, 133, 255)

' *** WE WANT THE SAVE SCREEN'S COLOR PALETTE TO BE IDENTICAL TO THE LOAD SCREEN
Palette_SaveScreen = Palette_LoadScreen

' *** DEFINE THE COLORS USED ON THE ENDING SCREEN'S PALETTE. THE BACKGROUND
' *** IMAGE USES THE PALETTE COLORS 0-10, WHICH LEAVES US WITH FIVE COLORS TO
' *** USE ON OTHER THINGS.
AddColorToPaletteString Palette_EndingScreen, 0, _RGB32(0, 0, 0)
AddColorToPaletteString Palette_EndingScreen, 1, _RGB32(17, 9, 4)
AddColorToPaletteString Palette_EndingScreen, 2, _RGB32(32, 17, 6)
AddColorToPaletteString Palette_EndingScreen, 3, _RGB32(48, 26, 8)
AddColorToPaletteString Palette_EndingScreen, 4, _RGB32(65, 38, 12)
AddColorToPaletteString Palette_EndingScreen, 5, _RGB32(88, 54, 18)
AddColorToPaletteString Palette_EndingScreen, 6, _RGB32(113, 71, 24)
AddColorToPaletteString Palette_EndingScreen, 7, _RGB32(141, 91, 32)
AddColorToPaletteString Palette_EndingScreen, 8, _RGB32(176, 117, 43)
AddColorToPaletteString Palette_EndingScreen, 9, _RGB32(214, 152, 62)
AddColorToPaletteString Palette_EndingScreen, 10, _RGB32(250, 221, 161)
AddColorToPaletteString Palette_EndingScreen, 11, _RGB32(0, 0, 128)
AddColorToPaletteString Palette_EndingScreen, 12, _RGB32(0, 255, 0)
AddColorToPaletteString Palette_EndingScreen, 13, _RGB32(0, 80, 0)
AddColorToPaletteString Palette_EndingScreen, 14, _RGB32(200, 0, 0)
AddColorToPaletteString Palette_EndingScreen, 15, _RGB32(255, 255, 0)


' *** START DRAWING THE LOADING SCREEN
ConvertStringToPalette Palette_ElementLoadingScreen

LOCATE 1, 1: COLOR 14, 4: PRINT SPACE$(80);
LOCATE 1, 8: PRINT "GAME ENGINE CRACKED BY WALTERSMIND @ THE JOYFUL PROGRAMMER dot COM";
LOCATE 29, 1: PRINT SPACE$(80);
LOCATE 30, 1: PRINT SPACE$(80);
LOCATE 29, 15: PRINT "ZOMBIE ADVENTURE: PART #1 - THE SEARCH FOR GENESIS";
LOCATE 30, 8: PRINT "COPYRIGHTED 2015 BY, D.B.T. & WALTER WHITMAN. ALL RIGHTS RESERVED";
'                     12345678901234567890123456789012345678901234567890123456789012345678901234567890

LOCATE 3, 1
COLOR 2, 0

' *** DEFINE IMAGES HERE.
Img_MainScreen = _NEWIMAGE(640, 480, 12)
Img_MainMenuItems = _NEWIMAGE(282, 408, 12)
Img_House = _NEWIMAGE(640, 480, 12)
Img_Credits = _NEWIMAGE(640, 480, 12)
Img_Town = _NEWIMAGE(640, 480, 12)
Img_Ending = _NEWIMAGE(640, 480, 12)

MessageX = 3
MessageY = 3

' *** DECODE THE MAIN SCREEN BACKGROUND IMAGE
COLOR 2
LOCATE MessageY, MessageX: MessageY = MessageY + 1
PRINT "Decoding the Main Screen Background Image... ";

_DEST Img_MainScreen
_SOURCE Img_MainScreen

FOR ImgPosition = 1 TO LEN(Data_MainScreen$)
    x = ((ImgPosition - 1) MOD 160) * 4
    y = (INT((ImgPosition - 1) / 160)) * 4
    LINE (x, y)-(x + 3, y + 3), VAL("&H" + MID$(Data_MainScreen$, ImgPosition, 1)), BF
NEXT

_DEST 0: _SOURCE 0: COLOR 14: PRINT "DONE"


' *** DECODE THE MAIN MENU ITEMS IMAGE HERE
COLOR 2
LOCATE MessageY, MessageX: MessageY = MessageY + 1
PRINT "Decoding the Main Menu Items Image... ";

_DEST Img_MainMenuItems
_SOURCE Img_MainMenuItems
_CLEARCOLOR 15, Img_MainMenuItems

FOR ImgPosition = 1 TO LEN(Data_MainMenuItems$)
    x = ((ImgPosition - 1) MOD 283)
    y = (INT((ImgPosition - 1) / 283))
    PSET (x, y), VAL("&H" + MID$(Data_MainMenuItems$, ImgPosition, 1))
NEXT

MenuTitleX = 40
MenuTitleY = 40

_DEST 0: _SOURCE 0: COLOR 14: PRINT "DONE"


' *** DECODE THE HOUSE SCREEN BACKGROUND IMAGE
COLOR 2
LOCATE MessageY, MessageX: MessageY = MessageY + 1
PRINT "Decoding the House Background Image... ";

_DEST Img_House
_SOURCE Img_House

FOR ImgPosition = 1 TO LEN(Img_House$)
    x = ((ImgPosition - 1) MOD 160) * 4
    y = (INT((ImgPosition - 1) / 160)) * 4
    LINE (x, y)-(x + 3, y + 3), VAL("&H" + MID$(Img_House$, ImgPosition, 1)), BF
NEXT

_DEST 0: _SOURCE 0: COLOR 14: PRINT "DONE"


' *** DECODE THE CREDITS SCREEN BACKGROUND IMAGE
COLOR 2
LOCATE MessageY, MessageX: MessageY = MessageY + 1
PRINT "Decoding the Credits Screen Background Image... ";

_DEST Img_Credits
_SOURCE Img_Credits

FOR ImgPosition = 1 TO LEN(Img_Credits$)
    x = ((ImgPosition - 1) MOD 160) * 4
    y = (INT((ImgPosition - 1) / 160)) * 4
    LINE (x, y)-(x + 3, y + 3), VAL("&H" + MID$(Img_Credits$, ImgPosition, 1)), BF
NEXT

_DEST 0: _SOURCE 0: COLOR 14: PRINT "DONE"


' *** DECODE THE TOWN SCREEN BACKGROUND IMAGE
COLOR 2
LOCATE MessageY, MessageX: MessageY = MessageY + 1
PRINT "Decoding the Town Background Image... ";

_DEST Img_Town
_SOURCE Img_Town

FOR ImgPosition = 1 TO LEN(Img_Town$)
    x = ((ImgPosition - 1) MOD 160) * 4
    y = (INT((ImgPosition - 1) / 160)) * 4
    LINE (x, y)-(x + 3, y + 3), VAL("&H" + MID$(Img_Town$, ImgPosition, 1)), BF
NEXT

_DEST 0: _SOURCE 0: COLOR 14: PRINT "DONE"


' *** DECODE THE ENDING SCREEN BACKGROUND IMAGE
COLOR 2
LOCATE MessageY, MessageX: MessageY = MessageY + 1
PRINT "Decoding the Ending Screen Background Image... ";

_DEST Img_Ending
_SOURCE Img_Ending

FOR ImgPosition = 1 TO LEN(Img_Ending$)
    x = ((ImgPosition - 1) MOD 160) * 4
    y = (INT((ImgPosition - 1) / 160)) * 4
    LINE (x, y)-(x + 3, y + 3), VAL("&H" + MID$(Img_Ending$, ImgPosition, 1)), BF
NEXT

_DEST 0
_SOURCE 0

_DEST 0: _SOURCE 0: COLOR 14: PRINT "DONE"


' *** LOAD SOUNDS HERE
COLOR 2
LOCATE MessageY, MessageX: MessageY = MessageY + 1
PRINT "Loading Main Screen Music... ";
'Sound_Main = _SNDOPEN("Evening of Chaos.ogg", "VOL,SYNC,LEN,PAUSE"): COLOR 14: PRINT "DONE"

COLOR 2
LOCATE MessageY, MessageX: MessageY = MessageY + 1
PRINT "Loading Credit Screen Music... ";
'Sound_Credits = _SNDOPEN("Feelin Good.ogg", "VOL,SYNC,LEN,PAUSE"): COLOR 14: PRINT "DONE"

COLOR 2
LOCATE MessageY, MessageX: MessageY = MessageY + 1
PRINT "Loading House Music... ";
'Sound_House = _SNDOPEN("This House.ogg", "VOL,SYNC,LEN,PAUSE"): COLOR 14: PRINT "DONE"

COLOR 2
LOCATE MessageY, MessageX: MessageY = MessageY + 1
PRINT "Loading Town Music... ";
'Sound_Town = _SNDOPEN("Ossuary 1 - A Beginning.ogg", "VOL,SYNC,LEN,PAUSE"): COLOR 14: PRINT "DONE"

COLOR 2
LOCATE MessageY, MessageX: MessageY = MessageY + 1
PRINT "Loading Ending Music... ";
'Sound_Ending = _SNDOPEN("Danger Storm.ogg", "VOL,SYNC,LEN,PAUSE"): COLOR 14: PRINT "DONE"



FOR Colr = 0 TO 255 STEP 8
    _LIMIT 30
    FadePaletteStringToColor Palette_ElementLoadingScreen, _RGB32(0, 0, 0), Colr, 0
    _DISPLAY
NEXT


' *****************************************************************************
' MAIN SCREEN START
' *****************************************************************************
Main_Screen_Start:

Zombie_Health_Max = 255

DrawMainScreen:

_DEST 0
_SOURCE 0

ConvertStringToPalette Palette_MainScreen
FadePaletteStringToColor Palette_MainScreen, _RGB32(0, 0, 0), 255, 0

_PUTIMAGE (0, 0), Img_MainScreen, 0, (0, 0)-(639, 479)

DrawBox 3, 26, 78, 29, 10, 4, 177

_PRINTMODE _KEEPBACKGROUND

COLOR 15: OutlineString 27, 17, 0, 1, "ZOMBIE ADVENTURE: PART #1 - SEARCH FOR GENESIS"
COLOR 10: OutlineString 28, 5, 0, 1, "Copyrighted 2015, By D.B. Taylor & Walter Whitman. All Rights Reserved."
'                                      12345678901234567890123456789012345678901234567890123456789012345678901234567890
GameLoaded = FALSE
CurrentRoom = 1

Draw_Menu_Items:

FOR MenuTitleItem = 0 TO 2
    DestX = MenuTitleX
    DestY = MenuTitleY + MenuTitleItem * 100
    SourceX1 = 0
    SourceY1 = MenuTitleItem * 136 + 68 * ABS(MenuTitleItem <> Select_Menu_Title)
    SourceX2 = 281
    SourceY2 = SourceY1 + 67
    _PUTIMAGE (DestX, DestY), Img_MainMenuItems, 0, (SourceX1, SourceY1)-(SourceX2, SourceY2)
NEXT

FOR Colr = 255 TO 0 STEP -8
    _LIMIT 30
    FadePaletteStringToColor Palette_MainScreen, _RGB32(0, 0, 0), Colr, 0
    _DISPLAY
NEXT
FadePaletteStringToColor Palette_MainScreen, _RGB32(0, 0, 0), 0, 0

_PRINTMODE _FILLBACKGROUND

DO

    _LIMIT 30
    DO
        k = _KEYHIT

        FadeAmount = ABS(-(255 * SIN((TIMER(0.001) * 120) * (_PI / 180))))
        FadePaletteColorToColor Palette_MainScreen, 11, _RGB32(80, 153, 28), FadeAmount

        _DISPLAY
        IF _SNDPLAYING(Sound_Main) = 0 THEN _SNDPLAY (Sound_Main)
    LOOP WHILE k = 0

    RefreshTitle = 0

    SELECT CASE k
        CASE 13
            SELECT CASE Select_Menu_Title
                CASE 0

                    FOR Colr = 0 TO 255 STEP 8
                        _LIMIT 30
                        FadePaletteStringToColor Palette_MainScreen, _RGB32(0, 0, 0), Colr, 0
                        _DISPLAY
                    NEXT

                    _SNDSTOP Sound_Main
                    PlayGame
                    GOTO DrawMainScreen

                CASE 1

                    FOR Colr = 0 TO 255 STEP 8
                        _LIMIT 30
                        FadePaletteStringToColor Palette_MainScreen, _RGB32(0, 0, 0), Colr, 0
                        _DISPLAY
                    NEXT

                    _SNDSTOP Sound_Main

                    GameLoaded = LoadGame
                    IF GameLoaded = TRUE THEN PlayGame

                    GOTO DrawMainScreen

                CASE 2

                    FOR Colr = 0 TO 255 STEP 8
                        _LIMIT 30
                        FadePaletteStringToColor Palette_MainScreen, _RGB32(0, 0, 0), Colr, 0
                        _DISPLAY
                    NEXT

                    _SNDSTOP Sound_Main
                    Credits
                    GOTO DrawMainScreen

            END SELECT

        CASE 80, 112

            FOR Colr = 0 TO 255 STEP 8
                _LIMIT 30
                FadePaletteStringToColor Palette_MainScreen, _RGB32(0, 0, 0), Colr, 0
                _DISPLAY
            NEXT

            _SNDSTOP Sound_Main
            PlayGame
            GOTO DrawMainScreen

        CASE 76, 108

            FOR Colr = 0 TO 255 STEP 8
                _LIMIT 30
                FadePaletteStringToColor Palette_MainScreen, _RGB32(0, 0, 0), Colr, 0
                _DISPLAY
            NEXT

            _SNDSTOP Sound_Main
            GameLoaded = LoadGame
            IF GameLoaded = TRUE THEN PlayGame
            GOTO DrawMainScreen

        CASE 67, 99

            FOR Colr = 0 TO 255 STEP 8
                _LIMIT 30
                FadePaletteStringToColor Palette_MainScreen, _RGB32(0, 0, 0), Colr, 0
                _DISPLAY
            NEXT

            _SNDSTOP Sound_Main
            Credits
            GOTO DrawMainScreen

        CASE 18432

            Select_Menu_Title = Select_Menu_Title - 1
            IF Select_Menu_Title = 255 THEN Select_Menu_Title = 2
            RefreshTitle = 1

        CASE 20480

            Select_Menu_Title = (Select_Menu_Title + 1) MOD 3
            RefreshTitle = 1

    END SELECT

    IF RefreshTitle = 1 THEN
        FOR MenuTitleItem = 0 TO 2
            DestX = MenuTitleX
            DestY = MenuTitleY + MenuTitleItem * 100
            SourceX1 = 0
            SourceY1 = MenuTitleItem * 136 + 68 * ABS(MenuTitleItem <> Select_Menu_Title)
            SourceX2 = 281
            SourceY2 = SourceY1 + 67
            _PUTIMAGE (DestX, DestY), Img_MainMenuItems, 0, (SourceX1, SourceY1)-(SourceX2, SourceY2)
        NEXT
    END IF

    _DISPLAY

LOOP





' **************************************************************************************
' PLAY GAME
' **************************************************************************************
SUB PlayGame ()

IF CurrentRoom < 16 THEN
    _SNDPLAY Sound_House
ELSE
    _SNDPLAY Sound_Town
END IF

IF GameLoaded = FALSE THEN

    ' *** Set Zombie health to low. Full Zombie health is 255.
    ' *** The players need to start out with low health so eating brains will make since.
    ' *** The players need a reason to eat brains.
    Zombie_Health = 80
    CurrentRoom = 1
    'Radio_Playing = TRUE
    'Radio_Message_Heard = TRUE
    'Game_Timer_Started = TRUE
    'DOOM = TIMER(0.001) + GameTime
    'Has_BackPack = FALSE 'TRUE

    Palette_Temp$ = Palette_IntroScreen
    AddColorToPaletteString Palette_Temp$, 13, _RGB32(150, 0, 0)
    ConvertStringToPalette Palette_Temp$

    CLS
    _PUTIMAGE (0, 0), Img_MainScreen, 0, (0, 0)-(639, 479)
    _PRINTMODE _KEEPBACKGROUND

    'DrawBox (X1, Y1, X2, Y2, BorderColor1%, FillColor1%, BackgroundChar%%)
    DrawBox 4, 9, 77, 19, 12, 13, 178

    COLOR 12

    _PRINTMODE _KEEPBACKGROUND

    '                            12345678901234567890123456789012345678901234567890123456789012345678
    OutlineString 11, 7, 14, 1, "  Me walk long time. No eat long time. Me health... Low... Me hungry"
    OutlineString 12, 7, 14, 1, "Must feed. Me no want killing. No Choice... Mind... Me mind... Like"
    OutlineString 13, 7, 14, 1, "deep water. Me hunger... Fierce... No control... No happy. Must eat."

    OutlineString 15, 7, 14, 1, "Where I am? Lost. Sniff... Sniff... Smell warm blood... Hear noises."
    OutlineString 16, 7, 14, 1, "No fight left. No control... Must eat... No care... Stomach force me"
    OutlineString 17, 7, 14, 1, "to... Must follow smell... Stomach ache... Know I need... Food..."

    _PRINTMODE _FILLBACKGROUND

    COLOR 15, 11
    LOCATE 30, 1: PRINT STRING$(80, 32);
    LOCATE 30, 27: PRINT "PRESS ANY KEY TO CONTINUE";

    FOR Colr = 255 TO 0 STEP -8
        _LIMIT 30
        FadePaletteStringToColor Palette_Temp$, _RGB32(0, 0, 0), Colr, 0
        _DISPLAY
    NEXT

    _DISPLAY
    SLEEP

    MeltScreen 0, 1

END IF

' *** MOVE TO RADIO PART
'IF GameLoaded = FALSE THEN
'    DOOM = TIMER(0.001) + GameTime 'change this to to desied time for the game to run
'END IF

RoomActionPerformed = 0

DO

    IF CurrentRoom < 16 THEN
        IF _SNDPLAYING(Sound_Town) = -1 THEN _SNDSTOP Sound_Town
        IF _SNDPLAYING(Sound_House) = 0 THEN _SNDPLAY Sound_House
        ConvertStringToPalette Palette_HouseScreen
        _PUTIMAGE (0, 0), Img_House, 0, (0, 0)-(639, 479)
    ELSE
        IF _SNDPLAYING(Sound_House) = -1 THEN _SNDSTOP Sound_House
        IF _SNDPLAYING(Sound_Town) = 0 THEN _SNDPLAY Sound_Town
        ConvertStringToPalette Palette_TownScreen
        _PUTIMAGE (0, 0), Img_Town, 0, (0, 0)-(639, 479)
    END IF

    _PRINTMODE _KEEPBACKGROUND

    COLOR 0
    FOR y = 21 TO 29
        LOCATE y, 1
        PRINT STRING$(80, 178);
    NEXT

    LINE (0, 462)-(639, 479), 11, BF

    COLOR 15, 11
    OutlineString 30, 1, 0, 1, "    <F1> Help     <F2> Inventory     <F3> Credits     <F5> Save    <F6> Load"
    '                           12345678901234567890123456789012345678901234567890123456789012345678901234567890

    _PRINTMODE _KEEPBACKGROUND

    CompassX = 40
    CompassY = 18
    CompassPixelX = (CompassX - 1) * 8 + 3
    CompassPixelY = (CompassY - 1) * 16 + 7

    ' *** DRAW COMPASS INNER CIRCLE
    FOR Radius = 12 TO 18 STEP .25
        CIRCLE (CompassPixelX, CompassPixelY), Radius, 0
    NEXT
    FOR Radius = 14 TO 16 STEP .25
        CIRCLE (CompassPixelX, CompassPixelY), Radius, 13
    NEXT

    ' *** DRAW THE CENTER CROSS HAIR FOR COMPASS
    COLOR 12
    OutlineString CompassY, CompassX, 0, 2, "+"

    ' *** SET COLOR FOR NORTH DEPENDING ON IF IT IS ACCESSABLE OR NOT
    IF INSTR(directions(CurrentRoom), "N") THEN
        COLOR 12
    ELSE
        COLOR 13
    END IF

    ' *** DRAW NORTH COMPASS ARROW
    colr~& = _DEFAULTCOLOR
    COLOR 0
    FOR x = -5 TO 5
        LINE (CompassPixelX + x, CompassPixelY - 5)-(CompassPixelX, CompassPixelY - 27)
    NEXT
    COLOR colr~&
    FOR x = -3 TO 3
        LINE (CompassPixelX + x, CompassPixelY - 6)-(CompassPixelX, CompassPixelY - 22)
    NEXT

    ' *** DRAW COMPASS LETTER FOR NORTH WITH OUTLINE
    OutlineString CompassY - 2, CompassX, 0, 2, "N"

    ' *** SET COLOR FOR EAST DEPENDING ON IF IT IS ACCESSABLE OR NOT
    IF INSTR(directions(CurrentRoom), "E") THEN
        COLOR 12
    ELSE
        COLOR 13
    END IF

    ' *** DRAW EAST COMPASS ARROW
    colr~& = _DEFAULTCOLOR
    COLOR 0
    FOR y = -5 TO 5
        LINE (CompassPixelX + 5, CompassPixelY + y)-(CompassPixelX + 27, CompassPixelY)
    NEXT
    COLOR colr~&
    FOR y = -3 TO 3
        LINE (CompassPixelX + 7, CompassPixelY + y)-(CompassPixelX + 23, CompassPixelY)
    NEXT

    ' *** DRAW COMPASS LETTER FOR EAST WITH OUTLINE
    OutlineString CompassY, CompassX + 4, 0, 2, "E"

    ' *** SET COLOR FOR WEST DEPENDING ON IF IT IS ACCESSABLE OR NOT
    IF INSTR(directions(CurrentRoom), "W") THEN
        COLOR 12
    ELSE
        COLOR 13
    END IF

    ' *** DRAW WEST COMPASS ARROW
    colr~& = _DEFAULTCOLOR
    COLOR 0
    FOR y = -5 TO 5
        LINE (CompassPixelX - 5, CompassPixelY + y)-(CompassPixelX - 27, CompassPixelY)
    NEXT
    COLOR colr~&
    FOR y = -3 TO 3
        LINE (CompassPixelX - 7, CompassPixelY + y)-(CompassPixelX - 23, CompassPixelY)
    NEXT

    ' *** DRAW COMPASS LETTER FOR WEST WITH OUTLINE
    OutlineString CompassY, CompassX - 4, 0, 2, "W"

    ' *** SET COLOR FOR SOUTH DEPENDING ON IF IT IS ACCESSABLE OR NOT
    IF INSTR(directions(CurrentRoom), "S") THEN
        COLOR 12
    ELSE
        COLOR 13
    END IF

    ' *** DRAW SOUTH COMPASS ARROW
    colr~& = _DEFAULTCOLOR
    COLOR 0
    FOR x = -5 TO 5
        LINE (CompassPixelX + x, CompassPixelY + 5)-(CompassPixelX, CompassPixelY + 27)
    NEXT
    COLOR colr~&
    FOR x = -3 TO 3
        LINE (CompassPixelX + x, CompassPixelY + 6)-(CompassPixelX, CompassPixelY + 22)
    NEXT

    ' *** DRAW COMPASS LETTER FOR SOUTH WITH OUTLINE
    OutlineString CompassY + 2, CompassX, 0, 2, "S"

    ' *** SHOW CURRENT ROOM NUMBER - TO HELP PLAYER WITH THEIR BEARINGS
    COLOR 15
    OutlineString 1, 68, 1, 1, "Room: " + LTRIM$(RTRIM$(STR$(CurrentRoom)))

    ' *** Define and Show Zombie Mental Awareness
    IF Zombie_Health > Zombie_Health_Max THEN Zombie_Health = Zombie_Health_Max
    Zombie_Health_Percentage = (100 / Zombie_Health_Max) * Zombie_Health

    IF Zombie_Health_Percentage <= 50 THEN
        Zombie_Mental_Awareness = Mind_BrainDead
        Zombie_Mental_Awareness_Message = "Brain Dead"
    ELSEIF Zombie_Health_Percentage > 50 AND Zombie_Health_Percentage <= 65 THEN
        Zombie_Mental_Awareness = Mind_Weak
        Zombie_Mental_Awareness_Message = "Weak Minded"
    ELSEIF Zombie_Health_Percentage > 65 AND Zombie_Health_Percentage < 90 THEN
        Zombie_Mental_Awareness = Mind_Understanding
        Zombie_Mental_Awareness_Message = "Understanding the World!"
    ELSEIF Zombie_Health_Percentage >= 90 THEN
        Zombie_Mental_Awareness = Mind_Sharp
        Zombie_Mental_Awareness_Message = "Sharp as a Tack!"
    END IF

    Zombie_Mental_Awareness_Start_Message$ = "Zombie's Mental Awareness: "
    MessageX = (80 - (LEN(Zombie_Mental_Awareness_Start_Message$) + LEN(Zombie_Mental_Awareness_Message))) / 2
    OutlineString 4, MessageX, 1, 1, Zombie_Mental_Awareness_Start_Message$ + Zombie_Mental_Awareness_Message

    ZombieMessageX = 2
    ZombieMessageY = 27

    'LOCATE 22, 1
    COLOR 12
    DisplayRoomInfo

    LOCATE 28, 4
    COLOR 15
    GetInputAndParse

LOOP

END SUB


' **************************************************************************************
' DISPLAY ROOM INFORMATION
' **************************************************************************************
SUB DisplayRoomInfo

_PRINTMODE _KEEPBACKGROUND

RoomDescriptionX = 2
RoomDescriptionY = 22
LOCATE RoomDescriptionY, RoomDescriptionX

SELECT CASE CurrentRoom

    ' *** ROOM #1 *********************************************************************************
    CASE 1

        SELECT CASE Zombie_Mental_Awareness

            CASE Mind_BrainDead
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Sniff... Sniff... Aaaahhhh!"
                ELSE
                    PRINT "uuuuuhhhh... uuuuuuuhhhh..."
                END IF

            CASE Mind_Weak
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Sniff... Sniff... Hungry..."
                ELSE
                    PRINT "Uuuuggghhh... Bad Chicken... Burn nose... No care..."
                END IF

            CASE Mind_Understanding
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Me on porch of farm house. Me smell food. Me still hungry."
                ELSE
                    PRINT "Me on porch of farm house. Me smell burning chicken. Me not care though. Me"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "Smell no food. Must move on. Fence around, must go through house."
                END IF

            CASE Mind_Sharp
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    ' Eat Ma, Pa, and Joan, but not Billy to get this message
                    PRINT "I am on the porch of a lovely farm house that looks like... Wait... This is my"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "farm house! Hello lovely! Wait! What is that I smell? Could it be a tiny morsel"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "of food! Someone is in my house!"
                ELSE
                    PRINT "I am on the porch of a lovely farm house that looks like... Wait... This is my"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "farm house! Hello lovely! I will be back for you after I find the cure to this"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "aweful disease. There is a fence around the area now, and it looks like I can"
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "get to the other side, by going through the house."
                END IF

        END SELECT

        ' *** ROOM #2 *********************************************************************************
    CASE 2

        SELECT CASE Zombie_Mental_Awareness

            CASE Mind_BrainDead
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Sniff... Sniff... Aaaahhh..."
                ELSE
                    PRINT "Aaaahhhh!!! Aaaahhhh!!!"
                END IF

            CASE Mind_Weak
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Aaaaggghhhh!!! Zombie! No... Me... Sniff... Sniff..."
                ELSE
                    PRINT "Aaaaggghhhh!!! Zombie! No... Me... Sniff... Yuck... Bad... Chicken..."
                END IF

            CASE Mind_Understanding
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Aaaaggghhh!!! Me see Zombie... No... Me in mirror. Sniff... Sniff... Me"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "smell food... Living People in house..."
                ELSE
                    PRINT "Aaaaggghhh!!! Me see Zombie... No... Me in mirror. Me no look... Me smell"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "burning chicken... Yuck..."
                END IF

            CASE Mind_Sharp

                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    ' Eat Ma, Pa, and Joan, but not Billy to get this message
                    PRINT "Aaaaggghhh!!! I see my mother's huge mirror hanging on the wall, and I see a"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "reflection that I don't want to see. What's that? It sounds like someone"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "watching tv in my house. Cartoons? I must investigate it. Maybe I can scare"
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "them away when they see me."
                ELSE
                    PRINT "Aaaaggghhh!!! I see my mother's huge mirror hanging on the wall, and I see a"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "reflection that I don't want to see. The house seems to be empty as I can not"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "hear anything, but I smell burning chicken. Someone was here!"
                END IF

        END SELECT

        ' *** ROOM #3 *********************************************************************************
    CASE 3

        SELECT CASE Zombie_Mental_Awareness

            CASE Mind_BrainDead
                IF NPC_Pa > 0 THEN
                    PRINT "Oooooohhhhh! Sniff... Sniff... Aaaarrrrgggg! Oooohhhhh! Br...ane..."
                ELSE
                    PRINT "Aaaarrrggghhh!"
                END IF

            CASE Mind_Weak
                IF NPC_Pa > 0 THEN
                    PRINT "Oooooohhhhh! Sniff... Food... Starving..."
                ELSE
                    PRINT "Aaaarrrggghhh! Food... Gone..."
                END IF

            CASE Mind_Understanding
                '          123456789012345678901234567890123456789012345678901234567890123456789012345678
                IF NPC_Pa > 0 THEN
                    PRINT "Me find Pa... He reading tractor magazine... He no see me... Me tap him..."
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "He scared... He not move... Food smell good... Somewhat hungry..."
                ELSE
                    PRINT "Pa on floor... No food here... Somewhat hungry... Must find more food..."
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "Aaaggghh! Me tripped over his entrails!!!"
                END IF

            CASE Mind_Sharp
                ' If the zombie's mind is sharp at this point, then Pa has to be dead.
                PRINT "I see an old man Pa on the floor and he doesn't have any brains left. Of"
                LOCATE RoomDescriptionY + 1, RoomDescriptionX
                PRINT "course, I am the one who ate them and enjoyed it. This disease really"
                LOCATE RoomDescriptionY + 2, RoomDescriptionX
                PRINT "makes you hungry for things you normally wouldn't eat. But I need my mental"
                LOCATE RoomDescriptionY + 3, RoomDescriptionX
                PRINT "capacity so I can find the cure to this damn mess. I wonder how many people"
                LOCATE RoomDescriptionY + 4, RoomDescriptionX
                PRINT "I can save when I do find it?"
                '      123456789012345678901234567890123456789012345678901234567890123456789012345678

        END SELECT

        ' *** ROOM #4 *********************************************************************************
    CASE 4

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Sniff... Sniff... Aaaahhh..."
                ELSE
                    PRINT "Aaaahhhh!!! Aaaahhhh!!!"
                END IF

            CASE Mind_Weak
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Sniff... Sniff... Hungry..."
                ELSE
                    PRINT "Uuuuggghhh... Bad Chicken... Burn nose... No care... Me hungry..."
                END IF

            CASE Mind_Understanding
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Sniff... Sniff... Still smell food. Hungry... North is living room. East"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "is hallway."
                ELSE
                    PRINT "Me smell no food here... Still hungry... North is living room. East is"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "hallway. Me smell burning chicken..."
                END IF

            CASE Mind_Sharp
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    ' Eat Ma, Pa, and Joan, but not Billy to get this message
                    PRINT "I remember this house being huge. There is a living room to the north, a"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "hallway to the east with a shut bedroom door, and an open bedroom door to"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "the south. My family and I had some good times in this house. I wonder"
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "what happened to my wife, and I hope that she is ok. I still smell living"
                    LOCATE RoomDescriptionY + 4, RoomDescriptionX
                    PRINT "people in this house. Hopefully I don't need to eat them."
                ELSE
                    PRINT "I remember this house being huge. There is a living room to the north, a"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "hallway to the east with a shut bedroom door, and an open bedroom door to"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "the south. My family and I had some good times in this house. I wonder"
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "what happened to my wife, and I hope that she is ok. I smell burning"
                    LOCATE RoomDescriptionY + 4, RoomDescriptionX
                    PRINT "chicken. Where is that coming from?"
                END IF
                '      123456789012345678901234567890123456789012345678901234567890123456789012345678

        END SELECT

        ' *** ROOM #5 *********************************************************************************
    CASE 5

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                IF NPC_Joan > 0 THEN
                    PRINT "Oooooohhhhh! Sniff... Sniff... Aaaarrrrgggg! Oooohhhhh! Br...ane..."
                ELSE
                    PRINT "Aaaarrrggghhh!"
                END IF

            CASE Mind_Weak
                IF NPC_Joan > 0 THEN
                    PRINT "Oooooohhhhh! Sniff... Food... Starving..."
                ELSE
                    PRINT "Aaaarrrggghhh! Food... Gone..."
                END IF

            CASE Mind_Understanding
                IF NPC_Joan > 0 THEN
                    PRINT "Me see Joan... She scream... She scared... She no move... Frozen... Easy"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "meal... If me want it... Me hungry..."
                ELSE
                    PRINT "Joan on floor... She no brain... No food..."
                END IF

            CASE Mind_Sharp
                ' *** If the mind is sharp, then Joan has been eaten.
                PRINT "I see poor Joan, laying on the floor with blood dripping from the hole in her"
                LOCATE RoomDescriptionY + 1, RoomDescriptionX
                PRINT "head where I had eaten her brain. I don't think 'Joan' is her real name, but"
                LOCATE RoomDescriptionY + 2, RoomDescriptionX
                PRINT "it is the name I have given her. I don't want to think like a full-blown"
                LOCATE RoomDescriptionY + 3, RoomDescriptionX
                PRINT "zombie where living creatures are just our cattle that we can do what-ever we"
                LOCATE RoomDescriptionY + 4, RoomDescriptionX
                PRINT "want with. No, I do not want too many regrets when I turn back into a human."
                '      123456789012345678901234567890123456789012345678901234567890123456789012345678

        END SELECT

        ' *** ROOM #6 *********************************************************************************
    CASE 6

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Ahhhhh! Sniff... Sniff..."
                ELSE
                    PRINT "Ahhhhh! Arrrggg..."
                END IF

            CASE Mind_Weak
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Sniff... Sniff... Hungry... Food... Must Find..."
                ELSE
                    PRINT "Hungry... Food..."
                END IF

            CASE Mind_Understanding
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Me at end of hallway. West to bedroom. North to rest of house. Bright light"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "coming from Joan bedroom... Hurt me eyes... Arrrrggghhh... No go in"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "bedroom... Me think trap... Sniff... Sniff... Me smell food. Me hungry..."
                ELSE
                    PRINT "Me at end of hallway. West to bedroom. North to rest of house. Bright light"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "coming from Joan bedroom... Hurt me eyes... Arrrrggghhh... No go in"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "bedroom... Me think trap..."
                END IF
                '          123456789012345678901234567890123456789012345678901234567890123456789012345678

            CASE Mind_Sharp
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    ' Eat Ma, Pa, and Joan, but not Billy to get this message
                    PRINT "I am at the end of the hall, standing in front of Joan's bedroom door."
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "The door is open and there is a bright light shining from the other"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "side of the room. The light is pointed at the door, and with it being"
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "opened, I suspect this is a clever trap created by Joan. I better not"
                    LOCATE RoomDescriptionY + 4, RoomDescriptionX
                    PRINT "go in there. I still smell living people here, but I don't need them."
                ELSE
                    PRINT "I am at the end of the hall, standing in front of Joan's bedroom door."
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "The door is open and there is a bright light shining from the other"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "side of the room. The light is pointed at the door, and with it being"
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "opened, I suspect this is a clever trap created by Joan. I better not"
                    LOCATE RoomDescriptionY + 4, RoomDescriptionX
                    PRINT "go in there. Joan, you were a clever girl, and I like you..."
                END IF
                '          123456789012345678901234567890123456789012345678901234567890123456789012345678

        END SELECT

        ' *** ROOM #7 *********************************************************************************
    CASE 7
        ' *** WE NEED TO SAVE THE CURRENT TEXT COLOR SINCE WE WILL CHANGE IT
        CurrentColor~& = _DEFAULTCOLOR

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "AAAAAAAAAHHHHHHHHHHH!!!!"

            CASE Mind_Weak
                PRINT "AAAAAAAAAHHHHHHHHHHH!!!! TRAP!!! KNEW IT!!!"

            CASE Mind_Understanding
                PRINT "AAAAAAAAAHHHHHHHHHHH!!!! DAMN ARROWS!!! I KNEW THIS WAS A TRAP!!! JOAN!!!"

            CASE Mind_Sharp
                PRINT "AAAAAAAAAHHHHHHHHHHH!!!! I KNEW JOAN HAD SET A TRAP!!! AAAAAAAAAHHHHHHHHHHH!!!"
                LOCATE RoomDescriptionY + 1, RoomDescriptionX
                PRINT "She was a very clever girl indeed. Joan had setup an automatic reloading"
                LOCATE RoomDescriptionY + 2, RoomDescriptionX
                PRINT "crossbow that will fire aim and fire at something when it enters the room."
                LOCATE RoomDescriptionY + 3, RoomDescriptionX
                PRINT "She created a large metal cartridge to store thousands of arrows."
                '      123456789012345678901234567890123456789012345678901234567890123456789012345678

        END SELECT

        IF RoomActionPerformed = 0 THEN

            COLOR 15
            DamageMessageY = RoomDescriptionY + 2
            IF Zombie_Mental_Awareness = Mind_Sharp THEN DamageMessageY = RoomDescriptionY + 5
            OutlineString DamageMessageY, 25, 14, 1, "YOU TOOK 25-POINTS OF DAMAGE!"
            COLOR currentcolor

            ' *** SET THE DAMAGE TO A SMALL ENOUGH AMOUNT SO THE PLAYER CAN GET A TASTE OF DAMAGE,
            ' *** BUT NOT ENOUGH WHERE THEY CAN'T MOVE ON.
            Zombie_Health = Zombie_Health - 25

            RoomActionPerformed = 1
            IF Zombie_Health <= 0 THEN PlayerDies

        END IF

        ' *** ROOM #8 *********************************************************************************
    CASE 8

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Ahhhhh! Sniff... Sniff..."
                ELSE
                    PRINT "Ahhhhh! Arrrggg..."
                END IF

            CASE Mind_Weak
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Sniff... Sniff... Hungry... Food... Must Find..."
                ELSE
                    PRINT "Hungry... Food..."
                END IF

            CASE Mind_Understanding
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Pretty flowers... Wallpaper. West... Front of house. East... Back of"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "house. See bedrooms East... Smell food... Hungry..."
                ELSE
                    PRINT "Pretty flowers... Wallpaper. West... Front of house. East... Back of"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "house. See bedrooms East..."
                END IF

            CASE Mind_Sharp
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    ' Eat Ma, Pa, and Joan, but not Billy to get this message
                    PRINT "The walls are covered with pretty wallpaper that have all kinds of flowers"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "on it. My wife wanted the home to feel more country, so I put it up for"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "her. I remember how happy we were here before this man-made infection"
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "started spreading, causing all the chaos. Those were the days... I still"
                    LOCATE RoomDescriptionY + 4, RoomDescriptionX
                    PRINT "smell living people here, but I don't have any need for them."
                ELSE
                    PRINT "The walls are covered with pretty wallpaper that have all kinds of flowers"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "on it. My wife wanted the home to feel more country, so I put it up for"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "her. I remember how happy we were here before this man-made infection"
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "started spreading, causing all the chaos. Those were the days..."
                END IF
                '      123456789012345678901234567890123456789012345678901234567890123456789012345678

        END SELECT

        ' *** ROOM #9 *********************************************************************************
    CASE 9

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Ahhhhh! Sniff... Sniff..."
                ELSE
                    PRINT "Ahhhhh! Arrrggg..."
                END IF

            CASE Mind_Weak
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Sniff... Sniff... Hungry... Food... Must Find..."
                ELSE
                    PRINT "Hungry... Food..."
                END IF

            CASE Mind_Understanding
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "North... Bedroom... Board up... East... Bedroom... Boarded up... I smell"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "living people... Hungry... Eat..."
                ELSE
                    PRINT "North... Bedroom... Board up... East... Bedroom... Boarded up..."
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "Hungry... Eat..."
                END IF

            CASE Mind_Sharp
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    ' Eat Ma, Pa, and Joan, but not Billy to get this message
                    PRINT "I am at the end of the hallway and I see a bedroom door to the North and"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "one to the East. They are both boarded up so I can't go in them. I hear"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "braindead zombies in both of them. I guess they broke in and the people"
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "staying here now must of locked them in so the can't get out. They are"
                    LOCATE RoomDescriptionY + 4, RoomDescriptionX
                    PRINT "roundy, and I know why. I smell someone else around here. I'm Not hungry."
                ELSE
                    PRINT "I am at the end of the hallway and I see a bedroom door to the North and"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "one to the East. They are both boarded up so I can't go in them. I hear"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "braindead zombies in both of them. I guess they broke in and the people"
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "staying here now must of locked them in so the can't get out. They are"
                    LOCATE RoomDescriptionY + 4, RoomDescriptionX
                    PRINT "fairly quit, but that's because there are no living persons here to eat."
                END IF
                '      123456789012345678901234567890123456789012345678901234567890123456789012345678

        END SELECT

        ' *** ROOM #10 *********************************************************************************
    CASE 10

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Ahhhhh! Sniff... Sniff..."
                ELSE
                    PRINT "Ahhhhh! Arrrggg..."
                END IF

            CASE Mind_Weak
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Sniff... Sniff... Hungry... Food... Must Find... Oooooohhh... Picture..."
                ELSE
                    PRINT "Hungry... Food..."
                END IF

            CASE Mind_Understanding
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Me in nother hallway. East... Bathroom... Boarded up... Me smell food..."
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "Me see picture of family..."
                ELSE
                    PRINT "Me in nother hallway. East... Bathroom... Boarded up..."
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "Me see picture of family..."
                END IF

            CASE Mind_Sharp
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    ' Eat Ma, Pa, and Joan, but not Billy to get this message
                    PRINT "I am in another small hallway and there is a bathroom to the East, but it"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "is boarded up tight. I see a bedroom to the south and a window that looks"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "out to the front yard. The main living room is to the South East if I can"
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "remember correctly. I can smell someone, though I am not hungry, and I can"
                    LOCATE RoomDescriptionY + 4, RoomDescriptionX
                    PRINT "hear a Television playing cartoons. Ah. My families picture is to the west."
                ELSE
                    PRINT "I am in another small hallway and there is a bathroom to the East, but it"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "is boarded up tight. I see a bedroom to the south and a window that looks"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "out to the front yard. The main living room is to the South East if I can"
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "remember correctly. I really smell burning chicken. Nasty. Ah. I see my"
                    LOCATE RoomDescriptionY + 4, RoomDescriptionX
                    PRINT "families picture to th west."
                END IF
                '      123456789012345678901234567890123456789012345678901234567890123456789012345678

        END SELECT

        ' *** ROOM #11 *********************************************************************************
    CASE 11

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Ahhhhh! Sniff... Sniff... Arrrgggghhhh! (You trip over a backpack)"
                ELSE
                    PRINT "Ahhhhh! Arrrggg..."
                END IF

            CASE Mind_Weak
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Sniff... Sniff... Hungry... Food... Must Find... Arrrggghhh! (You trip over a"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "backpack)"
                ELSE
                    PRINT "Hungry... Food... Arrrggghhh! (You trip over a backpack)"
                END IF

            CASE Mind_Understanding
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Me in living room... Me see... Me hear... Television playing to East Me"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "see kid on floor... playing cars... Bedroom to West... Boarded up... Me"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "hungry... Arrrggghhh! (You trip over a backpack)"
                ELSE
                    PRINT "Me in living room... Bedroom to West... Boarded up... Me hungry..."
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "Arrrggghhh! (You trip over a backpack)"
                END IF

            CASE Mind_Sharp
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    ' Eat Ma, Pa, and Joan, but not Billy to get this message
                    PRINT "I am in the west side of the largest living room in the house, and I see"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "the master bedroom to the West, but it too is boarded up. The zombie's"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "are apparently taking over this house. I should know... I see a kid on"
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "the floor playing with cars and watching cartoons. I don't want to eat"
                    LOCATE RoomDescriptionY + 4, RoomDescriptionX
                    PRINT "him. I want to let him grow up and have some kind of life."
                    LOCATE RoomDescriptionY + 5, RoomDescriptionX
                    PRINT "Arrrggghhh! (You trip over a backpack)"
                ELSE
                    PRINT "I am in the west side of the largest living room in the house, and I see"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "the master bedroom to the West, but it too is boarded up. The zombie's"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "are apparently taking over this house. I should know..."
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "Arrrggghhh! (You trip over a backpack)"
                END IF
                '      123456789012345678901234567890123456789012345678901234567890123456789012345678

        END SELECT

        ' *** ROOM #12 *********************************************************************************
    CASE 12

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                IF NPC_Billy > 0 THEN
                    PRINT "Oooooohhhhh! Sniff... Sniff... Aaaarrrrgggg! Oooohhhhh! Br...ane..."
                ELSE
                    PRINT "Aaaarrrggghhh!"
                END IF

            CASE Mind_Weak
                IF NPC_Billy > 0 THEN
                    PRINT "Oooooohhhhh! Sniff... Food... Starving... Billy? No!!! Run..."
                ELSE
                    PRINT "Aaaarrrggghhh! Food... Gone..."
                END IF

            CASE Mind_Understanding
                IF NPC_Billy > 0 THEN
                    PRINT "Me in living room... Me see Billy... My son? On floor... Playing cars... He"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "watching cartoons. Me hungry... Must eat... No... No eat Billy! Me love him."
                ELSE
                    PRINT "Me in living room... Me hungry... Must eat..."
                END IF

            CASE Mind_Sharp
                IF NPC_Billy > 0 THEN
                    ' Eat Ma, Pa, and Joan, but not Billy to get this message
                    '      123456789012345678901234567890123456789012345678901234567890123456789012345678
                    PRINT "I see Billy, my son, sitting on the floor playing with his cars and watching"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "cartoons. Tears of joy are running down my face to see my son is still alive"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "and doing well. No! Billy looked up, saw me, and jump up screaming, 'PA!' and"
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "and gave me a big hug. I had to tell him that Pa is sick and he must not hug"
                    LOCATE RoomDescriptionY + 4, RoomDescriptionX
                    PRINT "him right now. He cried for a moment until I made him sit, watch tv, and play"
                    LOCATE RoomDescriptionY + 5, RoomDescriptionX
                    PRINT "with his toys until I came back to get him."
                ELSE
                    PRINT "I see poor Billy's lifeless, and brainless, body laying on the livingroom"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "floor, and I am very sad that I had to eat him. I wanted him to live, to"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "have a long life, but maybe it's for the best. I did save him from the"
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "pains he would of been facing later down the road. No one is alive here to"
                    LOCATE RoomDescriptionY + 4, RoomDescriptionX
                    PRINT "take care of him. I accidently turned the volume down on the TV when I"
                    LOCATE RoomDescriptionY + 5, RoomDescriptionX
                    PRINT "attempted to wipe the blood off it. At least the zombie won't hear it."
                END IF
                '      123456789012345678901234567890123456789012345678901234567890123456789012345678

        END SELECT

        ' *** ROOM #13 *********************************************************************************
    CASE 13

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Sniff... Sniff... Aaaahhh..."
                ELSE
                    PRINT "Aaaahhhh!!! Aaaahhhh!!!"
                END IF

            CASE Mind_Weak
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Sniff... Sniff... Hungry..."
                ELSE
                    PRINT "Uuuuggghhh... Bad Chicken... Burn nose... No care... Me hungry..."
                END IF

            CASE Mind_Understanding
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Me in living room... Me see dinning room North... Closet East... Closet"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "boarder up... Me smell food... Me hungry... Me see doll on floor... Billy"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "may want it."
                ELSE
                    PRINT "Me in living room... Me see dinning room North... Closet East... Closet"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "boarder up... Me not smell no food... Me hungry... Me see doll on floor."
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "Me think it Billy's. Me smell burning chicken..."
                END IF

            CASE Mind_Sharp
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    ' Eat Ma, Pa, and Joan, but not Billy to get this message
                    PRINT "I am in the living room, and I see Billy on the floor to the West. I also"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "see the dining room to the North. There is a closet to the East, but it is"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "boarded up. Billy's teddy bear is on the floor, but I will leave it alone."
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "I smell a living person around here, but I am not hungry, and I will leave"
                ELSE
                    PRINT "I am in the living room, and I see Billy on the floor to the West. I also"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "see the dining room to the North. There is a closet to the East, but it is"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "boarded up. Billy's teddy bear is on the floor, but I will leave it alone."
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "them alone. I do however smell burning chicken."
                END IF
                '      123456789012345678901234567890123456789012345678901234567890123456789012345678

        END SELECT

        ' *** ROOM #14 *********************************************************************************
    CASE 14

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Sniff... Sniff... Aaaahhh..."
                ELSE
                    PRINT "Aaaahhhh!!! Aaaahhhh!!!"
                END IF

            CASE Mind_Weak
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Sniff... Sniff... Hungry..."
                ELSE
                    PRINT "Uuuuggghhh... Bad Chicken... Burn nose... No care... Me hungry..."
                END IF

            CASE Mind_Understanding
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    PRINT "Me in dinning room... Me see knife on table... No need knife... Me"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "hungry... Must eat... Me smell living..."
                ELSE
                    PRINT "Me in dinning room... Me see knife on table... No need knife... Me"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "smell burning chicken..."
                END IF

            CASE Mind_Sharp
                IF NPC_Ma + NPC_Pa + NPC_Billy + NPC_Joan > 0 THEN
                    ' Eat Ma, Pa, and Joan, but not Billy to get this message
                    PRINT "I am in the dinning room, staring at the huge, eight seat, oak table I"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "bought my wife for our anniversary. It is bare other than a rusty butter"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "sitting on it. I would of pitched a fit about the knife when I was living,"
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "it could scratch the beautiful table. I was picky. Maybe I will be again."
                    LOCATE RoomDescriptionY + 4, RoomDescriptionX
                    PRINT "I smell a living person in the house, but I am not hungry so I will leave"
                    LOCATE RoomDescriptionY + 5, RoomDescriptionX
                    PRINT "them alone."
                ELSE
                    PRINT "I am in the dinning room, staring at the huge, eight seat, oak table I"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "bought my wife for our anniversary. It is bare other than a rusty butter"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "sitting on it. I would of pitched a fit about the knife when I was living,"
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "it could scratch the beautiful table. I was picky. Maybe I will be again."
                    LOCATE RoomDescriptionY + 4, RoomDescriptionX
                END IF
                '      123456789012345678901234567890123456789012345678901234567890123456789012345678

        END SELECT


        ' *** ROOM #15 *********************************************************************************
    CASE 15

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                IF NPC_Ma > 0 THEN
                    PRINT "Oooooohhhhh! Sniff... Sniff... Aaaarrrrgggg! Oooohhhhh! Br...ane..."
                ELSE
                    PRINT "Aaaarrrggghhh!"
                END IF

            CASE Mind_Weak
                IF NPC_Ma > 0 THEN
                    PRINT "Oooooohhhhh! Sniff... Food... Starving..."
                ELSE
                    PRINT "Aaaarrrggghhh! Food... Gone..."
                END IF

            CASE Mind_Understanding
                IF NPC_Ma > 0 THEN
                    PRINT "Me in kitchen... Me see Ma... She tired... Need rest... She no see me..."
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "Me hungry..."
                ELSE
                    PRINT "Me in kitchen... Me see Ma... She on floor... She sleep... No brain..."
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "Me hungry... Me smell burning chicken... Burn nose bad... No care..."
                END IF

            CASE Mind_Sharp
                PRINT "I see Ma laying on the floor in a pool of grease and blood. She was frying"
                LOCATE RoomDescriptionY + 1, RoomDescriptionX
                PRINT "chicken when I attacked her, so all the contents went everywhere. A piece of"
                LOCATE RoomDescriptionY + 2, RoomDescriptionX
                PRINT "chicken landed on the stove eye and is slowly burning like a little camp fire."
                LOCATE RoomDescriptionY + 3, RoomDescriptionX
                PRINT "It stinks, but I don't care since I am already dead. Maybe it will keep people"
                LOCATE RoomDescriptionY + 4, RoomDescriptionX
                PRINT "out of my home."
                '      123456789012345678901234567890123456789012345678901234567890123456789012345678

        END SELECT


        ' *** ROOM #16 *********************************************************************************
    CASE 16

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "Ooooooaaaaahhhhh! Aaaaaaahhhhhhhh!"
            CASE Mind_Weak
                PRINT "Sun... Warm..."
            CASE Mind_Understanding
                PRINT "Me see sun... It warm... Must to town... Leave house"
            CASE Mind_Sharp
                PRINT "I am just outside my old home and the sun is shinning down on me. I must go to"
                LOCATE RoomDescriptionY + 1, RoomDescriptionX
                PRINT "the town now and find where I use to work so I can find the cure."

        END SELECT


        ' *** ROOM #17 *********************************************************************************
    CASE 17

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "..."
            CASE Mind_Weak
                PRINT "Grass..."
            CASE Mind_Understanding
                PRINT "Me in tall grass... Me go to town..."
            CASE Mind_Sharp
                PRINT "I am in a field of tall grass that needs to be cut, but I can not worry about"
                LOCATE RoomDescriptionY + 1, RoomDescriptionX
                PRINT "it right as I need to go to town."

        END SELECT

        ' *** ROOM #18 *********************************************************************************
    CASE 18

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "..."

            CASE Mind_Weak
                PRINT "Road... Town..."

            CASE Mind_Understanding
                PRINT "Me on road... No cars..."

            CASE Mind_Sharp
                PRINT "I am on a road that leads to town, and the pavement is hot."

        END SELECT

        ' *** ROOM #19 *********************************************************************************
    CASE 19

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "..."

            CASE Mind_Weak
                PRINT "Quite..."

            CASE Mind_Understanding
                PRINT "Me so no one... Where people?"

            CASE Mind_Sharp
                PRINT "There is silence all around me that really is starting to creep me out. There"
                LOCATE RoomDescriptionY + 1, RoomDescriptionX
                PRINT "are no birds, no animals, ad no people. Where did they all go?"

        END SELECT

        ' *** ROOM #20 *********************************************************************************
    CASE 20

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "...uuuffff..."

            CASE Mind_Weak
                PRINT "Hot... Cars..."

            CASE Mind_Understanding
                PRINT "Me see cars. They piled up. Smoke in air."

            CASE Mind_Sharp
                PRINT "There is a car pile up in front of me and many of them are burning, causing a"
                LOCATE RoomDescriptionY + 1, RoomDescriptionX
                PRINT "lot of black smoke to fill the air, chocking those around, if they were anyone"
                LOCATE RoomDescriptionY + 2, RoomDescriptionX
                PRINT "around."


        END SELECT

        ' *** ROOM #21 *********************************************************************************
    CASE 21

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "..."

            CASE Mind_Weak
                PRINT "Town... Ahead"

            CASE Mind_Understanding
                PRINT "Me see town ahead. Me so close to cure..."

            CASE Mind_Sharp
                PRINT "I see the town just ahead of me, and I am getting closer to my place of work"
                LOCATE RoomDescriptionY + 1, RoomDescriptionX
                PRINT "where the cure is at. I am getting very excited about it."

        END SELECT

        ' *** ROOM #22 *********************************************************************************
    CASE 22

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "..."

            CASE Mind_Weak
                PRINT "Bad... Area..."

            CASE Mind_Understanding
                PRINT "Me no like area... Must go town."

            CASE Mind_Sharp
                PRINT "This area is a bad area since there are many places for a sniper to hide."

        END SELECT

        'PRINT "Hear gun shots. Call me? For help? Me heart's hurting. Snipers! Bad area.";

        ' *** IF THE PLAYER DID NOT GRAB THE BACKPACK, THEN THEY DIDN'T APPLY ANY MAKEUP, WHICH LEADS THE
        ' *** SNIPER TO BELIEVE YOUR A FULL FLEDGE ZOMBIE, THUS TAKING A POP SHOT AT YOU.
        '      12345678901234567890123456789012345678901234567890123456789012345678901234567890
        IF Has_BackPack = FALSE THEN
            IF RoomActionPerformed = 0 THEN
                COLOR 15
                OutlineString ZombieMessageY, 25, 13, 1, "YOU TOOK 150-POINTS OF DAMAGE!"
                Zombie_Health = Zombie_Health - 150
                RoomActionPerformed = 1
                IF Zombie_Health <= 0 THEN PlayerDies
            END IF
        END IF

        ' *** ROOM # *********************************************************************************
    CASE 23

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "..."

            CASE Mind_Weak
                PRINT "Cars..."

            CASE Mind_Understanding
                PRINT "More cars... Piled up! Must climb... again..."

            CASE Mind_Sharp
                PRINT "There is another car pile up here, but at least they are not buring."

        END SELECT
        PRINT "Road blocked by cars. No matter. Me just climb over them."

        ' *** ROOM # *********************************************************************************
    CASE 24

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "..."

            CASE Mind_Weak
                PRINT "... ??? ..."

            CASE Mind_Understanding
                PRINT "Remember place. Hard to think..."

            CASE Mind_Sharp
                PRINT "I remember this place very well as it is coming back to me. Must get to the."
                LOCATE RoomDescriptionY + 1, RoomDescriptionX
                PRINT "base."
        END SELECT
        '      12345678901234567890123456789012345678901234567890123456789012345678901234567890

        ' *** ROOM # *********************************************************************************
    CASE 25

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "..."

            CASE Mind_Weak
                PRINT "... Nothing ..."

            CASE Mind_Understanding
                PRINT "Nothing... Here..."

            CASE Mind_Sharp
                PRINT "There is nothing of interest here. Must get to the base."

        END SELECT

        ' *** ROOM # *********************************************************************************
    CASE 26

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "..."

            CASE Mind_Weak
                PRINT "... ??? ..."

            CASE Mind_Understanding
                PRINT "Nothing here..."

            CASE Mind_Sharp
                PRINT "Another empty place. Where is everyone?"

        END SELECT

        ' *** ROOM # *********************************************************************************
    CASE 27

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "..."

            CASE Mind_Weak
                PRINT "... Nice ..."

            CASE Mind_Understanding
                PRINT "Nice place. Me been here... many times..."

            CASE Mind_Sharp
                PRINT "This once was a nice to place to visit, but now it is deserted, and dirty."

        END SELECT

        ' *** ROOM # *********************************************************************************
    CASE 28

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "..."

            CASE Mind_Weak
                PRINT "Town..."

            CASE Mind_Understanding
                PRINT "At edge of town... Car pile up..."

            CASE Mind_Sharp
                PRINT "I am at the edge of town and there is another freaking car pile up. There is a"
                LOCATE RoomDescriptionY + 1, RoomDescriptionX
                PRINT "street to the west of me."

        END SELECT

        ' *** ROOM # *********************************************************************************
    CASE 29

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "..."

            CASE Mind_Weak
                PRINT "Street... End..."

            CASE Mind_Understanding
                PRINT "Street ends... No go west."

            CASE Mind_Sharp
                PRINT "The street comes to an end and there is nothing here. Time to back track."

        END SELECT

        ' *** ROOM # *********************************************************************************
    CASE 30

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "..."

            CASE Mind_Weak
                PRINT "Blood..."

            CASE Mind_Understanding
                PRINT "Me see blood... on street... Stores to East... More town... West..."

            CASE Mind_Sharp
                PRINT "There is so much blood on the street here that it is almost sickening. I see"
                LOCATE RoomDescriptionY + 1, RoomDescriptionX
                PRINT "some stores to the East, and the rest of the town to the West."

        END SELECT

        ' *** ROOM # *********************************************************************************
    CASE 31

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "..."

            CASE Mind_Weak
                PRINT "Dead... Zombie..."

            CASE Mind_Understanding
                PRINT "Me see zombie... Hole in head... it dead..."

            CASE Mind_Sharp
                PRINT "I see the body of a dead zombie laying in the road, and it was shot in the"
                LOCATE RoomDescriptionY + 1, RoomDescriptionX
                PRINT "head."


        END SELECT

        ' *** ROOM # *********************************************************************************
    CASE 32

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "...mmm..."

            CASE Mind_Weak
                PRINT "Bread?..."

            CASE Mind_Understanding
                PRINT "Me smell bread. Me see bakery. Nice..."

            CASE Mind_Sharp
                PRINT "I see a bakery to the North of me, and I can smell bread."

        END SELECT

        ' *** ROOM # *********************************************************************************
    CASE 33

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "...Aaaahhhh..."

            CASE Mind_Weak
                PRINT "Bakery...?"

            CASE Mind_Understanding
                PRINT "Me in bakery... Me buy bread... here... before..."

            CASE Mind_Sharp
                PRINT "Ahhh! Susan's Bakery! I use to love buying my bread here whenever I could"
                LOCATE RoomDescriptionY + 1, RoomDescriptionX
                PRINT "afford it, as it was the best in town."

        END SELECT

        ' *** ROOM # *********************************************************************************
    CASE 34

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "..."

            CASE Mind_Weak
                PRINT "Dresses... People? Pretty..."

            CASE Mind_Understanding
                PRINT "Me see dress shop... Me see people... in window... Pretty..."

            CASE Mind_Sharp
                PRINT "I am in the parking lot of Paula's Dress shop, and iit brings back memories. I"
                LOCATE RoomDescriptionY + 1, RoomDescriptionX
                PRINT "bought my wife's wedding gown here. Paula was a very wonderful person."

        END SELECT

        ' *** ROOM # *********************************************************************************
    CASE 35

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "..."

            CASE Mind_Weak
                PRINT "Dresses... No brains..."

            CASE Mind_Understanding
                PRINT "Me in dress store... No body here... Me see bunch of fake people..."

            CASE Mind_Sharp
                PRINT "I am in Paula's dress shop, and what a mess it is in. The mannequin's makes it"
                LOCATE RoomDescriptionY + 1, RoomDescriptionX
                PRINT "look like there are people in this store."

        END SELECT

        ' *** ROOM # *********************************************************************************
    CASE 36

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT "...Sniff... ...Sniff..."

            CASE Mind_Weak
                PRINT "Brains?"

            CASE Mind_Understanding
                PRINT "Me see man... In car... to West..."

            CASE Mind_Sharp
                PRINT "I see an old man in a car to the West. I wonder what he is doing."

        END SELECT

        ' *** ROOM # *********************************************************************************
    CASE 37

        IF NPC_OldMan > 0 THEN

            SELECT CASE Zombie_Mental_Awareness

                '          123456789012345678901234567890123456789012345678901234567890123456789012345678
                CASE Mind_BrainDead
                    PRINT "...Bra ...ne Sniff... Sniff..."

                CASE Mind_Weak
                    PRINT "Old Man... car... Brains?"

                CASE Mind_Understanding
                    PRINT "Me see old man... in car... He try steal car..."

                CASE Mind_Sharp
                    PRINT "I see an old man trying to steal a car and I wonder if he needs any help."

            END SELECT

        ELSE

            SELECT CASE Zombie_Mental_Awareness

                '          123456789012345678901234567890123456789012345678901234567890123456789012345678
                CASE Mind_BrainDead
                    PRINT "..."

                CASE Mind_Weak
                    PRINT "Dead... Man..."

                CASE Mind_Understanding
                    PRINT "Me see old man dead..."

                CASE Mind_Sharp
                    PRINT "I see the old man who was trying to steal the car, he his dead."

            END SELECT

        END IF

        IF NPC_OldMan > 0 THEN
            PRINT "Old man...try steal car."
        ELSE
            PRINT "Old man sleep on ground now...good brain."
        END IF
        'PRINT "Light on...in car...man move round...brains."

        ' *** ROOM # *********************************************************************************
    CASE 38

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "I in town square...so quiet."

        ' *** ROOM # *********************************************************************************
    CASE 39

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Police...board up."

        ' *** ROOM # *********************************************************************************
    CASE 40

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Narrow street...but hear voice."

        ' *** ROOM # *********************************************************************************
    CASE 41

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Office...Post...glass broken...light on."

        ' *** ROOM # *********************************************************************************
    CASE 42

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        IF NPC_Woman > 0 THEN
            PRINT "Woman...cry pack up mail...to work."
        ELSE
            PRINT "She call in sick...today."
        END IF

        ' *** ROOM # *********************************************************************************
    CASE 43

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Fire burn building...bright."

        ' *** ROOM # *********************************************************************************
    CASE 44

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Hear...sirens...where police?"

        ' *** ROOM # *********************************************************************************
    CASE 45

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Souless town...me find friend."

        ' *** ROOM # *********************************************************************************
    CASE 46

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Hungry...need eat."

        ' *** ROOM # *********************************************************************************
    CASE 47

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "I...I remember this store...why am I doing this?"

        ' *** ROOM # *********************************************************************************
    CASE 48

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        IF NPC_Teen > 0 THEN
            PRINT "Teen rob place...money...food...where he go?"
        ELSE
            PRINT "Back to me...eat candy...now brain real candy."
        END IF

        ' *** ROOM # *********************************************************************************
    CASE 49

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Town almost end...pity."

        ' *** ROOM # *********************************************************************************
    CASE 50

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Gas...no gas...not today."

        ' *** ROOM # *********************************************************************************
    CASE 51

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Leave town...base soon."

        ' *** ROOM # *********************************************************************************
    CASE 52

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Sun go down...night soon. Me like night."

        ' *** ROOM # *********************************************************************************
    CASE 53

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Military base...sign."

        ' *** ROOM # *********************************************************************************
    CASE 54

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Gate open...how nice."

        ' *** ROOM # *********************************************************************************
    CASE 55

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Place stink like death...oh that me."

        ' *** ROOM # *********************************************************************************
    CASE 56

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Place mess...paper...chair...everywhere."

        ' *** ROOM # *********************************************************************************
    CASE 57

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "No one here...doors locked."

        ' *** ROOM # *********************************************************************************
    CASE 58

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Someone cry? Why sad? Me here now!"

        ' *** ROOM # *********************************************************************************
    CASE 59

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        IF NPC_Soldier > 0 THEN
            PRINT "Guy...sit chair...cry...why sad? Nice day!"
        ELSE
            PRINT "Soldier no sad anymore...he in heaven."
        END IF

        ' *** ROOM # *********************************************************************************
    CASE 60

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Mess Hall...no one here."

        ' *** ROOM # *********************************************************************************
    CASE 61

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_nderstanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Where am I? Toilets? Why have I been cursed?"

        ' *** ROOM # *********************************************************************************
    CASE 62

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Dead end...light flicker...bother me."

        ' *** ROOM # *********************************************************************************
    CASE 63

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "I see hall...with exit...maybe more?"

        ' *** ROOM # *********************************************************************************
    CASE 64

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "I here machine."

        ' *** ROOM # *********************************************************************************
    CASE 65

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Light flicker...ahh...eye's."

        ' *** ROOM # *********************************************************************************
    CASE 66

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Glass door...open me...outside."

        ' *** ROOM # *********************************************************************************
    CASE 67

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Me see heli-opter...guy in seat."

        ' *** ROOM # *********************************************************************************
    CASE 68

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        IF NPC_Pilot > 0 THEN
            PRINT "He go over map...he busy...not notice...me. Try to take off..."
        ELSE
            PRINT "He scream...me only eat half brain...he go big boom...pretty light."
        END IF

        ' *** ROOM # *********************************************************************************
    CASE 69

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Grass...feel good on legs. It is night out...chilly."

        ' *** ROOM # *********************************************************************************
    CASE 70

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Come up to big park lot...no cars...just blood and dead."

        ' *** ROOM # *********************************************************************************
    CASE 71

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Night air feel good...wonder where others are?"

        ' *** ROOM # *********************************************************************************
    CASE 72

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "...This place seems familiar...I use to come to work here..."

        ' *** ROOM # *********************************************************************************
    CASE 73

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Seem in hurry...everything in mess."

        ' *** ROOM # *********************************************************************************
    CASE 74

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Big fence protect cars...keep me in...need to find way out."

        ' *** ROOM # *********************************************************************************
    CASE 75

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Moans and cries in night air...others near by..."

        ' *** ROOM # *********************************************************************************
    CASE 76

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Parking lot like small box maze..."

        ' *** ROOM # *********************************************************************************
    CASE 77

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Fence again..."

        ' *** ROOM # *********************************************************************************
    CASE 78

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Where exit?"

        ' *** ROOM # *********************************************************************************
    CASE 79

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "I see...other like me...Zombie!"

        ' *** ROOM # *********************************************************************************
    CASE 80

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Finally way out..."

        ' *** ROOM # *********************************************************************************
    CASE 81

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Cars everywhere...look like pile up."

        ' *** ROOM # *********************************************************************************
    CASE 82

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Look like big mess...not a brain in sight...grrr"

        ' *** ROOM # *********************************************************************************
    CASE 83

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Can't go on street...to much cars...sewer clear."

        ' *** ROOM # *********************************************************************************
    CASE 84

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Me walk into sewer...smell bad...but no cars."

        ' *** ROOM # *********************************************************************************
    CASE 85

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Path twist and turn...where people hide?"

        ' *** ROOM # *********************************************************************************
    CASE 86

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Echo...hear foot...step...other near by!"

        ' *** ROOM # *********************************************************************************
    CASE 87

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Zombie friend...she look confused."

        ' *** ROOM # *********************************************************************************
    CASE 88

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "No longer cold...but hungry for brains."

        ' *** ROOM # *********************************************************************************
    CASE 89

        SELECT CASE Zombie_Mental_Awareness

            CASE Mind_BrainDead

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 9, 77, 18, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                             12345678901234567890123456789012345678901234567890123456789012345678
                OutlineString 11, 27, 13, 1, "YOU HAVE JUST BEEN KILLED!"
                OutlineString 13, 8, 13, 1, "The homeless man in the sewer is E-314, and he is the protector of"
                OutlineString 14, 8, 13, 1, "base. He was the 314th expirement of the government's scientists"
                OutlineString 15, 8, 13, 1, "and he is a deadly force. Since your health is so low, he thought"
                OutlineString 16, 8, 13, 1, "you were just another zombie, and he killed you. "

                PlayerWait 15, 11
                COLOR colr~&

                PlayerDies

            CASE Mind_Weak

                IF NPC_Man > 0 THEN
                    PRINT "Strange... Man... Homeless... Zombie?... No?... Yes?... Human?..."
                ELSE
                    PRINT "Sad... Strange... Man... Dead?... No dead?... No pulse..."
                END IF

            CASE Mind_Understanding

                IF NPC_Man > 0 THEN
                    PRINT "Homeless Man strange... Like he human... and... Zombie?"
                ELSE
                    PRINT "Poor homeless man... He is strange... even dead..."
                END IF

            CASE Mind_Sharp

                IF NPC_Man > 0 THEN
                    PRINT "This homeless man seems to watching all who enter into his sewer, like he"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "is ready to strike. It is good to be afraid of dying, but there feels like"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "there is more to him then meets the eyes. Maybe I should talk to him and"
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "find out, or just leave him alone. I get a bad feeling about him. I need"
                    LOCATE RoomDescriptionY + 4, RoomDescriptionX
                    PRINT "to talk to the General about E-314."

                ELSE
                    PRINT "The homeless man is dead. I barely managed to kill him. He really was a"
                    LOCATE RoomDescriptionY + 1, RoomDescriptionX
                    PRINT "super soldier after all. He may of been protecting the base, but he was"
                    LOCATE RoomDescriptionY + 2, RoomDescriptionX
                    PRINT "too powerful to have been allowed to live. What if he got mad? He could"
                    LOCATE RoomDescriptionY + 3, RoomDescriptionX
                    PRINT "of killed everything, human and zombie, and nothing would had stopped if I"
                    LOCATE RoomDescriptionY + 4, RoomDescriptionX
                    PRINT "hadn't. Time to have a talk to the General about E-314!"
                END IF
                '          123456789012345678901234567890123456789012345678901234567890123456789012345678

        END SELECT

        ' *** ROOM # *********************************************************************************
    CASE 90

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Clean for sewer."

        ' *** ROOM # *********************************************************************************
    CASE 91

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Surprise...no one here?"

        ' *** ROOM # *********************************************************************************
    CASE 92

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Echo...ever step echo like thunder."

        ' *** ROOM # *********************************************************************************
    CASE 93

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Feel weird...almost like me been here before."

        ' *** ROOM # *********************************************************************************
    CASE 94

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Nothing but empty rooms...can't find anything but self."

        ' *** ROOM # *********************************************************************************
    CASE 95

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Feel like not alone...maybe rats are friends?"

        ' *** ROOM # *********************************************************************************
    CASE 96

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "In distance...see big open way..."

        ' *** ROOM # *********************************************************************************
    CASE 97

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Big door open...find food...maybe other like me."

        ' *** ROOM # *********************************************************************************
    CASE 98

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        IF NPC_Cop > 0 THEN
            PRINT "Cop sleep on job...fool...don't he know me here?"
        ELSE
            PRINT "I tap on shoulder...he scream...but quiet now."
        END IF

        ' *** ROOM # *********************************************************************************
    CASE 99

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "The sewer was a secret entranceway incase of this happening."
        PRINT "I use to work here for the Government..."

        ' *** ROOM # *********************************************************************************
    CASE 100

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Wide hallway...like hospital..."

        ' *** ROOM # *********************************************************************************
    CASE 101

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "No one around..."

        ' *** ROOM # *********************************************************************************
    CASE 102

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "I can't smell life only dead...not right."

        ' *** ROOM # *********************************************************************************
    CASE 103

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Everything quiet...only quiet...me no like it."

        ' *** ROOM # *********************************************************************************
    CASE 104

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "See office ahead."

        ' *** ROOM # *********************************************************************************
    CASE 105

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Empty...nothing...no chair...picture...pity."

        ' *** ROOM # *********************************************************************************
    CASE 106

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Memories...coming back...me like feel."

        ' *** ROOM # *********************************************************************************
    CASE 107

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Hall smell like lemon..."

        ' *** ROOM # *********************************************************************************
    CASE 108

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Me hear medical...noises."

        ' *** ROOM # *********************************************************************************
    CASE 109

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Medical room...I...I remember..."

        ' *** ROOM # *********************************************************************************
    CASE 110

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        IF NPC_Doctor > 0 THEN
            PRINT "Marc...it's you...your back from the dead."
        ELSE
            PRINT "Me no like past...me don't like past...he join me soon."
        END IF

        ' *** ROOM # *********************************************************************************
    CASE 111

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "What go on here?"

        ' *** ROOM # *********************************************************************************
    CASE 112

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Room...room...and more room...but nothing."

        ' *** ROOM # *********************************************************************************
    CASE 113

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Everything neat and clean...in hall."

        ' *** ROOM # *********************************************************************************
    CASE 114

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "I am at end of hall...more way to go."

        ' *** ROOM # *********************************************************************************
    CASE 115

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        IF NPC_Nurse > 0 THEN
            PRINT "She scream...no help come...she cry...no good."
        ELSE
            PRINT "I try to smile and grab...she no fight...brain gooood."
        END IF

        ' *** ROOM # *********************************************************************************
    CASE 116

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Everyone gone or what?"

        ' *** ROOM # *********************************************************************************
    CASE 117

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Hope other are here. Me alone here."

        ' *** ROOM # *********************************************************************************
    CASE 118

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "I no smell other living? Can't be gone..."

        ' *** ROOM # *********************************************************************************
    CASE 119

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Yellow walls...why...such ugly color..."

        ' *** ROOM # *********************************************************************************
    CASE 120

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Me see door...in distance..."

        ' *** ROOM # *********************************************************************************
    CASE 121

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "I feel happy...maybe me find friend."

        ' *** ROOM # *********************************************************************************
    CASE 122

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "A large vault like door. Roughly a foot thick...wonder if"
        PRINT "the others are here?"

        ' *** ROOM # *********************************************************************************
    CASE 123

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Another hall..."

        ' *** ROOM # *********************************************************************************
    CASE 124

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "More twist...more turn...when will end?"

        ' *** ROOM # *********************************************************************************
    CASE 125

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Cry...echo in hall...like ghost."

        ' *** ROOM # *********************************************************************************
    CASE 126

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Me stand in long hall."

        ' *** ROOM # *********************************************************************************
    CASE 127

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Slow make way down hall."

        ' *** ROOM # *********************************************************************************
    CASE 128

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Me see...store rooms..."

        ' *** ROOM # *********************************************************************************
    CASE 129

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Small store room...nothing I use..."

        ' *** ROOM # *********************************************************************************
    CASE 130

        SELECT CASE Zombie_Mental_Awareness

            '          123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Store room...what me go and use...toilet paper?"

        ' *** ROOM # *********************************************************************************
    CASE 131

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Wall ugly orange...like disco die here."

        ' *** ROOM # *********************************************************************************
    CASE 132

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Feel like cry...but me can't."

        ' *** ROOM # *********************************************************************************
    CASE 133

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Empty store room...time run out for them."

        ' *** ROOM # *********************************************************************************
    CASE 134

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        IF NPC_Coward > 0 THEN
            PRINT "I know him...he old boss...he drunk...he cry..."
        ELSE
            PRINT "Go in light...no more fear...brain not waste..."
        END IF

        ' *** ROOM # *********************************************************************************
    CASE 135

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "It like no one care anymore..."

        ' *** ROOM # *********************************************************************************
    CASE 136

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "This...lead to lab...me work here...grrr."

        ' *** ROOM # *********************************************************************************
    CASE 137

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Walls are blue...peaceful...relaxed...er clear mind."

        ' *** ROOM # *********************************************************************************
    CASE 138

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Grown...made by other...call to me..."

        ' *** ROOM # *********************************************************************************
    CASE 139

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Built like maze...confusing..."

        ' *** ROOM # *********************************************************************************
    CASE 140

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "I walk in hall...floor polished...see self...neat."

        ' *** ROOM # *********************************************************************************
    CASE 141

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Wonder what wife doing? Miss ffffamily..."

        ' *** ROOM # *********************************************************************************
    CASE 142

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Almost slip on nice floor."

        ' *** ROOM # *********************************************************************************
    CASE 143

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        IF NPC_Lady > 0 THEN
            PRINT "She go over paper work...she look at me...take off"
            PRINT "glasses...and tell me to get...it over...with?"
        ELSE
            PRINT "The others decided to stay, while I left for my family."
            PRINT "But it was too late and my son bite me...why am I doing"
            PRINT "this? God forgive me."
        END IF

        ' *** ROOM # *********************************************************************************
    CASE 144

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Me feel funny...feel...feel again..."

        ' *** ROOM # *********************************************************************************
    CASE 145

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Place empty...no one in sight..."

        ' *** ROOM # *********************************************************************************
    CASE 146

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Office empty...void of anything."

        ' *** ROOM # *********************************************************************************
    CASE 147

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Room...to sleep..."

        ' *** ROOM # *********************************************************************************
    CASE 148

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Room...to sleep..."

        ' *** ROOM # *********************************************************************************
    CASE 149

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Small room...small room..."

        ' *** ROOM # *********************************************************************************
    CASE 150

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Nothing...to eat...brain be nice."

        ' *** ROOM # *********************************************************************************
    CASE 151

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Me hear...laugh...someone here?"

        ' *** ROOM # *********************************************************************************
    CASE 152

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Me in hall...again."

        ' *** ROOM # *********************************************************************************
    CASE 153

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Me hear cry...no smell...just cry..."

        ' *** ROOM # *********************************************************************************
    CASE 154

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Place like haunt house."

        ' *** ROOM # *********************************************************************************
    CASE 155

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Place like grave...no one ever find it."

        ' *** ROOM # *********************************************************************************
    CASE 156

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Walls bright...color...nice."

        ' *** ROOM # *********************************************************************************
    CASE 157

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        IF NPC_Kid > 0 THEN
            PRINT "See kid...he scared......"
        ELSE
            PRINT "He try run...trip...he tasty brain..."
        END IF

        ' *** ROOM # *********************************************************************************
    CASE 158

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Not far to friend..."

        ' *** ROOM # *********************************************************************************
    CASE 159

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Room look like been sleep in."

        ' *** ROOM # *********************************************************************************
    CASE 160

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Feel home...here"

        ' *** ROOM # *********************************************************************************
    CASE 161

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Where they go?"

        ' *** ROOM # *********************************************************************************
    CASE 162

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Use be fill...did all die? Room quiet."

        ' *** ROOM # *********************************************************************************
    CASE 163

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Me feel...be watch..."

        ' *** ROOM # *********************************************************************************
    CASE 164

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Room mess...look like panic..."

        ' *** ROOM # *********************************************************************************
    CASE 165

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Me in hall...me...feel..."

        ' *** ROOM # *********************************************************************************
    CASE 166

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Stand before...security...room."

        ' *** ROOM # *********************************************************************************
    CASE 167

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        IF NPC_Driver > 0 THEN
            PRINT "He look at me...not scared...look happy."
        ELSE
            PRINT "He run like chicken...no head...he fall...brain touch floor."
        END IF

        ' *** ROOM # *********************************************************************************
    CASE 168

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Me hear...laughing...me feel happy."

        ' *** ROOM # *********************************************************************************
    CASE 169

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "In dead end...room with...no way out."

        ' *** ROOM # *********************************************************************************
    CASE 170

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Me remember...this to office of boss."

        ' *** ROOM # *********************************************************************************
    CASE 171

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Music play...classical...hall alive."

        ' *** ROOM # *********************************************************************************
    CASE 172

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Must be...brains here."

        ' *** ROOM # *********************************************************************************
    CASE 173

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Hear shredder...it cry?"

        ' *** ROOM # *********************************************************************************
    CASE 174

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Hall empty...no one...though smell brain..."

        ' *** ROOM # *********************************************************************************
    CASE 175

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Smell call me...like guy in wild."

        ' *** ROOM # *********************************************************************************
    CASE 176

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Sound...guy cry...maybe he need friend."

        ' *** ROOM # *********************************************************************************
    CASE 177

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        PRINT "Door open...he leave? No...me smell him..."

        ' *** ROOM # *********************************************************************************
    CASE 178

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT
        IF NPC_General > 0 THEN
            PRINT "Marc, your dead...they killed you...your dead."
        ELSE
            PRINT "Me no care...me juwalk to friend...he cry and beg. But no"
            PRINT "care...he taste good. Brain...taste good...he br drink..."
        END IF

    CASE 179

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 180

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 181

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 182

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 183

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 184

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 185

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 186

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 187

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 188

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 189

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 190

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 191

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 192

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 193

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 194

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 195

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 196

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 197

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 198

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 199

        SELECT CASE Zombie_Mental_Awareness

            '              123456789012345678901234567890123456789012345678901234567890123456789012345678
            CASE Mind_BrainDead
                PRINT ""

            CASE Mind_Weak
                PRINT ""

            CASE Mind_Understanding
                PRINT ""

            CASE Mind_Sharp
                PRINT ""

        END SELECT

    CASE 200

        PlayerWins

END SELECT

'  *** ### THE GAME IS NOW WON WHEN YOU GET TO THE BASE AND GET THE CURE ### ***
'  *** CHECK TO SEE IF EVERY NPC IS DEAD. IF THEY ARE, THEN GO TO WINNING SCREEN
'IF NPC_Joan + NPC_Billy + NPC_Pa + NPC_Ma + NPC_OldMan + NPC_Woman + NPC_Teen + NPC_Soldier + NPC_Pilot <= 0 THEN PlayerWins

'RETURN
END SUB


' **************************************************************************************
'
' **************************************************************************************
SUB GetInputAndParse

DIM Palette_Temp3 AS STRING * 96

PRINT "> ";

cmd$ = GrabInput
cmd$ = LTRIM$(RTRIM$(UCASE$(cmd$)))

IF cmd$ = "END" OR cmd$ = "QUIT" OR cmd$ = "EXIT" OR cmd$ = "Q" THEN
    END
END IF

IF cmd$ = "HELP" OR cmd$ = "H" OR cmd$ = "?" THEN ShowHelp

IF cmd$ = "INVENTORY" OR cmd$ = "INV" OR cmd$ = "ITEMS" OR cmd$ = "I" THEN ShowInventory

LOCATE ZombieMessageY, ZombieMessageX
COLOR 14

IF cmd$ = "GO NORTH" OR cmd$ = "NORTH" OR cmd$ = "N" THEN
    IF CurrentRoom = 2 THEN CurrentRoom = 1: GOTO moved ' NORTH *
    IF CurrentRoom = 6 THEN CurrentRoom = 5: GOTO moved ' NORTH *
    IF CurrentRoom = 5 THEN CurrentRoom = 4: GOTO moved ' NORTH *
    IF CurrentRoom = 4 THEN CurrentRoom = 3: GOTO moved ' NORTH *
    IF CurrentRoom = 11 THEN CurrentRoom = 10: GOTO moved ' NORTH *
    IF CurrentRoom = 10 THEN CurrentRoom = 9: GOTO moved ' NORTH *
    IF CurrentRoom = 13 THEN CurrentRoom = 14: GOTO moved ' NORTH *
    IF CurrentRoom = 18 THEN CurrentRoom = 19: GOTO moved ' NORTH *
    IF CurrentRoom = 19 THEN CurrentRoom = 20: GOTO moved ' NORTH *
    IF CurrentRoom = 21 THEN CurrentRoom = 22: GOTO moved ' NORTH *
    IF CurrentRoom = 23 THEN CurrentRoom = 24: GOTO moved ' NORTH *
    IF CurrentRoom = 24 THEN CurrentRoom = 25: GOTO moved ' NORTH *
    IF CurrentRoom = 27 THEN CurrentRoom = 28: GOTO moved ' NORTH *
    IF CurrentRoom = 28 THEN CurrentRoom = 30: GOTO moved ' NORTH *
    IF CurrentRoom = 32 THEN CurrentRoom = 33: GOTO moved ' NORTH *
    IF CurrentRoom = 31 THEN CurrentRoom = 34: GOTO moved ' NORTH *
    IF CurrentRoom = 42 THEN CurrentRoom = 41: GOTO moved ' NORTH *
    IF CurrentRoom = 37 THEN CurrentRoom = 38: GOTO moved ' NORTH *
    IF CurrentRoom = 38 THEN CurrentRoom = 43: GOTO moved ' NORTH *
    IF CurrentRoom = 44 THEN CurrentRoom = 45: GOTO moved ' NORTH *
    IF CurrentRoom = 46 THEN CurrentRoom = 47: GOTO moved ' NORTH *
    IF CurrentRoom = 49 THEN CurrentRoom = 51: GOTO moved ' NORTH *
    IF CurrentRoom = 53 THEN CurrentRoom = 54: GOTO moved ' NORTH *
    IF CurrentRoom = 54 THEN CurrentRoom = 55: GOTO moved ' NORTH *
    IF CurrentRoom = 55 THEN CurrentRoom = 60: GOTO moved ' NORTH *
    IF CurrentRoom = 57 THEN CurrentRoom = 58: GOTO moved ' NORTH *
    IF CurrentRoom = 58 THEN CurrentRoom = 66: GOTO moved ' NORTH *
    IF CurrentRoom = 59 THEN CurrentRoom = 65: GOTO moved ' NORTH *
    IF CurrentRoom = 61 THEN CurrentRoom = 63: GOTO moved ' NORTH *
    IF CurrentRoom = 71 THEN CurrentRoom = 70: GOTO moved ' NORTH *
    IF CurrentRoom = 78 THEN CurrentRoom = 77: GOTO moved ' NORTH *
    IF CurrentRoom = 77 THEN CurrentRoom = 72: GOTO moved ' NORTH *
    IF CurrentRoom = 79 THEN CurrentRoom = 76: GOTO moved ' NORTH *
    IF CurrentRoom = 75 THEN CurrentRoom = 74: GOTO moved ' NORTH *
    IF CurrentRoom = 76 THEN CurrentRoom = 73: GOTO moved ' NORTH *
    IF CurrentRoom = 81 THEN CurrentRoom = 80: GOTO moved ' NORTH *
    IF CurrentRoom = 80 THEN CurrentRoom = 75: GOTO moved ' NORTH *
    IF CurrentRoom = 87 THEN CurrentRoom = 86: GOTO moved ' NORTH *
    IF CurrentRoom = 86 THEN CurrentRoom = 85: GOTO moved ' NORTH *
    IF CurrentRoom = 85 THEN CurrentRoom = 84: GOTO moved ' NORTH *
    IF CurrentRoom = 84 THEN CurrentRoom = 83: GOTO moved ' NORTH *
    IF CurrentRoom = 88 THEN CurrentRoom = 89: GOTO moved ' NORTH *
    IF CurrentRoom = 89 THEN CurrentRoom = 90: GOTO moved ' NORTH *
    IF CurrentRoom = 92 THEN CurrentRoom = 93: GOTO moved ' NORTH *
    IF CurrentRoom = 93 THEN CurrentRoom = 94: GOTO moved ' NORTH *
    IF CurrentRoom = 100 THEN CurrentRoom = 99: GOTO moved ' NORTH *
    IF CurrentRoom = 99 THEN CurrentRoom = 98: GOTO moved ' NORTH *
    IF CurrentRoom = 98 THEN CurrentRoom = 97: GOTO moved ' NORTH *
    IF CurrentRoom = 97 THEN CurrentRoom = 96: GOTO moved ' NORTH *
    IF CurrentRoom = 106 THEN CurrentRoom = 102: GOTO moved ' NORTH *
    IF CurrentRoom = 103 THEN CurrentRoom = 104: GOTO moved ' NORTH *
    IF CurrentRoom = 109 THEN CurrentRoom = 110: GOTO moved ' NORTH *
    IF CurrentRoom = 112 THEN CurrentRoom = 111: GOTO moved ' NORTH *
    IF CurrentRoom = 111 THEN CurrentRoom = 108: GOTO moved ' NORTH *
    IF CurrentRoom = 116 THEN CurrentRoom = 114: GOTO moved ' NORTH *
    IF CurrentRoom = 114 THEN CurrentRoom = 115: GOTO moved ' NORTH *
    IF CurrentRoom = 117 THEN CurrentRoom = 118: GOTO moved ' NORTH *
    IF CurrentRoom = 120 THEN CurrentRoom = 121: GOTO moved ' NORTH *
    IF CurrentRoom = 121 THEN CurrentRoom = 122: GOTO moved ' NORTH *
    IF CurrentRoom = 124 THEN CurrentRoom = 123: GOTO moved ' NORTH *
    IF CurrentRoom = 126 THEN CurrentRoom = 125: GOTO moved ' NORTH *
    IF CurrentRoom = 130 THEN CurrentRoom = 128: GOTO moved ' NORTH *
    IF CurrentRoom = 128 THEN CurrentRoom = 127: GOTO moved ' NORTH *
    IF CurrentRoom = 134 THEN CurrentRoom = 132: GOTO moved ' NORTH
    IF CurrentRoom = 132 THEN CurrentRoom = 133: GOTO moved ' NORTH
    IF CurrentRoom = 148 THEN CurrentRoom = 139: GOTO moved ' NORTH
    IF CurrentRoom = 139 THEN CurrentRoom = 138: GOTO moved ' NORTH
    IF CurrentRoom = 138 THEN CurrentRoom = 137: GOTO moved ' NORTH
    IF CurrentRoom = 137 THEN CurrentRoom = 136: GOTO moved ' NORTH
    IF CurrentRoom = 143 THEN CurrentRoom = 142: GOTO moved ' NORTH
    IF CurrentRoom = 142 THEN CurrentRoom = 141: GOTO moved ' NORTH
    IF CurrentRoom = 146 THEN CurrentRoom = 145: GOTO moved ' NORTH
    IF CurrentRoom = 145 THEN CurrentRoom = 144: GOTO moved ' NORTH
    IF CurrentRoom = 149 THEN CurrentRoom = 147: GOTO moved ' NORTH
    IF CurrentRoom = 151 THEN CurrentRoom = 152: GOTO moved ' NORTH
    IF CurrentRoom = 152 THEN CurrentRoom = 153: GOTO moved ' NORTH
    IF CurrentRoom = 155 THEN CurrentRoom = 154: GOTO moved ' NORTH
    IF CurrentRoom = 158 THEN CurrentRoom = 157: GOTO moved ' NORTH
    IF CurrentRoom = 157 THEN CurrentRoom = 156: GOTO moved ' NORTH
    IF CurrentRoom = 161 THEN CurrentRoom = 160: GOTO moved ' NORTH
    IF CurrentRoom = 160 THEN CurrentRoom = 159: GOTO moved ' NORTH
    IF CurrentRoom = 164 THEN CurrentRoom = 165: GOTO moved ' NORTH
    IF CurrentRoom = 170 THEN CurrentRoom = 168: GOTO moved ' NORTH
    IF CurrentRoom = 168 THEN CurrentRoom = 163: GOTO moved ' NORTH
    IF CurrentRoom = 172 THEN CurrentRoom = 171: GOTO moved ' NORTH
    IF CurrentRoom = 174 THEN CurrentRoom = 175: GOTO moved ' NORTH
    IF CurrentRoom = 175 THEN CurrentRoom = 176: GOTO moved ' NORTH
    IF CurrentRoom = 176 THEN CurrentRoom = 177: GOTO moved ' NORTH

    IF CurrentRoom = 180 THEN CurrentRoom = 179: GOTO moved ' NORTH
    IF CurrentRoom = 181 THEN CurrentRoom = 180: GOTO moved ' NORTH
    IF CurrentRoom = 182 THEN CurrentRoom = 181: GOTO moved ' NORTH
    IF CurrentRoom = 183 THEN CurrentRoom = 184: GOTO moved ' NORTH
    IF CurrentRoom = 184 THEN CurrentRoom = 185: GOTO moved ' NORTH
    IF CurrentRoom = 185 THEN CurrentRoom = 186: GOTO moved ' NORTH
    IF CurrentRoom = 188 THEN CurrentRoom = 187: GOTO moved ' NORTH
    IF CurrentRoom = 189 THEN CurrentRoom = 188: GOTO moved ' NORTH
    IF CurrentRoom = 190 THEN CurrentRoom = 189: GOTO moved ' NORTH
    IF CurrentRoom = 192 THEN CurrentRoom = 191: GOTO moved ' NORTH
    IF CurrentRoom = 193 THEN CurrentRoom = 192: GOTO moved ' NORTH
    IF CurrentRoom = 194 THEN CurrentRoom = 193: GOTO moved ' NORTH
    IF CurrentRoom = 195 THEN CurrentRoom = 194: GOTO moved ' NORTH
    IF CurrentRoom = 196 THEN CurrentRoom = 195: GOTO moved ' NORTH
    IF CurrentRoom = 197 THEN CurrentRoom = 196: GOTO moved ' NORTH
    IF CurrentRoom = 198 THEN CurrentRoom = 197: GOTO moved ' NORTH
    IF CurrentRoom = 199 THEN CurrentRoom = 198: GOTO moved ' NORTH
    IF CurrentRoom = 200 THEN CurrentRoom = 199: GOTO moved ' NORTH

END IF

IF cmd$ = "GO EAST" OR cmd$ = "EAST" OR cmd$ = "E" THEN

    IF CurrentRoom = 2 THEN CurrentRoom = 3: GOTO moved ' EAST *
    IF CurrentRoom = 7 THEN CurrentRoom = 6: GOTO moved ' EAST *
    IF CurrentRoom = 4 THEN CurrentRoom = 8: GOTO moved ' EAST *
    IF CurrentRoom = 8 THEN CurrentRoom = 9: GOTO moved ' EAST *
    IF CurrentRoom = 11 THEN CurrentRoom = 12: GOTO moved ' EAST *
    IF CurrentRoom = 12 THEN CurrentRoom = 13: GOTO moved ' EAST *
    IF CurrentRoom = 14 THEN CurrentRoom = 15: GOTO moved ' EAST *
    IF CurrentRoom = 15 THEN ' EAST *

        SELECT CASE Zombie_Mental_Awareness

            CASE Mind_BrainDead

                IF Radio_Playing = FALSE THEN

                    ' *** POPUP MESSAGE TO NOT LET THEM PASS UNTIL THEY GET MORE HEALTH
                    ' DrawBox (X1, Y1, X2, Y2, BorderColor1%, FillColor1%, BackgroundChar%%)

                    colr~& = _DEFAULTCOLOR

                    DrawFillBox 1, 1, 80, 30, 0, 178
                    DrawBox 4, 9, 77, 18, 12, 13, 219

                    _PRINTMODE _KEEPBACKGROUND
                    COLOR 12

                    '                             12345678901234567890123456789012345678901234567890123456789012345678
                    OutlineString 11, 28, 13, 1, "GAME MASTER'S HELPING HAND"
                    OutlineString 13, 8, 13, 1, "IT APPEARS... NO... THE REASON YOUR STUCK INSIDE THIS HOUSE IS DUE"
                    OutlineString 14, 8, 13, 1, "TO YOUR HEALTH BEING SO LOW THAT YOU CAN NOT COMPREHEND THE SIMPLE"
                    OutlineString 15, 8, 13, 1, "ACT OF OPENING AN UNLOCKED DOOR. EITHER GET MORE HEALTH BY EATING"
                    OutlineString 16, 8, 13, 1, "THE BRAINS OF THOSE WHO RESIDE IN THE HOUSE, OR START OVER."

                    PlayerWait 15, 11

                    COLOR colr~&

                END IF

            CASE IS > Mind_BrainDead

                IF Radio_Playing = FALSE AND Radio_Message_Heard = FALSE THEN

                    ' DrawBox (X1, Y1, X2, Y2, BorderColor1%, FillColor1%, BackgroundChar%%)

                    colr~& = _DEFAULTCOLOR

                    DrawFillBox 1, 1, 80, 30, 0, 178
                    DrawBox 4, 9, 77, 22, 15, 14, 219

                    FadePaletteColorToColor Palette_MainScreen, 14, _RGB32(128, 0, 0), 255

                    _PRINTMODE _KEEPBACKGROUND

                    COLOR 12
                    '                            12345678901234567890123456789012345678901234567890123456789012345678
                    OutlineString 11, 21, 13, 1, "IMPORTANT RADIO ANNOUNCEMENT ALERT!!!"
                    OutlineString 13, 6, 13, 1, "(WHEN THE BACKDOOR SWUNG OPEN, IT SOMEHOW HIT A RADIO SITTING ON THE"
                    OutlineString 14, 9, 13, 1, "TABLE BEHIND IT, TURNING IT ON. THERE IS A MESSAGE THAT KEEPS"
                    OutlineString 15, 13, 13, 1, "REPEATING ITSELF OVER AND OVER. HERE IS WHAT IS SAYS:)"
                    OutlineString 17, 7, 13, 1, "'Attention survivors of the Apocalypse! Super Snipers are on their"
                    OutlineString 18, 7, 13, 1, "way to your town to help wipe out all zombies. They will arrive in"
                    OutlineString 19, 7, 13, 1, "approximately one-hour and thirty minutes. Stay alive just a little"
                    OutlineString 20, 7, 13, 1, "longer and help will be there to assist you. Good Luck!'"

                    PlayerWait 15, 11
                    COLOR colr~&

                    Radio_Playing = TRUE
                    Radio_Message_Heard = TRUE
                    Game_Timer_Started = TRUE
                    DOOM = TIMER(0.001) + GameTime

                END IF

        END SELECT

        IF Radio_Playing = TRUE AND Radio_Message_Heard = TRUE THEN
            CurrentRoom = 16: GOTO moved
        END IF

    END IF

    IF CurrentRoom = 16 THEN CurrentRoom = 17: GOTO moved ' EAST *
    IF CurrentRoom = 17 THEN CurrentRoom = 18: GOTO moved ' EAST *
    IF CurrentRoom = 20 THEN CurrentRoom = 21: GOTO moved ' EAST *
    IF CurrentRoom = 22 THEN CurrentRoom = 23: GOTO moved ' EAST *
    IF CurrentRoom = 25 THEN CurrentRoom = 26: GOTO moved ' EAST *
    IF CurrentRoom = 26 THEN CurrentRoom = 27: GOTO moved ' EAST *
    IF CurrentRoom = 29 THEN CurrentRoom = 28: GOTO moved ' EAST *
    IF CurrentRoom = 37 THEN CurrentRoom = 36: GOTO moved ' EAST *
    IF CurrentRoom = 36 THEN CurrentRoom = 30: GOTO moved ' EAST *
    IF CurrentRoom = 30 THEN CurrentRoom = 31: GOTO moved ' EAST *
    IF CurrentRoom = 31 THEN CurrentRoom = 32: GOTO moved ' EAST *
    IF CurrentRoom = 41 THEN CurrentRoom = 40: GOTO moved ' EAST *
    IF CurrentRoom = 40 THEN CurrentRoom = 38: GOTO moved ' EAST *
    IF CurrentRoom = 38 THEN CurrentRoom = 39: GOTO moved ' EAST *
    IF CurrentRoom = 35 THEN CurrentRoom = 34: GOTO moved ' EAST *
    IF CurrentRoom = 43 THEN CurrentRoom = 44: GOTO moved ' EAST *
    IF CurrentRoom = 50 THEN CurrentRoom = 49: GOTO moved ' EAST *
    IF CurrentRoom = 49 THEN CurrentRoom = 45: GOTO moved ' EAST *
    IF CurrentRoom = 45 THEN CurrentRoom = 46: GOTO moved ' EAST *
    IF CurrentRoom = 53 THEN CurrentRoom = 52: GOTO moved ' EAST *
    IF CurrentRoom = 52 THEN CurrentRoom = 51: GOTO moved ' EAST *
    IF CurrentRoom = 47 THEN CurrentRoom = 48: GOTO moved ' EAST *
    IF CurrentRoom = 62 THEN CurrentRoom = 55: GOTO moved ' EAST *
    IF CurrentRoom = 55 THEN CurrentRoom = 56: GOTO moved ' EAST *
    IF CurrentRoom = 56 THEN CurrentRoom = 57: GOTO moved ' EAST *
    IF CurrentRoom = 59 THEN CurrentRoom = 58: GOTO moved ' EAST *
    IF CurrentRoom = 63 THEN CurrentRoom = 64: GOTO moved ' EAST *
    IF CurrentRoom = 64 THEN CurrentRoom = 65: GOTO moved ' EAST *
    IF CurrentRoom = 65 THEN CurrentRoom = 66: GOTO moved ' EAST *
    IF CurrentRoom = 66 THEN CurrentRoom = 67: GOTO moved ' EAST *
    IF CurrentRoom = 67 THEN CurrentRoom = 68: GOTO moved ' EAST *
    IF CurrentRoom = 68 THEN CurrentRoom = 69: GOTO moved ' EAST *
    IF CurrentRoom = 69 THEN CurrentRoom = 70: GOTO moved ' EAST *
    IF CurrentRoom = 71 THEN CurrentRoom = 72: GOTO moved ' EAST *
    IF CurrentRoom = 72 THEN CurrentRoom = 73: GOTO moved ' EAST *
    IF CurrentRoom = 73 THEN CurrentRoom = 74: GOTO moved ' EAST *
    IF CurrentRoom = 77 THEN CurrentRoom = 76: GOTO moved ' EAST *
    IF CurrentRoom = 76 THEN CurrentRoom = 75: GOTO moved ' EAST *
    IF CurrentRoom = 78 THEN CurrentRoom = 79: GOTO moved ' EAST *
    IF CurrentRoom = 79 THEN CurrentRoom = 80: GOTO moved ' EAST *
    IF CurrentRoom = 81 THEN CurrentRoom = 82: GOTO moved ' EAST *
    IF CurrentRoom = 82 THEN CurrentRoom = 83: GOTO moved ' EAST *
    IF CurrentRoom = 90 THEN CurrentRoom = 85: GOTO moved ' EAST *
    IF CurrentRoom = 92 THEN CurrentRoom = 91: GOTO moved ' EAST *
    IF CurrentRoom = 91 THEN CurrentRoom = 88: GOTO moved ' EAST *
    IF CurrentRoom = 88 THEN CurrentRoom = 87: GOTO moved ' EAST *
    IF CurrentRoom = 96 THEN CurrentRoom = 95: GOTO moved ' EAST *
    IF CurrentRoom = 95 THEN CurrentRoom = 94: GOTO moved ' EAST *
    IF CurrentRoom = 100 THEN CurrentRoom = 101: GOTO moved ' EAST *
    IF CurrentRoom = 101 THEN CurrentRoom = 102: GOTO moved ' EAST *
    IF CurrentRoom = 102 THEN CurrentRoom = 103: GOTO moved ' EAST *
    IF CurrentRoom = 104 THEN CurrentRoom = 105: GOTO moved ' EAST *
    IF CurrentRoom = 106 THEN CurrentRoom = 107: GOTO moved ' EAST *
    IF CurrentRoom = 107 THEN CurrentRoom = 108: GOTO moved ' EAST *
    IF CurrentRoom = 108 THEN CurrentRoom = 109: GOTO moved ' EAST *
    IF CurrentRoom = 120 THEN CurrentRoom = 119: GOTO moved ' EAST *
    IF CurrentRoom = 119 THEN CurrentRoom = 118: GOTO moved ' EAST *
    IF CurrentRoom = 117 THEN CurrentRoom = 116: GOTO moved ' EAST *
    IF CurrentRoom = 114 THEN CurrentRoom = 113: GOTO moved ' EAST *
    IF CurrentRoom = 113 THEN CurrentRoom = 112: GOTO moved ' EAST *
    IF CurrentRoom = 125 THEN CurrentRoom = 124: GOTO moved ' EAST *
    IF CurrentRoom = 126 THEN CurrentRoom = 127: GOTO moved ' EAST *
    IF CurrentRoom = 128 THEN CurrentRoom = 131: GOTO moved ' EAST *
    IF CurrentRoom = 129 THEN CurrentRoom = 128: GOTO moved ' EAST *
    IF CurrentRoom = 131 THEN CurrentRoom = 132: GOTO moved ' EAST *
    IF CurrentRoom = 132 THEN CurrentRoom = 135: GOTO moved ' EAST
    IF CurrentRoom = 135 THEN CurrentRoom = 136: GOTO moved ' EAST
    IF CurrentRoom = 144 THEN CurrentRoom = 139: GOTO moved ' EAST
    IF CurrentRoom = 139 THEN CurrentRoom = 140: GOTO moved ' EAST
    IF CurrentRoom = 140 THEN CurrentRoom = 141: GOTO moved ' EAST
    IF CurrentRoom = 146 THEN CurrentRoom = 147: GOTO moved ' EAST
    IF CurrentRoom = 151 THEN CurrentRoom = 150: GOTO moved ' EAST
    IF CurrentRoom = 150 THEN CurrentRoom = 149: GOTO moved ' EAST
    IF CurrentRoom = 154 THEN CurrentRoom = 153: GOTO moved ' EAST
    IF CurrentRoom = 156 THEN CurrentRoom = 155: GOTO moved ' EAST
    IF CurrentRoom = 158 THEN CurrentRoom = 159: GOTO moved ' EAST
    IF CurrentRoom = 161 THEN CurrentRoom = 162: GOTO moved ' EAST
    IF CurrentRoom = 162 THEN CurrentRoom = 163: GOTO moved ' EAST
    IF CurrentRoom = 163 THEN CurrentRoom = 164: GOTO moved ' EAST
    IF CurrentRoom = 165 THEN CurrentRoom = 166: GOTO moved ' EAST
    IF CurrentRoom = 166 THEN CurrentRoom = 167: GOTO moved ' EAST
    IF CurrentRoom = 168 THEN CurrentRoom = 169: GOTO moved ' EAST
    IF CurrentRoom = 171 THEN CurrentRoom = 170: GOTO moved ' EAST
    IF CurrentRoom = 174 THEN CurrentRoom = 173: GOTO moved ' EAST
    IF CurrentRoom = 173 THEN CurrentRoom = 172: GOTO moved ' EAST
    'IF CurrentRoom = 178 THEN CurrentRoom = 177: GOTO moved ' EAST

    IF CurrentRoom = 179 THEN
        'CurrentRoom = 178:

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 6, 77, 20, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        IF Has_BackPack = FALSE THEN
            '                           12345678901234567890123456789012345678901234567890123456789012345678
            OutlineString 8, 29, 0, 1, "'VAULT DOOR IS SEALED'"
            OutlineString 10, 6, 0, 1, "The General closed and locked the vault door so I can't get out this"
            OutlineString 11, 6, 0, 1, "way. I must grab what vaccine I can and get out the hidden escape"
            OutlineString 12, 6, 0, 1, "hatch."
            OutlineString 13, 6, 0, 1, ""
            OutlineString 14, 6, 0, 1, ""
            OutlineString 15, 6, 0, 1, ""
            OutlineString 16, 6, 0, 1, ""
            OutlineString 17, 6, 0, 1, ""
            OutlineString 18, 6, 0, 1, ""
            'OutlineString 10, 6, 0, 1, "The General closed, locked, and used weld-bombs to permanently seal"
            'OutlineString 11, 6, 0, 1, "the doors so no one could enter the vault that way again. This was"
            'OutlineString 12, 6, 0, 1, "to give you enough time to gather all the data you can from the"
            'OutlineString 13, 6, 0, 1, "vault, and collect the anti-zombie vaccine before the super-soldiers"
            'OutlineString 14, 6, 0, 1, "cut through the steel door. It won't be much longer before the break"
            'OutlineString 15, 6, 0, 1, "in, so you need to get everything you can and get out. They do not"
            'OutlineString 16, 6, 0, 1, "know about you or that you are even in the vault, so use that to"
            'OutlineString 17, 6, 0, 1, "your advantage, get what you can, and get to the hidden escape hatch"
            'OutlineString 18, 6, 0, 1, "before they break through and find you."

        ELSE

            '                           12345678901234567890123456789012345678901234567890123456789012345678
            OutlineString 8, 29, 0, 1, "'VAULT DOOR IS SEALED'"
            OutlineString 10, 6, 0, 1, "The General closed, locked, and used weld-bombs to permanently seal"
            OutlineString 11, 6, 0, 1, "the doors so no one could enter the vault that way again. This was"
            OutlineString 12, 6, 0, 1, "to give you enough time to gather all the data you can from the"
            OutlineString 13, 6, 0, 1, "vault, and collect the anti-zombie vaccine before the super-soldiers"
            OutlineString 14, 6, 0, 1, "cut through the steel door. It won't be much longer before the break"
            OutlineString 15, 6, 0, 1, "in, so you need to get everything you can and get out. They do not"
            OutlineString 16, 6, 0, 1, "know about you or that you are even in the vault, so use that to"
            OutlineString 17, 6, 0, 1, "your advantage, get what you can, and get to the hidden escape hatch"
            OutlineString 18, 6, 0, 1, "before they break through and find you."

        END IF

        PlayerWait 15, 11
        COLOR colr~&

        GOTO moved ' EAST

    END IF

    IF CurrentRoom = 183 THEN CurrentRoom = 182: GOTO moved ' EAST
    IF CurrentRoom = 187 THEN CurrentRoom = 186: GOTO moved ' EAST
    IF CurrentRoom = 181 THEN CurrentRoom = 190: GOTO moved ' EAST

END IF


IF cmd$ = "GO SOUTH" OR cmd$ = "SOUTH" OR cmd$ = "S" THEN
    IF CurrentRoom = 1 THEN CurrentRoom = 2: GOTO moved ' SOUTH *
    IF CurrentRoom = 3 THEN CurrentRoom = 4: GOTO moved ' SOUTH *
    IF CurrentRoom = 4 THEN CurrentRoom = 5: GOTO moved ' SOUTH *
    IF CurrentRoom = 5 THEN CurrentRoom = 6: GOTO moved ' SOUTH *
    IF CurrentRoom = 9 THEN CurrentRoom = 10: GOTO moved ' SOUTH *
    IF CurrentRoom = 10 THEN CurrentRoom = 11: GOTO moved ' SOUTH *
    IF CurrentRoom = 14 THEN CurrentRoom = 13: GOTO moved ' SOUTH *
    IF CurrentRoom = 20 THEN CurrentRoom = 19: GOTO moved ' SOUTH *
    IF CurrentRoom = 19 THEN CurrentRoom = 18: GOTO moved ' SOUTH *
    IF CurrentRoom = 22 THEN CurrentRoom = 21: GOTO moved ' SOUTH *
    IF CurrentRoom = 25 THEN CurrentRoom = 24: GOTO moved ' SOUTH *
    IF CurrentRoom = 24 THEN CurrentRoom = 23: GOTO moved ' SOUTH *
    IF CurrentRoom = 30 THEN CurrentRoom = 28: GOTO moved ' SOUTH *
    IF CurrentRoom = 28 THEN CurrentRoom = 27: GOTO moved ' SOUTH *
    IF CurrentRoom = 33 THEN CurrentRoom = 32: GOTO moved ' SOUTH *
    IF CurrentRoom = 34 THEN CurrentRoom = 31: GOTO moved ' SOUTH *
    IF CurrentRoom = 41 THEN CurrentRoom = 42: GOTO moved ' SOUTH *
    IF CurrentRoom = 43 THEN CurrentRoom = 38: GOTO moved ' SOUTH *
    IF CurrentRoom = 38 THEN CurrentRoom = 37: GOTO moved ' SOUTH *
    IF CurrentRoom = 45 THEN CurrentRoom = 44: GOTO moved ' SOUTH *
    IF CurrentRoom = 47 THEN CurrentRoom = 46: GOTO moved ' SOUTH *
    IF CurrentRoom = 51 THEN CurrentRoom = 49: GOTO moved ' SOUTH *
    IF CurrentRoom = 60 THEN CurrentRoom = 55: GOTO moved ' SOUTH *
    IF CurrentRoom = 55 THEN CurrentRoom = 54: GOTO moved ' SOUTH *
    IF CurrentRoom = 54 THEN CurrentRoom = 53: GOTO moved ' SOUTH *
    IF CurrentRoom = 63 THEN CurrentRoom = 61: GOTO moved ' SOUTH *
    IF CurrentRoom = 65 THEN CurrentRoom = 59: GOTO moved ' SOUTH *
    IF CurrentRoom = 66 THEN CurrentRoom = 58: GOTO moved ' SOUTH *
    IF CurrentRoom = 58 THEN CurrentRoom = 57: GOTO moved ' SOUTH *
    IF CurrentRoom = 70 THEN CurrentRoom = 71: GOTO moved ' SOUTH *
    IF CurrentRoom = 72 THEN CurrentRoom = 77: GOTO moved ' SOUTH *
    IF CurrentRoom = 77 THEN CurrentRoom = 78: GOTO moved ' SOUTH *
    IF CurrentRoom = 73 THEN CurrentRoom = 76: GOTO moved ' SOUTH *
    IF CurrentRoom = 76 THEN CurrentRoom = 79: GOTO moved ' SOUTH *
    IF CurrentRoom = 74 THEN CurrentRoom = 75: GOTO moved ' SOUTH *
    IF CurrentRoom = 75 THEN CurrentRoom = 80: GOTO moved ' SOUTH *
    IF CurrentRoom = 80 THEN CurrentRoom = 81: GOTO moved ' SOUTH *
    IF CurrentRoom = 83 THEN CurrentRoom = 84: GOTO moved ' SOUTH *
    IF CurrentRoom = 84 THEN CurrentRoom = 85: GOTO moved ' SOUTH *
    IF CurrentRoom = 85 THEN CurrentRoom = 86: GOTO moved ' SOUTH *
    IF CurrentRoom = 86 THEN CurrentRoom = 87: GOTO moved ' SOUTH *
    IF CurrentRoom = 90 THEN CurrentRoom = 89: GOTO moved ' SOUTH *
    IF CurrentRoom = 89 THEN CurrentRoom = 88: GOTO moved ' SOUTH *
    IF CurrentRoom = 94 THEN CurrentRoom = 93: GOTO moved ' SOUTH *
    IF CurrentRoom = 93 THEN CurrentRoom = 92: GOTO moved ' SOUTH *
    IF CurrentRoom = 96 THEN CurrentRoom = 97: GOTO moved ' SOUTH *
    IF CurrentRoom = 97 THEN CurrentRoom = 98: GOTO moved ' SOUTH *
    IF CurrentRoom = 98 THEN CurrentRoom = 99: GOTO moved ' SOUTH *
    IF CurrentRoom = 99 THEN CurrentRoom = 100: GOTO moved ' SOUTH *
    IF CurrentRoom = 102 THEN CurrentRoom = 106: GOTO moved ' SOUTH *
    IF CurrentRoom = 104 THEN CurrentRoom = 103: GOTO moved ' SOUTH *
    IF CurrentRoom = 110 THEN CurrentRoom = 109: GOTO moved ' SOUTH *
    IF CurrentRoom = 108 THEN CurrentRoom = 111: GOTO moved ' SOUTH *
    IF CurrentRoom = 111 THEN CurrentRoom = 112: GOTO moved ' SOUTH *
    IF CurrentRoom = 115 THEN CurrentRoom = 114: GOTO moved ' SOUTH *
    IF CurrentRoom = 114 THEN CurrentRoom = 116: GOTO moved ' SOUTH *
    IF CurrentRoom = 118 THEN CurrentRoom = 117: GOTO moved ' SOUTH *
    IF CurrentRoom = 122 THEN CurrentRoom = 121: GOTO moved ' SOUTH *
    IF CurrentRoom = 121 THEN CurrentRoom = 120: GOTO moved ' SOUTH *
    IF CurrentRoom = 123 THEN CurrentRoom = 124: GOTO moved ' SOUTH *
    IF CurrentRoom = 125 THEN CurrentRoom = 126: GOTO moved ' SOUTH *
    IF CurrentRoom = 127 THEN CurrentRoom = 128: GOTO moved ' SOUTH *
    IF CurrentRoom = 128 THEN CurrentRoom = 130: GOTO moved ' SOUTH *
    IF CurrentRoom = 133 THEN CurrentRoom = 132: GOTO moved ' SOUTH
    IF CurrentRoom = 132 THEN CurrentRoom = 134: GOTO moved ' SOUTH
    IF CurrentRoom = 136 THEN CurrentRoom = 137: GOTO moved ' SOUTH
    IF CurrentRoom = 137 THEN CurrentRoom = 138: GOTO moved ' SOUTH
    IF CurrentRoom = 138 THEN CurrentRoom = 139: GOTO moved ' SOUTH
    IF CurrentRoom = 139 THEN CurrentRoom = 148: GOTO moved ' SOUTH
    IF CurrentRoom = 141 THEN CurrentRoom = 142: GOTO moved ' SOUTH
    IF CurrentRoom = 142 THEN CurrentRoom = 143: GOTO moved ' SOUTH
    IF CurrentRoom = 144 THEN CurrentRoom = 145: GOTO moved ' SOUTH
    IF CurrentRoom = 145 THEN CurrentRoom = 146: GOTO moved ' SOUTH
    IF CurrentRoom = 147 THEN CurrentRoom = 149: GOTO moved ' SOUTH
    IF CurrentRoom = 153 THEN CurrentRoom = 152: GOTO moved ' SOUTH
    IF CurrentRoom = 152 THEN CurrentRoom = 151: GOTO moved ' SOUTH
    IF CurrentRoom = 154 THEN CurrentRoom = 155: GOTO moved ' SOUTH
    IF CurrentRoom = 156 THEN CurrentRoom = 157: GOTO moved ' SOUTH
    IF CurrentRoom = 157 THEN CurrentRoom = 158: GOTO moved ' SOUTH
    IF CurrentRoom = 159 THEN CurrentRoom = 160: GOTO moved ' SOUTH
    IF CurrentRoom = 160 THEN CurrentRoom = 161: GOTO moved ' SOUTH
    IF CurrentRoom = 165 THEN CurrentRoom = 164: GOTO moved ' SOUTH
    IF CurrentRoom = 163 THEN CurrentRoom = 168: GOTO moved ' SOUTH
    IF CurrentRoom = 168 THEN CurrentRoom = 170: GOTO moved ' SOUTH
    IF CurrentRoom = 171 THEN CurrentRoom = 172: GOTO moved ' SOUTH
    IF CurrentRoom = 177 THEN CurrentRoom = 176: GOTO moved ' SOUTH
    IF CurrentRoom = 176 THEN CurrentRoom = 175: GOTO moved ' SOUTH
    IF CurrentRoom = 175 THEN CurrentRoom = 174: GOTO moved ' SOUTH

    IF CurrentRoom = 179 THEN CurrentRoom = 180: GOTO moved ' SOUTH
    IF CurrentRoom = 180 THEN CurrentRoom = 181: GOTO moved ' SOUTH
    IF CurrentRoom = 181 THEN CurrentRoom = 182: GOTO moved ' SOUTH
    IF CurrentRoom = 184 THEN CurrentRoom = 183: GOTO moved ' SOUTH
    IF CurrentRoom = 185 THEN CurrentRoom = 184: GOTO moved ' SOUTH
    IF CurrentRoom = 186 THEN CurrentRoom = 185: GOTO moved ' SOUTH
    IF CurrentRoom = 187 THEN CurrentRoom = 188: GOTO moved ' SOUTH
    IF CurrentRoom = 188 THEN CurrentRoom = 189: GOTO moved ' SOUTH
    IF CurrentRoom = 189 THEN CurrentRoom = 190: GOTO moved ' SOUTH
    IF CurrentRoom = 191 THEN CurrentRoom = 192: GOTO moved ' SOUTH
    IF CurrentRoom = 192 THEN CurrentRoom = 193: GOTO moved ' SOUTH
    IF CurrentRoom = 193 THEN CurrentRoom = 194: GOTO moved ' SOUTH
    IF CurrentRoom = 194 THEN CurrentRoom = 195: GOTO moved ' SOUTH
    IF CurrentRoom = 195 THEN CurrentRoom = 196: GOTO moved ' SOUTH
    IF CurrentRoom = 196 THEN CurrentRoom = 197: GOTO moved ' SOUTH
    IF CurrentRoom = 197 THEN CurrentRoom = 198: GOTO moved ' SOUTH
    IF CurrentRoom = 198 THEN CurrentRoom = 199: GOTO moved ' SOUTH
    IF CurrentRoom = 199 THEN CurrentRoom = 200: GOTO moved ' SOUTH

END IF

IF cmd$ = "GO WEST" OR cmd$ = "WEST" OR cmd$ = "W" THEN
    IF CurrentRoom = 3 THEN CurrentRoom = 2: GOTO moved ' WEST *
    IF CurrentRoom = 9 THEN CurrentRoom = 8: GOTO moved ' WEST *
    IF CurrentRoom = 8 THEN CurrentRoom = 4: GOTO moved ' WEST *
    IF CurrentRoom = 6 THEN CurrentRoom = 7: GOTO moved ' WEST *
    IF CurrentRoom = 13 THEN CurrentRoom = 12: GOTO moved ' WEST *
    IF CurrentRoom = 12 THEN CurrentRoom = 11: GOTO moved ' WEST *
    IF CurrentRoom = 15 THEN CurrentRoom = 14: GOTO moved ' WEST *
    IF CurrentRoom = 18 THEN CurrentRoom = 17: GOTO moved ' WEST *
    IF CurrentRoom = 17 THEN CurrentRoom = 16: GOTO moved ' WEST *
    IF CurrentRoom = 16 THEN CurrentRoom = 15: GOTO moved ' WEST *
    IF CurrentRoom = 21 THEN CurrentRoom = 20: GOTO moved ' WEST *
    IF CurrentRoom = 23 THEN CurrentRoom = 22: GOTO moved ' WEST *
    IF CurrentRoom = 27 THEN CurrentRoom = 26: GOTO moved ' WEST *
    IF CurrentRoom = 26 THEN CurrentRoom = 25: GOTO moved ' WEST *
    IF CurrentRoom = 28 THEN CurrentRoom = 29: GOTO moved ' WEST *
    IF CurrentRoom = 32 THEN CurrentRoom = 31: GOTO moved ' WEST *
    IF CurrentRoom = 31 THEN CurrentRoom = 30: GOTO moved ' WEST *
    IF CurrentRoom = 30 THEN CurrentRoom = 36: GOTO moved ' WEST *
    IF CurrentRoom = 36 THEN CurrentRoom = 37: GOTO moved ' WEST *
    IF CurrentRoom = 34 THEN CurrentRoom = 35: GOTO moved ' WEST *
    IF CurrentRoom = 39 THEN CurrentRoom = 38: GOTO moved ' WEST *
    IF CurrentRoom = 38 THEN CurrentRoom = 40: GOTO moved ' WEST *
    IF CurrentRoom = 40 THEN CurrentRoom = 41: GOTO moved ' WEST *
    IF CurrentRoom = 44 THEN CurrentRoom = 43: GOTO moved ' WEST *
    IF CurrentRoom = 46 THEN CurrentRoom = 45: GOTO moved ' WEST *
    IF CurrentRoom = 45 THEN CurrentRoom = 49: GOTO moved ' WEST *
    IF CurrentRoom = 49 THEN CurrentRoom = 50: GOTO moved ' WEST *
    IF CurrentRoom = 48 THEN CurrentRoom = 47: GOTO moved ' WEST *
    IF CurrentRoom = 51 THEN CurrentRoom = 52: GOTO moved ' WEST *
    IF CurrentRoom = 52 THEN CurrentRoom = 53: GOTO moved ' WEST *
    IF CurrentRoom = 57 THEN CurrentRoom = 56: GOTO moved ' WEST *
    IF CurrentRoom = 56 THEN CurrentRoom = 55: GOTO moved ' WEST *
    IF CurrentRoom = 55 THEN CurrentRoom = 62: GOTO moved ' WEST *
    IF CurrentRoom = 58 THEN CurrentRoom = 59: GOTO moved ' WEST *
    IF CurrentRoom = 68 THEN CurrentRoom = 67: GOTO moved ' WEST *
    IF CurrentRoom = 67 THEN CurrentRoom = 66: GOTO moved ' WEST *
    IF CurrentRoom = 66 THEN CurrentRoom = 65: GOTO moved ' WEST *
    IF CurrentRoom = 65 THEN CurrentRoom = 64: GOTO moved ' WEST *
    IF CurrentRoom = 64 THEN CurrentRoom = 63: GOTO moved ' WEST *
    IF CurrentRoom = 69 THEN CurrentRoom = 68: GOTO moved ' WEST *
    IF CurrentRoom = 70 THEN CurrentRoom = 69: GOTO moved ' WEST *
    IF CurrentRoom = 74 THEN CurrentRoom = 73: GOTO moved ' WEST *
    IF CurrentRoom = 73 THEN CurrentRoom = 72: GOTO moved ' WEST *
    IF CurrentRoom = 72 THEN CurrentRoom = 71: GOTO moved ' WEST *
    IF CurrentRoom = 75 THEN CurrentRoom = 76: GOTO moved ' WEST *
    IF CurrentRoom = 76 THEN CurrentRoom = 77: GOTO moved ' WEST *
    IF CurrentRoom = 80 THEN CurrentRoom = 79: GOTO moved ' WEST *
    IF CurrentRoom = 79 THEN CurrentRoom = 78: GOTO moved ' WEST *
    IF CurrentRoom = 83 THEN CurrentRoom = 82: GOTO moved ' WEST *
    IF CurrentRoom = 82 THEN CurrentRoom = 81: GOTO moved ' WEST *
    IF CurrentRoom = 85 THEN CurrentRoom = 90: GOTO moved ' WEST *
    IF CurrentRoom = 87 THEN CurrentRoom = 88: GOTO moved ' WEST *
    IF CurrentRoom = 88 THEN CurrentRoom = 91: GOTO moved ' WEST *
    IF CurrentRoom = 91 THEN CurrentRoom = 92: GOTO moved ' WEST *
    IF CurrentRoom = 94 THEN CurrentRoom = 95: GOTO moved ' WEST *
    IF CurrentRoom = 95 THEN CurrentRoom = 96: GOTO moved ' WEST *
    IF CurrentRoom = 103 THEN CurrentRoom = 102: GOTO moved ' WEST *
    IF CurrentRoom = 102 THEN CurrentRoom = 101: GOTO moved ' WEST *
    IF CurrentRoom = 101 THEN CurrentRoom = 100: GOTO moved ' WEST *
    IF CurrentRoom = 105 THEN CurrentRoom = 104: GOTO moved ' WEST *
    IF CurrentRoom = 109 THEN CurrentRoom = 108: GOTO moved ' WEST *
    IF CurrentRoom = 108 THEN CurrentRoom = 107: GOTO moved ' WEST *
    IF CurrentRoom = 107 THEN CurrentRoom = 106: GOTO moved ' WEST *
    IF CurrentRoom = 112 THEN CurrentRoom = 113: GOTO moved ' WEST *
    IF CurrentRoom = 113 THEN CurrentRoom = 114: GOTO moved ' WEST *
    IF CurrentRoom = 116 THEN CurrentRoom = 117: GOTO moved ' WEST *
    IF CurrentRoom = 118 THEN CurrentRoom = 119: GOTO moved ' WEST *
    IF CurrentRoom = 119 THEN CurrentRoom = 120: GOTO moved ' WEST *
    IF CurrentRoom = 122 THEN CurrentRoom = 123: GOTO moved ' WEST *
    IF CurrentRoom = 124 THEN CurrentRoom = 125: GOTO moved ' WEST *
    IF CurrentRoom = 136 THEN CurrentRoom = 135: GOTO moved ' WEST *
    IF CurrentRoom = 135 THEN CurrentRoom = 132: GOTO moved ' WEST *
    IF CurrentRoom = 132 THEN CurrentRoom = 131: GOTO moved ' WEST *
    IF CurrentRoom = 131 THEN CurrentRoom = 128: GOTO moved ' WEST *
    IF CurrentRoom = 127 THEN CurrentRoom = 126: GOTO moved ' WEST *
    IF CurrentRoom = 128 THEN CurrentRoom = 129: GOTO moved ' WEST *
    IF CurrentRoom = 141 THEN CurrentRoom = 140: GOTO moved ' WEST
    IF CurrentRoom = 140 THEN CurrentRoom = 139: GOTO moved ' WEST
    IF CurrentRoom = 139 THEN CurrentRoom = 144: GOTO moved ' WEST
    IF CurrentRoom = 147 THEN CurrentRoom = 146: GOTO moved ' WEST
    IF CurrentRoom = 149 THEN CurrentRoom = 150: GOTO moved ' WEST
    IF CurrentRoom = 150 THEN CurrentRoom = 151: GOTO moved ' WEST
    IF CurrentRoom = 153 THEN CurrentRoom = 154: GOTO moved ' WEST
    IF CurrentRoom = 155 THEN CurrentRoom = 156: GOTO moved ' WEST
    IF CurrentRoom = 159 THEN CurrentRoom = 158: GOTO moved ' WEST
    IF CurrentRoom = 164 THEN CurrentRoom = 163: GOTO moved ' WEST
    IF CurrentRoom = 163 THEN CurrentRoom = 162: GOTO moved ' WEST
    IF CurrentRoom = 162 THEN CurrentRoom = 161: GOTO moved ' WEST
    IF CurrentRoom = 167 THEN CurrentRoom = 166: GOTO moved ' WEST
    IF CurrentRoom = 166 THEN CurrentRoom = 165: GOTO moved ' WEST
    IF CurrentRoom = 169 THEN CurrentRoom = 168: GOTO moved ' WEST
    IF CurrentRoom = 170 THEN CurrentRoom = 171: GOTO moved ' WEST
    IF CurrentRoom = 172 THEN CurrentRoom = 173: GOTO moved ' WEST
    IF CurrentRoom = 173 THEN CurrentRoom = 174: GOTO moved ' WEST

    IF CurrentRoom = 177 THEN

        CurrentRoom = 178

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 2, 77, 28, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 4, 27, 0, 1, "'GAME MASTER'S SUGGESTION'"
        OutlineString 6, 6, 0, 1, "As you enter the laboratory where the zombie virus was created, you"
        OutlineString 7, 6, 0, 1, "come across General Omar Bradley sitting behind the guard station desk"
        OutlineString 8, 6, 0, 1, "feet proped up, leaned back, reading a comic book called, 'The Day of"
        OutlineString 9, 6, 0, 1, "the Zombie Outbreak', and chuckling at how the writers were so far off"
        OutlineString 10, 6, 0, 1, "course in their ideas that he would love to see their faces right now."
        OutlineString 11, 6, 0, 1, "As soon as the General Bradley sees you, he slowly lays the comic book"
        OutlineString 12, 6, 0, 1, "down, sits up, and studies you for a moment. The General did not get"
        OutlineString 13, 6, 0, 1, "his position by being a push-over, but he is a kind man, and you"
        OutlineString 14, 6, 0, 1, "remember enjoy serving under him while you were stationed here."

        OutlineString 16, 6, 0, 1, "Since General Bradley did not immediately kill you on site when you"
        OutlineString 17, 6, 0, 1, "walked into the lab, he has found you to be worthy enough to share"
        OutlineString 18, 6, 0, 1, "with you a secret. A secret that he could no longer bare to keep for"
        OutlineString 19, 6, 0, 1, "himself, so he wishes to pass it on to someone worthy enough of it. He"
        OutlineString 20, 6, 0, 1, "wishes to share the zombie vaccine and the research papers in hopes"
        OutlineString 21, 6, 0, 1, "you will save more people."

        OutlineString 23, 6, 0, 1, "You need to make a choice, you can attack and hopefully eat General"
        OutlineString 24, 6, 0, 1, "Bradley, so you can keep it all to yourself, or let him live in hopes"
        OutlineString 25, 6, 0, 1, "he can help save more souls. Your choice, but I suggest you talk with"
        OutlineString 26, 6, 0, 1, "the General before you make that decision. Good Luck!"


        'Widely known for his polite and courteous nature, Omar Bradely was a notable American
        'General of World War 2 who significantly contributed in Normandy Landing as well as in
        'the Battle of the Bulge. From childhood, he had a great passion in baseball, books and
        'shooting. In mainstream American media, Omar Bradely has been characterized as a
        'gentleman General who never demonstrated his power and authoritative abilities on
        'officers and soldiers working under his leadership. He departed our dimension on April
        '8, 1991, in New York City.

        PlayerWait 15, 11
        COLOR colr~&

        Game_Timer_Started = FALSE
        GameTime = 0

        GOTO moved ' WEST

    END IF

    IF CurrentRoom = 178 AND GameTime > 0 THEN

        CurrentRoom = 179

        Game_Timer_Started = TRUE
        DOOM = TIMER(0.001) + GameTime

        GOTO moved ' WEST

    END IF

    IF CurrentRoom = 182 THEN CurrentRoom = 183: GOTO moved ' WEST
    IF CurrentRoom = 186 THEN CurrentRoom = 187: GOTO moved ' WEST
    IF CurrentRoom = 190 THEN CurrentRoom = 191: GOTO moved ' WEST

END IF



_PRINTMODE _KEEPBACKGROUND

IF (cmd$ = "EXAMINE FAMILY PHOTO" OR cmd$ = "EXAMINE" OR cmd$ = "EXAMINE PHOTO" OR cmd$ = "EXAMINE PICTURE" OR cmd$ = "LOOK AT PHOTO" OR cmd$ = "LOOK PHOTO" OR cmd$ = "LOOK") AND CurrentRoom = 10 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 9, 77, 18, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                             123456789012345678901234567890123456789012345678901234567890123456789
    OutlineString 11, 20, 13, 1, "GAME MASTER'S EXAMINATION OF FAMILY PHOTO"
    OutlineString 13, 6, 13, 1, "The family picture you are looking at should look familier. The people"
    OutlineString 14, 8, 13, 1, "in the photo are you, your wife, and your son Billy. You do not know"
    OutlineString 15, 8, 13, 1, "what had happened to Billy and you hope he is alive and well. You have"
    OutlineString 16, 8, 13, 1, "been thinking of looking for him when this is over."

    PlayerWait 15, 11
    COLOR colr~&

END IF

IF (cmd$ = "EXAMINE KNIFE" OR cmd$ = "EXAMINE" OR cmd$ = "LOOK KNIFE" OR cmd$ = "LOOK AT KNIFE" OR cmd$ = "LOOK") AND CurrentRoom = 14 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 8, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 10, 34, 0, 1, "'EXAMINE KNIFE'"
    OutlineString 12, 6, 0, 1, "(When you pick the knife up, you immediately remember that it is the"
    OutlineString 13, 6, 0, 1, "knife you and your wife used on your wedding day to cut the cake. You"
    OutlineString 14, 6, 0, 1, "wonder why in the world it is it on the table, and get mad. But, you"
    OutlineString 15, 6, 0, 1, "have more important matters to attend to at the moment, so you put the"
    OutlineString 16, 6, 0, 1, "knife back on the table and hope it is still there when you resolve"
    OutlineString 17, 6, 0, 1, "this huge mess the scientists you worked with created.)"

    PlayerWait 15, 11
    COLOR colr~&

END IF

IF (cmd$ = "EXAMINE DOLL" OR cmd$ = "EXAMINE" OR cmd$ = "LOOK DOLL" OR cmd$ = "LOOK AT DOLL" OR cmd$ = "LOOK") AND CurrentRoom = 13 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 8, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 10, 34, 0, 1, "'EXAMINE DOLL'"
    OutlineString 12, 6, 0, 1, "(As you pick the doll up, images and videos flash before your eyes."
    OutlineString 13, 6, 0, 1, "You are taken back a bit and almost loose control. This doll belongs"
    OutlineString 14, 6, 0, 1, "to your wife, whom slept with it every night. You had made it for her"
    OutlineString 15, 6, 0, 1, "many years ago, to give her something of yourself that she could hold"
    OutlineString 16, 6, 0, 1, "on to and cuddle with, while you were away, working at the government"
    OutlineString 17, 6, 0, 1, "facilty that is located at the edge of town, sorta hidden away.)"

    PlayerWait 15, 11
    COLOR colr~&

END IF


IF (cmd$ = "TALK TO JOAN" OR cmd$ = "TALK" OR cmd$ = "TALK JOAN") AND CurrentRoom = 5 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 7, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           12345678901234567890123456789012345678901234567890123456789012345678
    OutlineString 9, 33, 0, 1, "'TALK TO JOAN'"
    OutlineString 11, 6, 0, 1, "(Joan looks at you in horror, and her face turns white as a ghost."
    OutlineString 12, 6, 0, 1, "after thinking about it, you realize that she should be afraid of"
    OutlineString 13, 6, 0, 1, "you, not because you are a zombie, but because she was the one who"
    OutlineString 14, 6, 0, 1, "killed your oldest son in a deadly car accident. Joan was drinking"
    OutlineString 15, 6, 0, 1, "and driving that night and had no business being behind the wheel of"
    OutlineString 16, 6, 0, 1, "a vehicle. Your rage flares up and you are thinking of eating Joan,"
    OutlineString 17, 6, 0, 1, "not because you are hungry, but for revenge. You should eat her.)"

    PlayerWait 15, 11
    COLOR colr~&

END IF

IF (cmd$ = "TALK TO PA" OR cmd$ = "TALK" OR cmd$ = "TALK PA") AND CurrentRoom = 3 THEN

    IF NPC_Pa > 0 THEN

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 7, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           12345678901234567890123456789012345678901234567890123456789012345678
        OutlineString 9, 34, 0, 1, "'TALK TO PA'"
        OutlineString 11, 6, 0, 1, "When Pa turns around, he yells and tries to attack you, but fails."
        OutlineString 12, 6, 0, 1, "You hit him so hard that he flies over the couch hits his head on"
        OutlineString 13, 6, 0, 1, "coffee table, knocking him out cold. If your hungry, you should take"
        OutlineString 14, 6, 0, 1, "this moment and eat him, as he looks like someone whom you believe"
        OutlineString 15, 6, 0, 1, "had escaped from prison. Someone you helped put away, and why is he"
        OutlineString 16, 6, 0, 1, "living in your house! He probably had been laughing the entire time"
        OutlineString 17, 6, 0, 1, "at you. Well, it's time to put an end to his reign! Time to eat him!"

        PlayerWait 15, 11
        COLOR colr~&

    ELSE

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 7, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           12345678901234567890123456789012345678901234567890123456789012345678
        OutlineString 9, 34, 0, 1, "'TALK TO PA'"
        OutlineString 11, 6, 0, 1, "Seariously!? You can't talk to a dead person! Well... At least those"
        OutlineString 12, 6, 0, 1, "who don't have a brain. You could however suck his soul from his"
        OutlineString 13, 6, 0, 1, "body, but your a zombie, not a wrath, though that would be a cool"
        OutlineString 14, 6, 0, 1, "idea for another zombie game. I can see it now, 'Attack of the"
        OutlineString 15, 6, 0, 1, "Zombie Wrath!'"
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

    END IF

END IF

IF (cmd$ = "TALK TO MA" OR cmd$ = "TALK" OR cmd$ = "TALK MA") AND CurrentRoom = 15 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 7, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           12345678901234567890123456789012345678901234567890123456789012345678
    OutlineString 9, 34, 0, 1, "'TALK TO MA'"
    OutlineString 11, 6, 0, 1, "(Ma screams when you try to talk to her, and she tries to run, but"
    OutlineString 12, 6, 0, 1, "apron is caught in the oven door. you reach down and untangle the"
    OutlineString 13, 6, 0, 1, "and she looks at you in bewilderment.) Billy is my son and I want"
    OutlineString 14, 6, 0, 1, "you to keep him safe. I know of a cure and I am heading to go get,"
    OutlineString 15, 6, 0, 1, "so I will be back for Billy. Take care of him for me for me. Oh,"
    OutlineString 16, 6, 0, 1, "his mother may come back to get him, so look out for her as well."
    OutlineString 17, 6, 0, 1, "(Ma nodes as she looks upon you in horror. 'Good Luck' she says.)"

    PlayerWait 15, 11
    COLOR colr~&

END IF

IF (cmd$ = "TALK TO BILLY" OR cmd$ = "TALK" OR cmd$ = "TALK BILLY") AND CurrentRoom = 12 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 7, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           12345678901234567890123456789012345678901234567890123456789012345678
    OutlineString 9, 33, 0, 1, "'TALK TO BILLY'"
    OutlineString 11, 6, 0, 1, "Billy! My son! Oh ho I missed you so much! Papa is sick right now, so"
    OutlineString 12, 6, 0, 1, "you can't be around me until I am better. Where's mama? (Billy says,"
    OutlineString 13, 6, 0, 1, "'Mama went looking for you papa. When will she back? These baby"
    OutlineString 14, 6, 0, 1, "sitters are scary and mean.') I will look for her Billy, but for now,"
    OutlineString 15, 6, 0, 1, "you must stay with them so they can keep you safe from other sick"
    OutlineString 16, 6, 0, 1, "people. I will talk to them. You go back and play now, and watch some"
    OutlineString 17, 6, 0, 1, "TV until I get back with mama."

    PlayerWait 15, 11
    COLOR colr~&


END IF

IF (cmd$ = "TAKE FAMILY PHOTO" OR cmd$ = "TAKE" OR cmd$ = "TAKE PHOTO") AND CurrentRoom = 10 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 7, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           12345678901234567890123456789012345678901234567890123456789012345678
    OutlineString 9, 29, 0, 1, "'TAKE FAMILY PORTRAIT'"
    OutlineString 11, 6, 0, 1, "(You decide not to take the family portrait as their images burn"
    OutlineString 12, 6, 0, 1, "inside your head, as they are your family, and they are the reason"
    OutlineString 13, 6, 0, 1, "for your current mission. You must find the cure to this disease"
    OutlineString 14, 6, 0, 1, "that has infected the nation, possibly the world. So, you carefully"
    OutlineString 15, 6, 0, 1, "hand the portrait back up, and wipe of the dust that has collected."
    OutlineString 16, 6, 0, 1, "You really hope you get to see your family alive again.) 'Damn the"
    OutlineString 17, 6, 0, 1, "gevernment for creating this disease! They will pay for it!'"

    PlayerWait 15, 11
    COLOR colr~&


END IF

IF (cmd$ = "TAKE KNIFE" OR cmd$ = "TAKE") AND CurrentRoom = 14 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 8, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 10, 34, 0, 1, "'TAKE KNIFE'"
    OutlineString 12, 6, 0, 1, "(Even though the knife has a extreme sentimental value to you, you"
    OutlineString 13, 6, 0, 1, "decide to leave it here so you don't loose it on your journey. Besides"
    OutlineString 14, 6, 0, 1, "that, it brings back to many good memories and you become too"
    OutlineString 15, 6, 0, 1, "emotional when you hold the knife. The emotions could intefer with you"
    OutlineString 16, 6, 0, 1, "completing your mission successfully, so you leave the knife where you"
    OutlineString 17, 6, 0, 1, "found it.)"

    PlayerWait 15, 11
    COLOR colr~&

END IF

IF (cmd$ = "TAKE DOLL" OR cmd$ = "TAKE") AND CurrentRoom = 13 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 8, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 10, 34, 0, 1, "'TAKE DOLL'"
    OutlineString 12, 6, 0, 1, "(Even though you would like to protect the doll, and be able to give"
    OutlineString 13, 6, 0, 1, "it back to you wife when you find her (alive & well), you realize that"
    OutlineString 14, 6, 0, 1, "Billy had it, and you don't want to take it away from him. It is the"
    OutlineString 15, 6, 0, 1, "only thing he has left of his mother. You hope she will return to him"
    OutlineString 16, 6, 0, 1, "one day, and you, but in case of the worse scenario, you want to have"
    OutlineString 17, 6, 0, 1, "good memories of her. 'I love you Billy')"

    PlayerWait 15, 11
    COLOR colr~&

END IF

IF (cmd$ = "TALK TO MAN" OR cmd$ = "TALK" OR cmd$ = "TALK MAN" OR cmd$ = "TALK MAN") AND CurrentRoom = 89 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 2, 77, 28, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 3, 33, 0, 1, "'TALK TO MAN'"
    OutlineString 5, 6, 0, 1, "As I stumbled through the sewer, I come across a homeless man sitting"
    OutlineString 6, 6, 0, 1, "in his home-made shelter. He looked at me like he recognized me for a"
    OutlineString 7, 6, 0, 1, "moment, and says, 'Oh! Another one I see.' 'Another one?', I asked."
    OutlineString 8, 6, 0, 1, "'Yeah, there have been several of you zombified worker folks that have"
    OutlineString 9, 6, 0, 1, "past this way this week. They all wore uniforms like you, and said"
    OutlineString 10, 6, 0, 1, "they were on some crazy mission to retrieve the cure from the base,"
    OutlineString 11, 6, 0, 1, "and save the world, as well as themselves. I haven't seen them since,"
    OutlineString 12, 6, 0, 1, "but I have heard gun fire, which leads me to believe they were killed"
    OutlineString 13, 6, 0, 1, "by the general. Please be careful young... man...' 'Thank you!' I"
    OutlineString 14, 6, 0, 1, "said. "

    OutlineString 16, 6, 0, 1, "I asked him, 'Why don't you seek shelter in the base where you will be"
    OutlineString 17, 6, 0, 1, "safe? Are you not afraid of the zombie's eating you? What about food"
    OutlineString 18, 6, 0, 1, "and water? How are you protecting yourself?' He looked at me and begin"
    OutlineString 19, 6, 0, 1, "chuckling. 'Well, I am E-314, the 314th experiment of your scientists."
    OutlineString 20, 6, 0, 1, "I am a full zombie and a full human. The perfect weapon as they called"
    OutlineString 21, 6, 0, 1, "me. Neither human or zombie will bother me, and I don't need much in"
    OutlineString 22, 6, 0, 1, "the way of food or water, though I can get it when I do, which is"
    OutlineString 23, 6, 0, 1, "usually when I regenerate parts that die, or get destroyed. My mission"
    OutlineString 24, 6, 0, 1, "is to protect this base from the experiments that went wrong, or those"
    OutlineString 25, 6, 0, 1, "whom got infected by accident. Good luck with the General, Marc. You"
    OutlineString 26, 6, 0, 1, "will need it.' I finally bid him fare well, and decided to not eat him"
    OutlineString 27, 6, 0, 1, "since he seems like a formidable opponent. Time to move on."

    PlayerWait 15, 11
    COLOR colr~&

END IF



IF (cmd$ = "TALK TO COP" OR cmd$ = "TALK" OR cmd$ = "TALK COP") AND CurrentRoom = 98 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 8, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 10, 33, 0, 1, "'TALK TO COP'"
    OutlineString 12, 6, 0, 1, "The cop barely wakes up and tells me I need to move along before he"
    OutlineString 13, 6, 0, 1, "arrests me. Really?"
    OutlineString 14, 6, 0, 1, ""
    OutlineString 15, 6, 0, 1, ""
    OutlineString 16, 6, 0, 1, ""
    OutlineString 17, 6, 0, 1, ""

    PlayerWait 15, 11
    COLOR colr~&

END IF



IF (cmd$ = "TALK TO DOCTOR" OR cmd$ = "TALK" OR cmd$ = "TALK DOCTOR") AND CurrentRoom = 110 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 8, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 10, 31, 0, 1, "'TALK TO DOCTOR'"
    OutlineString 12, 6, 0, 1, "There is nothing to talk about with the Doctor at this time..."
    OutlineString 13, 6, 0, 1, ""
    OutlineString 14, 6, 0, 1, ""
    OutlineString 15, 6, 0, 1, ""
    OutlineString 16, 6, 0, 1, ""
    OutlineString 17, 6, 0, 1, ""

    PlayerWait 15, 11
    COLOR colr~&

END IF

IF (cmd$ = "TALK TO NURSE" OR cmd$ = "TALK" OR cmd$ = "TALK NURSE") AND CurrentRoom = 115 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 8, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 10, 32, 0, 1, "'TALK TO NURSE'"
    OutlineString 12, 6, 0, 1, "There is nothing to discuss with the nurse at the this time..."
    OutlineString 13, 6, 0, 1, ""
    OutlineString 14, 6, 0, 1, ""
    OutlineString 15, 6, 0, 1, ""
    OutlineString 16, 6, 0, 1, ""
    OutlineString 17, 6, 0, 1, ""

    PlayerWait 15, 11
    COLOR colr~&

END IF

IF (cmd$ = "TALK TO COWARD" OR cmd$ = "TALK" OR cmd$ = "TALK COWARD") AND CurrentRoom = 134 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 8, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 10, 31, 0, 1, "'TALK TO COWARD'"
    OutlineString 12, 6, 0, 1, "The coward is too scared to want to talk at this time..."
    OutlineString 13, 6, 0, 1, ""
    OutlineString 14, 6, 0, 1, ""
    OutlineString 15, 6, 0, 1, ""
    OutlineString 16, 6, 0, 1, ""
    OutlineString 17, 6, 0, 1, ""

    PlayerWait 15, 11
    COLOR colr~&

END IF

IF (cmd$ = "TALK TO LADY" OR cmd$ = "TALK" OR cmd$ = "TALK LADY") AND CurrentRoom = 143 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 8, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 10, 33, 0, 1, "'TALK TO LADY'"
    OutlineString 12, 6, 0, 1, "The lady doesn't have the time to speak to me as she is too busy."
    OutlineString 13, 6, 0, 1, ""
    OutlineString 14, 6, 0, 1, ""
    OutlineString 15, 6, 0, 1, ""
    OutlineString 16, 6, 0, 1, ""
    OutlineString 17, 6, 0, 1, ""

    PlayerWait 15, 11
    COLOR colr~&

END IF

IF (cmd$ = "TALK TO KID" OR cmd$ = "TALK" OR cmd$ = "TALK KID") AND CurrentRoom = 157 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 8, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 10, 33, 0, 1, "'TALK TO KID'"
    OutlineString 12, 6, 0, 1, "The kid is too busy listening to his music, and doesn't want to talk."
    OutlineString 13, 6, 0, 1, ""
    OutlineString 14, 6, 0, 1, ""
    OutlineString 15, 6, 0, 1, ""
    OutlineString 16, 6, 0, 1, ""
    OutlineString 17, 6, 0, 1, ""

    PlayerWait 15, 11
    COLOR colr~&

END IF

IF (cmd$ = "TALK TO DRIVER" OR cmd$ = "TALK" OR cmd$ = "TALK DRIVER") AND CurrentRoom = 167 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 8, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 10, 32, 0, 1, "'TALK TO DRIVER'"
    OutlineString 12, 6, 0, 1, "The driver is begging me to kill him. I don't think I want to talk to"
    OutlineString 13, 6, 0, 1, "this idiot right now."
    OutlineString 14, 6, 0, 1, ""
    OutlineString 15, 6, 0, 1, ""
    OutlineString 16, 6, 0, 1, ""
    OutlineString 17, 6, 0, 1, ""

    PlayerWait 15, 11
    COLOR colr~&

END IF

IF (cmd$ = "TALK TO GENERAL" OR cmd$ = "TALK" OR cmd$ = "TALK GENERAL") AND CurrentRoom = 178 THEN

    IF Has_BackPack = TRUE THEN

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 2, 77, 28, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 3, 31, 0, 1, "'TALK TO GENERAL'"
        OutlineString 5, 6, 0, 1, "'Marc!' Says the General. 'What a pleasant surprise! You were always"
        OutlineString 6, 6, 0, 1, "the resourceful kind. I knew if anyone could past this test, it would"
        OutlineString 7, 6, 0, 1, "be you.' 'Test?' You say. 'What test?' 'The zombie disease of course!"
        OutlineString 8, 6, 0, 1, "We were testing a strange virus like substance we found aboard a"
        OutlineString 9, 6, 0, 1, "vessel we discovered in the Artic, under the ice. It contains a"
        OutlineString 10, 6, 0, 1, "regenerative property that allows a person to survive those things"
        OutlineString 11, 6, 0, 1, "that could kill a normal living person. In our first trials, people"
        OutlineString 12, 6, 0, 1, "(those on death row) would turn into mindless zombie creatures that"
        OutlineString 13, 6, 0, 1, "you now see roaming the streets. But we discovered a gene that caused"
        OutlineString 14, 6, 0, 1, "people to become a zombie. Apparently the gene was designed to help"
        OutlineString 15, 6, 0, 1, "the virus work in a species of unknown origin, so we removed the"
        OutlineString 16, 6, 0, 1, "foreign gene. Sadly, the virus still attacked the brain, causing those"
        OutlineString 17, 6, 0, 1, "who were infected to lose certain mental abilities, and still made"
        OutlineString 18, 6, 0, 1, "them hungry for human brains, unless they were injected with the"
        OutlineString 19, 6, 0, 1, "vaccine at periodic intervals. Sadly, one of the scientist here"
        OutlineString 20, 6, 0, 1, "managed to get a sample out of the lab, and sold it to a group of"
        OutlineString 21, 6, 0, 1, "gorilla soldiers. The transfer was a setup, and the scientist was"
        OutlineString 22, 6, 0, 1, "murderd.'"
        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 24, 6, 0, 1, "'Well, they're here. The Super Snipers (super soldier want-a-be)"
        OutlineString 25, 6, 0, 1, "finally managed to break into the base. You need to go into the vault"
        OutlineString 26, 6, 0, 1, "grab all the data on the zombie research, all the vaccine, and get to"
        OutlineString 27, 6, 0, 1, "the escape hatch. You will have ten minutes to get out. Good Luck!"

        PlayerWait 15, 11
        COLOR colr~&

        Talked_To_General = TRUE
        Game_Max_Minutes = 10
        Game_Max_Seconds = 0
        GameTime = Game_Max_Minutes * 60 + Game_Max_Seconds

    ELSE

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'TALK TO GENERAL'"
        OutlineString 12, 6, 0, 1, "'Marc!', the General says, 'What a pleasant surprise! We don't have"
        OutlineString 13, 6, 0, 1, "time to chat, but I am glad to see you made it. Please step into the"
        OutlineString 14, 6, 0, 1, "vault and collect what you can of the vaccine, and then get to escape"
        OutlineString 15, 6, 0, 1, "hatch. The super snipers are about to join us, and they are after the"
        OutlineString 16, 6, 0, 1, "vaccine. I am about to blow up this facility and the vault, so get out"
        OutlineString 17, 6, 0, 1, "now! You have three minutes. Good luck Marc!'"

        PlayerWait 15, 11
        COLOR colr~&

        Talked_To_General = TRUE
        Game_Max_Minutes = 3
        Game_Max_Seconds = 0
        GameTime = Game_Max_Minutes * 60 + Game_Max_Seconds

    END IF

END IF

IF (cmd$ = "TALK TO OLD MAN" OR cmd$ = "TALK" OR cmd$ = "TALK TO MAN" OR cmd$ = "TALK MAN") AND CurrentRoom = 37 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 8, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 10, 31, 0, 1, "'TALK TO OLD MAN'"
    OutlineString 12, 6, 0, 1, ""
    OutlineString 13, 6, 0, 1, ""
    OutlineString 14, 6, 0, 1, ""
    OutlineString 15, 6, 0, 1, ""
    OutlineString 16, 6, 0, 1, ""
    OutlineString 17, 6, 0, 1, ""

    PlayerWait 15, 11
    COLOR colr~&

END IF

IF (cmd$ = "TALK TO WOMAN" OR cmd$ = "TALK" OR cmd$ = "TALK WOMAN") AND CurrentRoom = 42 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 8, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 10, 33, 0, 1, "'TALK TO WOMAN'"
    OutlineString 12, 6, 0, 1, ""
    OutlineString 13, 6, 0, 1, ""
    OutlineString 14, 6, 0, 1, ""
    OutlineString 15, 6, 0, 1, ""
    OutlineString 16, 6, 0, 1, ""
    OutlineString 17, 6, 0, 1, ""

    PlayerWait 15, 11
    COLOR colr~&

END IF

IF (cmd$ = "TALK TO TEEN" OR cmd$ = "TALK" OR cmd$ = "TALK TEEN") AND CurrentRoom = 48 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 8, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 10, 31, 0, 1, "'TALK TO TEEN'"
    OutlineString 12, 6, 0, 1, ""
    OutlineString 13, 6, 0, 1, ""
    OutlineString 14, 6, 0, 1, ""
    OutlineString 15, 6, 0, 1, ""
    OutlineString 16, 6, 0, 1, ""
    OutlineString 17, 6, 0, 1, ""

    PlayerWait 15, 11
    COLOR colr~&

END IF

IF (cmd$ = "TALK TO SOLDIER" OR cmd$ = "TALK" OR cmd$ = "TALK SOLDIER") AND CurrentRoom = 59 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 8, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 10, 31, 0, 1, "'TALK TO SOLDIER'"
    OutlineString 12, 6, 0, 1, ""
    OutlineString 13, 6, 0, 1, ""
    OutlineString 14, 6, 0, 1, ""
    OutlineString 15, 6, 0, 1, ""
    OutlineString 16, 6, 0, 1, ""
    OutlineString 17, 6, 0, 1, ""

    PlayerWait 15, 11
    COLOR colr~&

END IF

IF (cmd$ = "TALK TO PILOT" OR cmd$ = "TALK" OR cmd$ = "TALK PILOT") AND CurrentRoom = 68 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 8, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 10, 31, 0, 1, "'TALK PILOT'"
    OutlineString 12, 6, 0, 1, ""
    OutlineString 13, 6, 0, 1, ""
    OutlineString 14, 6, 0, 1, ""
    OutlineString 15, 6, 0, 1, ""
    OutlineString 16, 6, 0, 1, ""
    OutlineString 17, 6, 0, 1, ""

    PlayerWait 15, 11
    COLOR colr~&

END IF


IF (cmd$ = "EAT BRAINS" OR cmd$ = "EAT MAN" OR cmd$ = "ATTACK" OR cmd$ = "ATTACK MAN" OR cmd$ = "EAT") AND CurrentRoom = 89 THEN

    IF NPC_Man > 0 THEN

        IF NPC_Man <= 15 THEN
            'PRINT "You grab the man and feast upon his tasty brains."

            colr~& = _DEFAULTCOLOR

            DrawFillBox 1, 1, 80, 30, 0, 178
            DrawBox 4, 8, 77, 19, 12, 13, 219

            _PRINTMODE _KEEPBACKGROUND
            COLOR 12

            '                           1234567890123456789012345678901234567890123456789012345678901234567890
            OutlineString 10, 31, 0, 1, "'EAT MAN'S (E-314) BRAINS'"
            OutlineString 12, 6, 0, 1, "(The half-breed E-314 finally succumbed to his enjuries and died. You"
            OutlineString 13, 6, 0, 1, "quickly eat his brain and all of the sudden you felt this rush of"
            OutlineString 14, 6, 0, 1, "power like you never felt before. You felt more alive then you ever"
            OutlineString 15, 6, 0, 1, "did as a human, and you felt more powerful then ever did as a zombie."
            OutlineString 16, 6, 0, 1, "Your health has been fully replenished and it's time to talk to the"
            OutlineString 17, 6, 0, 1, "General to find out what is going on.)"

            PlayerWait 15, 11
            COLOR colr~&

            NPC_Man = 0
            Zombie_Health = Zombie_Health_Max

        ELSE

            colr~& = _DEFAULTCOLOR

            DrawFillBox 1, 1, 80, 30, 0, 178
            DrawBox 4, 8, 77, 19, 12, 13, 219

            _PRINTMODE _KEEPBACKGROUND
            COLOR 12

            '                           1234567890123456789012345678901234567890123456789012345678901234567890
            OutlineString 10, 31, 0, 1, "'EAT MAN'S (E-314) BRAINS'"
            OutlineString 12, 6, 0, 1, "(Though you successfully landed your deadly Ninja style attacks"
            OutlineString 13, 6, 0, 1, "against E-314, he did not take very much damage. In turn, E-314 landed"
            OutlineString 14, 6, 0, 1, "a single blow upon you, causing 45-Points of damage. You can not take"
            OutlineString 15, 6, 0, 1, "too many more of these hits without regaining some of your health. Of"
            OutlineString 16, 6, 0, 1, "course, the only way to do this is to find some brains. Since E-314"
            OutlineString 17, 6, 0, 1, "thinks he is indestructable, his health will not regenerate.)"

            PlayerWait 15, 11
            COLOR colr~&

            ' *** SINCE E-314 IS A SUPER SOLDIER WE CAN NOT TAKE MUCH HEALTH AWAY FROM BY BITTING HIM, BUT
            ' *** BITTING HIM IS THE ONLY WAY TO KILL HIM
            NPC_Man = NPC_Man - 15
            'IF NPC_Man <= 0 THEN NPC_Man = 1

            Zombie_Health = Zombie_Health - 45
            IF Zombie_Health <= 0 THEN

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 8, 77, 19, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 31, 0, 1, "'EAT MAN'S (E-314) BRAINS'"
                OutlineString 12, 6, 0, 1, "(Though you successfully landed your deadly Ninja style attacks"
                OutlineString 13, 6, 0, 1, "against E-314, he did not take very much damage. In turn, E-314 landed"
                OutlineString 14, 6, 0, 1, "a single blow upon you, causing 45-Points of damage. You can not take"
                OutlineString 15, 6, 0, 1, "too many more of these hits without regaining some of your health. Of"
                OutlineString 16, 6, 0, 1, "course, the only way to do this is to find some brains. Since E-314"
                OutlineString 17, 6, 0, 1, "thinks he is indestructable, his health will not regenerate.)"

                PlayerWait 15, 11
                COLOR colr~&

                PlayerDies
            END IF
        END IF

    ELSE

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT MAN'S (E-314) BRAINS'"
        OutlineString 12, 6, 0, 1, "(You have already eaten E-314's brain, so there is nothing left for"
        OutlineString 13, 6, 0, 1, "you here. You need to move on and talk to the General. Apparently he"
        OutlineString 14, 6, 0, 1, "has been expecting you for some time now, so you can not keep him"
        OutlineString 15, 6, 0, 1, "waiting anymore.)"
        OutlineString 16, 6, 0, 1, "'Rest in peace E-314!'"
        OutlineString 17, 6, 0, 1, "'Super Soldier my caboose!"

        PlayerWait 15, 11
        COLOR colr~&

    END IF
    GOTO PressAnyKey
END IF


IF (cmd$ = "EAT BRAINS" OR cmd$ = "EAT GENERAL" OR cmd$ = "ATTACK" OR cmd$ = "ATTACK GENERAL" OR cmd$ = "EAT") AND CurrentRoom = 178 THEN

    IF NPC_General > 0 THEN

        IF NPC_General <= 15 THEN

            'PRINT "He quickly finishes his bottle of whiskey and surrenders."

            colr~& = _DEFAULTCOLOR
            _PALETTECOLOR 14, _RGB32(128, 0, 0)

            DrawFillBox 1, 1, 80, 30, 0, 178
            DrawBox 4, 2, 77, 28, 15, 14, 219

            _PRINTMODE _KEEPBACKGROUND
            COLOR 15

            '                           1234567890123456789012345678901234567890123456789012345678901234567890
            OutlineString 3, 31, 0, 1, "'EAT GENERAL'S BRAINS'"
            OutlineString 5, 6, 0, 1, "(General Omar Bradley, you beloved friend and commanding officer"
            OutlineString 6, 6, 0, 1, "finally succumbed to his wounds, allowing your to sink your teeth deep"
            OutlineString 7, 6, 0, 1, "into his skull, taking a big chunk, and giving you access to his large"
            OutlineString 8, 6, 0, 1, "brain, which you find heavenly plesaure from as you take bite after"
            OutlineString 9, 6, 0, 1, "bite after bite. You loved in life, and you love that he gave his life"
            OutlineString 10, 6, 0, 1, "to feed your raging urge to eat human brains."

            OutlineString 12, 6, 0, 1, "Sadly, your victory over the General is short lived when you discover"
            OutlineString 13, 6, 0, 1, "that entrance to the secret vault is at least a two man operation."
            OutlineString 14, 6, 0, 1, "One has to pull the secret lever at the desk, which has a spring"
            OutlineString 15, 6, 0, 1, "tensioner that makes it tough to pull and hold it so weak people or"
            OutlineString 16, 6, 0, 1, "zombies can use it, and another person to enter the private area."
            OutlineString 17, 6, 0, 1, "While you were feasting away on the General's brains, you failed to"
            OutlineString 18, 6, 0, 1, "notice the super snipers had finally broken in, which gave them the"
            OutlineString 19, 6, 0, 1, "upper hand on you, allowing them to kill you. Since no one was"
            OutlineString 20, 6, 0, 1, "alive to stop them, the super snipers were able to steal all the"
            OutlineString 21, 6, 0, 1, "research papers, which they were after the whole time, and all the"
            OutlineString 22, 6, 0, 1, "vaccine that was left. They were able to create more super soldiers"
            OutlineString 23, 6, 0, 1, "like E-314, but stronger, and used them to take control over the"
            OutlineString 24, 6, 0, 1, "world."

            OutlineString 26, 6, 0, 1, "Oh, in the very brief moments while dying, you started thinking"
            OutlineString 27, 6, 0, 1, "about Billy, your son, and your wife. I hope she makes it!"


            PlayerWait 15, 11
            COLOR colr~&

            PlayerDies

        ELSE

            colr~& = _DEFAULTCOLOR

            DrawFillBox 1, 1, 80, 30, 0, 178
            DrawBox 4, 8, 77, 19, 12, 13, 219

            _PRINTMODE _KEEPBACKGROUND
            COLOR 12

            '                           1234567890123456789012345678901234567890123456789012345678901234567890
            OutlineString 10, 31, 0, 1, "'EAT GENERAL'S BRAINS'"
            OutlineString 12, 6, 0, 1, "Though you succesfully attacked the General with your zombified"
            OutlineString 13, 6, 0, 1, "martial art moves, you did very little damage to him. The General"
            OutlineString 14, 6, 0, 1, "swiftly knocked you over the head with0"
            OutlineString 15, 6, 0, 1, ""
            OutlineString 16, 6, 0, 1, ""
            OutlineString 17, 6, 0, 1, ""

            PlayerWait 15, 11
            COLOR colr~&

            NPC_General = NPC_General - 15

            Zombie_Health = Zombie_Health - 85

            IF Zombie_Health <= 0 THEN

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 8, 77, 19, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 31, 0, 1, "'EAT GENERAL'S BRAINS'"
                OutlineString 12, 6, 0, 1, "The General killed me when I tried to eat his brains, and now I will"
                OutlineString 13, 6, 0, 1, "never be able to find a cure for this mess, or find out what happened"
                OutlineString 14, 6, 0, 1, "to mu family."
                OutlineString 15, 6, 0, 1, ""
                OutlineString 16, 6, 0, 1, ""
                OutlineString 17, 6, 0, 1, ""

                PlayerWait 15, 11
                COLOR colr~&

                PlayerDies

            END IF

        END IF

    ELSE

        ' *** THE PROGRAM WILL NEVER GET HERE SO THERE IS NO REASON TO SHOW ANY MESSAGE

    END IF

END IF



IF (cmd$ = "EAT BRAINS" OR cmd$ = "EAT COP" OR cmd$ = "ATTACK" OR cmd$ = "ATTACK COP" OR cmd$ = "EAT") AND CurrentRoom = 98 THEN

    IF NPC_Cop > 0 THEN

        'PRINT "The Cop is sleeping and before he awakens, you dine for one."

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT COP'S BRAINS'"
        OutlineString 12, 6, 0, 1, "The cop is in his car, sleeping. He left his window down which allowed"
        OutlineString 13, 6, 0, 1, "me to grab him and start eating his brain before he realized what was"
        OutlineString 14, 6, 0, 1, "going on."
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

        NPC_Cop = 0
        Zombie_Health = Zombie_Health + 45
        IF Zombie_Health > Zombie_Health_Max THEN Zombie_Health = Zombie_Health_Max

    ELSE

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT COP'S BRAINS'"
        OutlineString 12, 6, 0, 1, "The cop is laying in his car dead, and he has no brain."
        OutlineString 13, 6, 0, 1, ""
        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

    END IF

END IF



IF (cmd$ = "EAT BRAINS" OR cmd$ = "EAT DOCTOR" OR cmd$ = "ATTACK" OR cmd$ = "ATTACK DOCTOR" OR cmd$ = "EAT") AND CurrentRoom = 110 THEN
    IF NPC_Doctor > 0 THEN

        'PRINT "You grab him and he can't get away. Before you dine in on his"
        'PRINT "brain, he wets himself...disgusting."

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT DOCTOR'S BRAINS'"
        OutlineString 12, 6, 0, 1, "The Doctor looks up to me and appearsto be shocked to see. Not because"
        OutlineString 13, 6, 0, 1, "I am a zombie, but because he recognizes me. He starts peeing on"
        OutlineString 14, 6, 0, 1, "himself when I grab him and start eating his brain."
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

        NPC_Doctor = 0
        Zombie_Health = Zombie_Health + 45
        IF Zombie_Health > Zombie_Health_Max THEN Zombie_Health = Zombie_Health_Max

    ELSE

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT DOCTOR'S BRAINS'"
        OutlineString 12, 6, 0, 1, "The doctor is dead and has no brain."
        OutlineString 13, 6, 0, 1, ""
        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

    END IF

END IF



IF (cmd$ = "EAT BRAINS" OR cmd$ = "EAT NURSE" OR cmd$ = "ATTACK" OR cmd$ = "ATTACK NURSE" OR cmd$ = "EAT") AND CurrentRoom = 115 THEN

    IF NPC_Nurse > 0 THEN

        'PRINT "SHe screams at the sight of you. How dare she. You corner"
        'PRINT "her as fear is her enemy. Not wasting a minute, you chew"
        'PRINT "into he skull and eat a wonderous meal. You thank her."

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT NURSE'S BRAINS'"
        OutlineString 12, 6, 0, 1, "The nurse... I recognize her, and apparently she recognizes me. I walk"
        OutlineString 13, 6, 0, 1, "up to her like a regular human, and she reaches out her hand to shake"
        OutlineString 14, 6, 0, 1, "mine. But when I begin to shake her hand, I pulled her to me so fast"
        OutlineString 15, 6, 0, 1, "that she didn't have time to scream before I started eat... her brain."
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

        NPC_Nurse = 0
        Zombie_Health = Zombie_Health + 45
        IF Zombie_Health > Zombie_Health_Max THEN Zombie_Health = Zombie_Health_Max

    ELSE

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT NURSE'S BRAINS'"
        OutlineString 12, 6, 0, 1, "The nurse is dead and has no brain."
        OutlineString 13, 6, 0, 1, ""
        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

    END IF

END IF



IF (cmd$ = "EAT BRAINS" OR cmd$ = "EAT COWARD" OR cmd$ = "ATTACK" OR cmd$ = "ATTACK COWARD" OR cmd$ = "EAT") AND CurrentRoom = 134 THEN
    IF NPC_Coward > 0 THEN

        'PRINT "He just stares at you...is he not going to run and hide?"

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT COWARD'S BRAINS'"
        OutlineString 12, 6, 0, 1, "This dude is so scared, that he starts peeing on himself. What a"
        OutlineString 13, 6, 0, 1, "coward! I grab him and start eating his brain."
        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

        NPC_Coward = 0
        Zombie_Health = Zombie_Health + 45
        IF Zombie_Health > Zombie_Health_Max THEN Zombie_Health = Zombie_Health_Max

    ELSE

        'PRINT "Soon he'll be in heaven."

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT COWARD'S BRAINS'"
        OutlineString 12, 6, 0, 1, "The coward is dead and he has no brain."
        OutlineString 13, 6, 0, 1, ""
        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

    END IF

END IF



IF (cmd$ = "EAT BRAINS" OR cmd$ = "EAT LADY" OR cmd$ = "ATTACK" OR cmd$ = "ATTACK LADY" OR cmd$ = "EAT") AND CurrentRoom = 143 THEN

    IF NPC_Lady > 0 THEN

        'PRINT "You climb over the desk and begin work for the brains."

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT LADY'S ... BRAINS'"
        OutlineString 12, 6, 0, 1, "The lady is working at her desk, and doesn't see me right away, which"
        OutlineString 13, 6, 0, 1, "I use to my adventage. I jump over the desk and grab her while we fall"
        OutlineString 14, 6, 0, 1, "to the floor. I begin to eat... her brain..."
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

        NPC_Lady = 0
        Zombie_Health = Zombie_Health + 45
        IF Zombie_Health > Zombie_Health_Max THEN Zombie_Health = Zombie_Health_Max

    ELSE

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT LADY'S BRAINS'"
        OutlineString 12, 6, 0, 1, "The lady is no longer working beccause she is dead and has no brian."
        OutlineString 13, 6, 0, 1, ""
        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

    END IF

END IF



IF (cmd$ = "EAT BRAINS" OR cmd$ = "EAT KID" OR cmd$ = "ATTACK" OR cmd$ = "ATTACK KID" OR cmd$ = "EAT") AND CurrentRoom = 157 THEN
    IF NPC_Kid > 0 THEN

        'PRINT "He tries to run and hide, but alas you are faster. You make a"
        'PRINT "quick meal out of him. That'll teach him."

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT KID'S BRAINS'"
        OutlineString 12, 6, 0, 1, "The kid tries to tun from me, but my super abilities allows me to"
        OutlineString 13, 6, 0, 1, "easily capture him, and I begin to eat his brain."
        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

        NPC_Kid = 0
        Zombie_Health = Zombie_Health + 45
        IF Zombie_Health > Zombie_Health_Max THEN Zombie_Health = Zombie_Health_Max

    ELSE

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT KID'S BRAINS'"
        OutlineString 12, 6, 0, 1, "The kid lys on the ground dead and has no brain."
        OutlineString 13, 6, 0, 1, ""
        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

    END IF

END IF




IF (cmd$ = "EAT BRAINS" OR cmd$ = "EAT DRIVER" OR cmd$ = "ATTACK" OR cmd$ = "ATTACK DRIVER" OR cmd$ = "EAT") AND CurrentRoom = 167 THEN

    IF NPC_Driver > 0 THEN
        'PRINT "He screams almost with joy over being murdered over his"
        'PRINT "brain! How odd?"

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT DRIVER'S BRAINS'"
        OutlineString 12, 6, 0, 1, "The driver of the car that appears to intoxicated, and seems to be"
        OutlineString 13, 6, 0, 1, "happy to see me. He acts like he wants me to eat him."
        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

        NPC_Driver = 0
        Zombie_Health = Zombie_Health + 45
        IF Zombie_Health > Zombie_Health_Max THEN Zombie_Health = Zombie_Health_Max

    ELSE

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT DRIVER'S BRAINS'"
        OutlineString 12, 6, 0, 1, "The driver is laying in the other seat and has no brain."
        OutlineString 13, 6, 0, 1, ""
        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

    END IF

END IF


IF (cmd$ = "EAT BRAINS" OR cmd$ = "EAT OLD MAN" OR cmd$ = "ATTACK" OR cmd$ = "ATTACK OLD MAN" OR cmd$ = "EAT") AND CurrentRoom = 37 THEN

    IF NPC_OldMan > 0 THEN

        'PRINT "You grab old man...bite in his skull like an apple."

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT OLD MAN'S BRAINS'"
        OutlineString 12, 6, 0, 1, "The old man froze in fear when he saw me and started having a heart"
        OutlineString 13, 6, 0, 1, "attack. I don't care about his heart, I just want his brain"
        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

        NPC_OldMan = 0
        Zombie_Health = Zombie_Health + 45
        IF Zombie_Health > Zombie_Health_Max THEN Zombie_Health = Zombie_Health_Max

    ELSE

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT OLD MAN'S BRAINS'"
        OutlineString 12, 6, 0, 1, "The old man is dead and does not have a brain."
        OutlineString 13, 6, 0, 1, ""

        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

    END IF

END IF



IF (cmd$ = "EAT BRAINS" OR cmd$ = "EAT WOMAN" OR cmd$ = "ATTACK" OR cmd$ = "ATTACK WOMAN" OR cmd$ = "EAT") AND CurrentRoom = 42 THEN

    IF NPC_Woman > 0 THEN

        'PRINT "You grab the Woman and get to eatting."

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT WOMAN'S ... BRAINS'"
        OutlineString 12, 6, 0, 1, "The woman tried to run from me, but a heal of her shoe broke causing"
        OutlineString 13, 6, 0, 1, "her to fall. I pounced on her and began eating... her brain..."
        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

        NPC_Woman = 0
        Zombie_Health = Zombie_Health + 45
        IF Zombie_Health > Zombie_Health_Max THEN Zombie_Health = Zombie_Health_Max
    ELSE

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT WOMAN'S ... BRAINS'"
        OutlineString 12, 6, 0, 1, "The woman is dead and has no brians."
        OutlineString 13, 6, 0, 1, ""
        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

    END IF

END IF



IF (cmd$ = "EAT BRAINS" OR cmd$ = "EAT TEEN" OR cmd$ = "ATTACK" OR cmd$ = "ATTACK TEEN" OR cmd$ = "EAT") AND CurrentRoom = 48 THEN

    IF NPC_Teen > 0 THEN

        'PRINT "You sneak up on the teen and bite the back of his head."

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT TEEN'S BRAINS'"
        OutlineString 12, 6, 0, 1, "The teen was listening to his music box and didn't hear me coming up"
        OutlineString 13, 6, 0, 1, "behind him."
        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

        NPC_Teen = 0
        Zombie_Health = Zombie_Health + 20
        IF Zombie_Health > Zombie_Health_Max THEN Zombie_Health = Zombie_Health_Max

    ELSE

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT TEEN'S BRAINS'"
        OutlineString 12, 6, 0, 1, "Teen is dead and doesn't have a brain."
        OutlineString 13, 6, 0, 1, ""
        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

    END IF


END IF



IF (cmd$ = "EAT BRAINS" OR cmd$ = "EAT SOLDIER" OR cmd$ = "ATTACK" OR cmd$ = "ATTACK SOLDIER" OR cmd$ = "EAT") AND CurrentRoom = 59 THEN

    IF NPC_Soldier > 0 THEN

        'PRINT "He scream and yell but all I want is brain."

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT SOLDIER'S BRAINS'"
        OutlineString 12, 6, 0, 1, "The soldier was sleeping, allowing me to sneak on him to take a bite."
        OutlineString 13, 6, 0, 1, ""
        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

        NPC_Soldier = 0
        Zombie_Health = Zombie_Health + 45
        IF Zombie_Health > Zombie_Health_Max THEN Zombie_Health = Zombie_Health_Max

    ELSE

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT SOLDIER'S BRAINS'"
        OutlineString 12, 6, 0, 1, "The soldier is dead and doesn't have a brain."
        OutlineString 13, 6, 0, 1, ""
        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

    END IF

END IF



IF (cmd$ = "EAT BRAINS" OR cmd$ = "EAT PILOT" OR cmd$ = "ATTACK" OR cmd$ = "ATTACK PILOT" OR cmd$ = "EAT") AND CurrentRoom = 68 THEN
    IF NPC_Pilot > 0 THEN

        'PRINT "You grab the Pilot and feast upon his brains like toffee."

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT PILOT'S BRAINS'"
        OutlineString 12, 6, 0, 1, "The pilot was too busy trying to get the helicopter ready to take off,"
        OutlineString 13, 6, 0, 1, "that he didn't see me coming. I pulled him out of the chopper and"
        OutlineString 14, 6, 0, 1, "begin to feast on his brains."
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

        NPC_Pilot = 0
        Zombie_Health = Zombie_Health + 45
        IF Zombie_Health > Zombie_Health_Max THEN Zombie_Health = Zombie_Health_Max

    ELSE

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT PILOT'S BRAINS'"
        OutlineString 12, 6, 0, 1, "The pilot is laying outside the chopper right where I layed him when"
        OutlineString 13, 6, 0, 1, "I started eating his brain."
        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

    END IF


END IF

IF (cmd$ = "EAT BRAINS" OR cmd$ = "EAT JOAN" OR cmd$ = "ATTACK" OR cmd$ = "ATTACK JOAN" OR cmd$ = "EAT") AND CurrentRoom = 5 THEN
    IF NPC_Joan > 0 THEN

        'PRINT "I pounce on Joan and bite her skull like an apple. Crunchy. She attack with"
        'LOCATE ZombieMessageY + 1, ZombieMessageX
        'PRINT "knife, but I hit her with stick. She out cold. Now I feast in peace."

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT JOAN'S BRAINS'"
        OutlineString 12, 6, 0, 1, "I grabbed Joan in a head lock in proceeded to bite into her skull like"
        OutlineString 13, 6, 0, 1, "a crunchy apple."
        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

        NPC_Joan = 0
        Zombie_Health = Zombie_Health + 65
        IF Zombie_Health > Zombie_Health_Max THEN Zombie_Health = Zombie_Health_Max

    ELSE

        'PRINT "I see Joan. She lay on floor in pool of blood. Hole in head. Nothing to eat."
        '      123456789012345678901234567890123456789012345678901234567890123456789012345678

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT JOAN'S BRAINS'"
        OutlineString 12, 6, 0, 1, "Joan is laying on the floor without a brain. There is nothing else for"
        OutlineString 13, 6, 0, 1, "me to eat"
        OutlineString 14, 6, 0, 1, ""
        OutlineString 15, 6, 0, 1, ""
        OutlineString 16, 6, 0, 1, ""
        OutlineString 17, 6, 0, 1, ""

        PlayerWait 15, 11
        COLOR colr~&

    END IF
    GOTO PressAnyKey

END IF

IF (cmd$ = "EAT BRAINS" OR cmd$ = "EAT PA" OR cmd$ = "ATTACK" OR cmd$ = "ATTACK PA" OR cmd$ = "EAT") AND CurrentRoom = 3 THEN
    IF NPC_Pa > 0 THEN

        'PRINT "Pa standing, frozen with fear... Of me. I jump like cat at him and eat tasty "
        'LOCATE ZombieMessageY + 1, ZombieMessageX
        'PRINT "brains. Warm blood running down my cheek (from hole) unto my chest."

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 20, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT PA'S BRAINS'"
        OutlineString 12, 6, 0, 1, "When I arrested this jerk a few years ago, I never thought I would be"
        OutlineString 13, 6, 0, 1, "eating his brains, nor did I think I would be a member of the undead."
        OutlineString 14, 6, 0, 1, "What really is funny are the threats he shouted at me as he was"
        OutlineString 15, 6, 0, 1, "escorted out of the court room, claiming he was going to kill me by"
        OutlineString 16, 6, 0, 1, "ripping my head off. Oh how I love seeing his eyes before I rip open"
        OutlineString 17, 6, 0, 1, "his skull open, as those are of the realization that his threats"
        OutlineString 18, 6, 0, 1, "has back-fired on him. Oh sweet vengence!"

        PlayerWait 15, 11
        COLOR colr~&

        NPC_Pa = 0
        Zombie_Health = Zombie_Health + 75
        IF Zombie_Health > Zombie_Health_Max THEN Zombie_Health = Zombie_Health_Max
    ELSE

        'PRINT "What? Pa have no brains! Buuuurrrp! Must find other poor souls to give life."

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT PA'S BRAINS'"
        OutlineString 12, 6, 0, 1, "As much as I would love to rekill this psychopath over and over, sadly"
        OutlineString 13, 6, 0, 1, "I have no way of bringing him back to life. I could, however, recode"
        OutlineString 14, 6, 0, 1, "this game to keep reliving a winderous moment, but sadly my friend,"
        OutlineString 15, 6, 0, 1, "that would be cheating, though it is a clever idea. I do have one"
        OutlineString 16, 6, 0, 1, "question though, how does a fictional character in a text adventure,"
        OutlineString 17, 6, 0, 1, "recode the game their in? Is that artificial intelligence?"

        PlayerWait 15, 11
        COLOR colr~&

    END IF

    GOTO PressAnyKey

END IF


IF (cmd$ = "EAT BRAINS" OR cmd$ = "EAT MA" OR cmd$ = "ATTACK" OR cmd$ = "ATTACK MA" OR cmd$ = "EAT") AND CurrentRoom = 15 THEN
    IF NPC_Ma > 0 THEN

        'PRINT "I grabbed Ma and she screamed. She broke loose, twisted, and ran into wall."
        'LOCATE ZombieMessageY + 1, ZombieMessageX
        'PRINT "I jump on her and eat good brains... Not like chicken though."
        '      123456789012345678901234567890123456789012345678901234567890123456789012345678

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT MA'S BRAINS'"
        OutlineString 12, 6, 0, 1, "As I bite into her juicy... skull... and start sucking out her to die"
        OutlineString 13, 6, 0, 1, "for brain, I start to think about my son Billy. I really wanted mama"
        OutlineString 14, 6, 0, 1, "here to take care of him, but I guess I need her brain more. Let the"
        OutlineString 15, 6, 0, 1, "good times roll, or flow down my throat... Yeah... I should tone it"
        OutlineString 16, 6, 0, 1, "down a little. I guess I was getting too much into character, but that"
        OutlineString 17, 6, 0, 1, "is what I am getting paid for while I act in this game."

        PlayerWait 15, 11
        COLOR colr~&

        NPC_Ma = 0
        Zombie_Health = Zombie_Health + 50
        IF Zombie_Health > Zombie_Health_Max THEN Zombie_Health = Zombie_Health_Max
    ELSE

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT MA'S BRAINS'"
        OutlineString 12, 6, 0, 1, "'...Hello... ...Can you hear me... ...This is a special report...'"
        OutlineString 13, 6, 0, 1, "What the mount Fuji? Is that coming from the hole in her head? It"
        OutlineString 14, 6, 0, 1, "can't be. When I lean down to listen in the hole, thr truth slowly"
        OutlineString 15, 6, 0, 1, "revealed itself as it focused into view. It's that damn radio! Ma"
        OutlineString 16, 6, 0, 1, "knocked it off the table when she ran from me, and it is close to"
        OutlineString 17, 6, 0, 1, "her head. A Zombie... getting spooked... Go figure..."

        PlayerWait 15, 11
        COLOR colr~&

    END IF
    GOTO PressAnyKey

END IF

IF (cmd$ = "EAT BRAINS" OR cmd$ = "EAT BILLY" OR cmd$ = "ATTACK" OR cmd$ = "ATTACK BILLY" OR cmd$ = "EAT") AND CurrentRoom = 12 THEN

    IF NPC_Billy > 0 THEN

        'PRINT "Billy say he glad to have brains eaten by zombie in a text adventure game."
        'LOCATE ZombieMessageY + 1, ZombieMessageX
        'PRINT "(PLEASE NOTE: NO CHILDREN WERE HARMED IN THE MAKING OF THIS GAME)"
        '      123456789012345678901234567890123456789012345678901234567890123456789012345678

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT BILLY'S BRAINS'"
        OutlineString 12, 6, 0, 1, "Sorry Billy... My son... Daddy can't control the urge to eat your "
        OutlineString 13, 6, 0, 1, "brains. 'It is ok daddy, if you need my brain, you can have it. I love"
        OutlineString 14, 6, 0, 1, "daddy.' Why God! Why do I need to eat my son! ('Yo daddy dude! Your"
        OutlineString 15, 6, 0, 1, "going a little over board with your zombie character. Chill it out"
        OutlineString 16, 6, 0, 1, "will ya!? On a side note, would you take me to get a hot fudge sundae"
        OutlineString 17, 6, 0, 1, "when we are done with this game?' [Sorry... Yeah, I'll take you.])"

        PlayerWait 15, 11
        COLOR colr~&

        NPC_Billy = 0
        Zombie_Health = Zombie_Health + 25
        IF Zombie_Health > Zombie_Health_Max THEN Zombie_Health = Zombie_Health_Max

    ELSE

        colr~& = _DEFAULTCOLOR

        DrawFillBox 1, 1, 80, 30, 0, 178
        DrawBox 4, 8, 77, 19, 12, 13, 219

        _PRINTMODE _KEEPBACKGROUND
        COLOR 12

        '                           1234567890123456789012345678901234567890123456789012345678901234567890
        OutlineString 10, 31, 0, 1, "'EAT BILLY'S BRAINS'"
        OutlineString 12, 6, 0, 1, "(Yo daddy dude! You ok? It's already been flagged that you ate brain!"
        OutlineString 13, 6, 0, 1, "There is nothing left for you to eat, at least not in this game"
        OutlineString 14, 6, 0, 1, "version. Wait... Are you messing with me? ... ... ... Oooooh..."
        OutlineString 15, 6, 0, 1, "daddy... This is the ghost of your dead son... Please move on... You"
        OutlineString 16, 6, 0, 1, "already took what you wanted... It's ok daddy dude... I forgive you"
        OutlineString 17, 6, 0, 1, "for needing to eat my brain...)"

        PlayerWait 15, 11
        COLOR colr~&

    END IF

    GOTO PressAnyKey

END IF


IF (cmd$ = "EXAMINE STICK") AND GotStick = 1 THEN

    'PRINT "My stick, it mine."

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 8, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 10, 31, 0, 1, "'EXAMINE STICK'"
    OutlineString 12, 6, 0, 1, "This is not an ordinary stick. It's a huge club that you can use to"
    OutlineString 13, 6, 0, 1, "whack people over the head with so it will be easier to eat them. It"
    OutlineString 14, 6, 0, 1, "is already cover with blood, so it has been used before. This club was"
    OutlineString 15, 6, 0, 1, "given to me by an old General I worked under before all this mess"
    OutlineString 16, 6, 0, 1, "happened. Why he gave it to me I have no idea, but I am glad I have it"
    OutlineString 17, 6, 0, 1, "as it has served me well."

    PlayerWait 15, 11
    COLOR colr~&

    GOTO PressAnyKey

END IF


IF (cmd$ = "EXAMINE MIRROR") AND CurrentRoom = 2 THEN

    'PRINT "Pretty mirror. Large mirror. From 1800's. Antique. Carved wood frame."
    'LOCATE ZombieMessageY + 1, ZombieMessageX
    'PRINT "There is crack."

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 8, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 10, 31, 0, 1, "'EXAMINE MIRROR'"
    OutlineString 12, 6, 0, 1, "My wife and I love antiques and this mirror called out to us when we"
    OutlineString 13, 6, 0, 1, "found it at a yard sale. The people gave it to us for such a cheap"
    OutlineString 14, 6, 0, 1, "price, and it appeared they where more than happy to get rid of it."
    OutlineString 15, 6, 0, 1, "The last comment they made as we took it away, was hope that we never"
    OutlineString 16, 6, 0, 1, "need to use, as all it does is bring bad things. How can this large"
    OutlineString 17, 6, 0, 1, "mirror from the 1800's, with an old carved wood frame cause trouble?"

    PlayerWait 15, 11
    COLOR colr~&

    GOTO PressAnyKey

END IF

IF (cmd$ = "LOOK IN MIRROR" OR cmd$ = "LOOK MIRROR") AND CurrentRoom = 2 THEN

    'PRINT "Me look good... For dead guy. Big hole in cheek. Missing chunks of hair."

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 8, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 10, 31, 0, 1, "'LOOK IN MIRROR'"
    OutlineString 12, 6, 0, 1, "Looking into the mirror makes me realize that I do not look much like"
    OutlineString 13, 6, 0, 1, "a zombie, but a little bit of makeup and I would pass for a living"
    OutlineString 14, 6, 0, 1, "human being. It appears the vaccine helps my body regenerate dead or"
    OutlineString 15, 6, 0, 1, "damaged parts, which is cool in its self. ... What the Himalayas? For"
    OutlineString 16, 6, 0, 1, "a moment, it looked like I was completely normal and I was screaming"
    OutlineString 17, 6, 0, 1, "for help. Maybe as a warning. My mind must be playing tricks on me."

    PlayerWait 15, 11
    COLOR colr~&

    GOTO PressAnyKey

END IF


IF cmd$ = "READ" OR cmd$ = "READ DATA" OR cmd$ = "READ ZOMBIE DATA" OR cmd$ = "GET" OR cmd$ = "GET DATA" OR cmd$ = "GET ZOMBIE DATA" THEN

    SELECT CASE CurrentRoom

        CASE 179

            IF Zombie_Data_Amount AND &H1 = 0 THEN

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 7, 77, 20, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 9, 31, 0, 1, "'ZOMBIE DATA #1 - In the Beginning'"
                OutlineString 11, 6, 0, 1, "After searching through the filing cabinet, I come across a large"
                OutlineString 12, 6, 0, 1, "folder that talks about a vaccine the scientists started working on"
                OutlineString 13, 6, 0, 1, "that was suppose to not only make people stronger, faster, and"
                OutlineString 14, 6, 0, 1, "smarter, it was suppose to help them regenerate body parts that died,"
                OutlineString 15, 6, 0, 1, "or were badly damaged, but there was an issue to get it to work with"
                OutlineString 16, 6, 0, 1, "the human body. It appears the vaccine came from an extraterrestrial"
                OutlineString 17, 7, 0, 1, "source found in a crashed shipped in the antartic. Apparently many"
                OutlineString 18, 7, 0, 1, "people died when this stuff was first found. There is a side note of"
                OutlineString 19, 7, 0, 1, "shape shifting abilities, but I can't understand the rest."

                PlayerWait 15, 11
                COLOR colr~&

                Zombie_Data_Amount = (Zombie_Data_Amount AND -1) OR 1

            ELSE

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 8, 77, 19, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 31, 0, 1, "'ZOMBIE DATA #1 - In the Beginning'"
                OutlineString 12, 6, 0, 1, "I searched through the filing cabinet some more, but I could not find"
                OutlineString 13, 6, 0, 1, "anything else that relates to the vaccine. The rest is just a bunch of"
                OutlineString 14, 6, 0, 1, "personal files, and military junk. They must be trying to hide the"
                OutlineString 15, 6, 0, 1, "files on the zombie data, so it would be hard for the wrong people to"
                OutlineString 16, 6, 0, 1, "find, especially if the base's self destruct sequence is activated. At"
                OutlineString 17, 6, 0, 1, "least I was given a long enough amount of time to collect them."

                PlayerWait 15, 11
                COLOR colr~&

            END IF

        CASE 180

            IF Zombie_Data_Amount AND &H2 = 0 THEN

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 8, 77, 19, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 24, 0, 1, "'ZOMBIE DATA #2 - The Troubles'"
                OutlineString 12, 6, 0, 1, "Boy they really try to make it hard to find the zombie data in this"
                OutlineString 13, 6, 0, 1, "vault. But I uncovered another file on this disease and it shows a"
                OutlineString 14, 6, 0, 1, "bunch chemical drawings, and all the issues they have had with their"
                OutlineString 15, 6, 0, 1, "test subjects. I am not a chemist, so I do not understand what I am"
                OutlineString 16, 6, 0, 1, "seeing. Maybe I can find someone who can use this data. I feel sad for"
                OutlineString 17, 6, 0, 1, "those people who had to suffer for the scientists research."

                PlayerWait 15, 11
                COLOR colr~&

                Zombie_Data_Amount = (Zombie_Data_Amount AND -2) OR 2

            ELSE

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 8, 77, 19, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 24, 0, 1, "'ZOMBIE DATA # - The Troubles'"
                OutlineString 12, 6, 0, 1, "I couldn't find any more data in this filing cabinet, but I can't stop"
                OutlineString 13, 6, 0, 1, "thinking of those poor souls who suffered, and wonder if they were"
                OutlineString 14, 6, 0, 1, "promised something big for their suffering. Thinking about it though,"
                OutlineString 15, 6, 0, 1, "I can't remember how or when I was infected. I was never bitten, nor"
                OutlineString 16, 6, 0, 1, "was I ever a test subject, at least not that I can remember. I can't"
                OutlineString 17, 6, 0, 1, "ask the General about it now, so I will inestigate it later."

                PlayerWait 15, 11
                COLOR colr~&

            END IF

        CASE 181

            IF Zombie_Data_Amount AND &H4 = 0 THEN

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 8, 77, 19, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 21, 0, 1, "'ZOMBIE DATA #3 - Short lived zombies'"
                OutlineString 12, 6, 0, 1, "Well the research I found in this filing cabinet talks about some poor"
                OutlineString 13, 6, 0, 1, "souls that turned into zombies, but quickly died. The reports state"
                OutlineString 14, 6, 0, 1, "there was a gene found that caused a conflict with the human biology"
                OutlineString 15, 6, 0, 1, "and attacked it like it was foreign matter. I realize now that they"
                OutlineString 16, 6, 0, 1, "are trying to convert an exterrestrial substance into something that"
                OutlineString 17, 6, 0, 1, "will be compatiable with the human body."

                PlayerWait 15, 11
                COLOR colr~&

                Zombie_Data_Amount = (Zombie_Data_Amount AND -4) OR 4

            ELSE

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 8, 77, 19, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 21, 0, 1, "'ZOMBIE DATA #3 - Short lived zombies'"
                OutlineString 12, 6, 0, 1, "There is nothing else to be found in this cabinet on the zombie virus,"
                OutlineString 13, 6, 0, 1, "so I need to move. Thinking about it, nothing I have read so far has"
                OutlineString 14, 6, 0, 1, "indicated anything close to what I am. The old man (super soldier) I"
                OutlineString 15, 6, 0, 1, "I came across in the sewer seemed to be more powerful that I am, so I"
                OutlineString 16, 6, 0, 1, "am sure I will find documentation on both of us if I keep searching. I"
                OutlineString 17, 6, 0, 1, "would love to find out how to cure this mess."

                PlayerWait 15, 11
                COLOR colr~&

            END IF

        CASE 182

            IF Zombie_Data_Amount AND &H8 = 0 THEN

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 8, 77, 19, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 23, 0, 1, "'ZOMBIE DATA #4 - The Dead Brain's'"
                OutlineString 12, 6, 0, 1, "In the file I just found talks about the scientist's success on making"
                OutlineString 13, 6, 0, 1, "virus more compatiable to the human body, but the results are still as"
                OutlineString 14, 6, 0, 1, "sad as before, except the people lose all important brain functions,"
                OutlineString 15, 6, 0, 1, "such as memory, intelligence, speech, understanding, and so forth. The"
                OutlineString 16, 6, 0, 1, "test subjects are so angry and try to attack anyone who comes close to"
                OutlineString 17, 6, 0, 1, "them."

                PlayerWait 15, 11
                COLOR colr~&

                Zombie_Data_Amount = (Zombie_Data_Amount AND -8) OR 8

            ELSE

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 8, 77, 19, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 31, 0, 1, "'ZOMBIE DATA #4 - The Dead Brain's'"
                OutlineString 12, 6, 0, 1, "As before, there is nothing else on the on the zombie disease, but I"
                OutlineString 13, 6, 0, 1, "came across some photos that appear to be from the antartic, and show"
                OutlineString 14, 6, 0, 1, "the crashed ship they found under the ice. What the... There are"
                OutlineString 15, 6, 0, 1, "photos of people transforming into ungodly things. I can stand looking"
                OutlineString 16, 6, 0, 1, "at these anymore, even as a zombie. I think something was released"
                OutlineString 17, 6, 0, 1, "when they entered the craft, but I don't care right now."

                PlayerWait 15, 11
                COLOR colr~&

            END IF

        CASE 183

            IF Zombie_Data_Amount AND &H10 = 0 THEN

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 8, 77, 19, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 23, 0, 1, "'ZOMBIE DATA #5 - The Singularity'"
                OutlineString 12, 6, 0, 1, "Well now... There are photos from inside the crashed ship, and there"
                OutlineString 13, 6, 0, 1, "are many of various objects, and machines, found in it. This file"
                OutlineString 14, 6, 0, 1, "appears to be mostly about a particular machine they found that needs"
                OutlineString 15, 6, 0, 1, "to be used with this substance. Some notes suggest that the virus must"
                OutlineString 16, 6, 0, 1, "be intertwined with the DNA of the subject being injected for it to"
                OutlineString 17, 6, 0, 1, "work. So this virus is a one-on-one strain. Intersting... Wait..."

                PlayerWait 15, 11
                COLOR colr~&

                Zombie_Data_Amount = (Zombie_Data_Amount AND -16) OR 16

            ELSE

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 8, 77, 19, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 23, 0, 1, "'ZOMBIE DATA #5 - The singularity'"
                OutlineString 12, 6, 0, 1, "Nothing else wsa found in re-searching the cabinet. But I bad feeling"
                OutlineString 13, 6, 0, 1, "has came over me, because I realize that I have been betrayed. They"
                OutlineString 14, 6, 0, 1, "somehow managed to get my DNA without me realizing it, and then"
                OutlineString 15, 6, 0, 1, "injected me with the new virus. So I guess I was a test subjected"
                OutlineString 16, 6, 0, 1, "after all, and not just some worker helping them out. Very sinister"
                OutlineString 17, 6, 0, 1, "people! Very sinister!"

                PlayerWait 15, 11
                COLOR colr~&

            END IF

        CASE 184

            IF Zombie_Data_Amount AND &H20 = 0 THEN

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 8, 77, 19, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 24, 0, 1, "'ZOMBIE DATA #6 - The Reasoning'"
                OutlineString 12, 6, 0, 1, "Woooaaa! This file contains images of strange symbols written all over"
                OutlineString 13, 6, 0, 1, "the crashed ship, along with what appears to be screenshots from some"
                OutlineString 14, 6, 0, 1, "display screens on the ship. Aaahhh... They were able to translate the"
                OutlineString 15, 6, 0, 1, "strange symbols into english, and there are documents that suggest the"
                OutlineString 16, 6, 0, 1, "virus was used by the travelers to substain life in their long journey"
                OutlineString 17, 6, 0, 1, "and to help protect them if something bad happens. Ok..."

                PlayerWait 15, 11
                COLOR colr~&

                Zombie_Data_Amount = (Zombie_Data_Amount AND -32) OR 32

            ELSE

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 8, 77, 19, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 24, 0, 1, "'ZOMBIE DATA #6 - The reasoning'"
                OutlineString 12, 6, 0, 1, "There is nothing else here, of course, but I read a little more of the"
                OutlineString 13, 6, 0, 1, "documents to see if there were any clues as to what happen to the"
                OutlineString 14, 6, 0, 1, "travelers, but there are suggestions that they were infected by some"
                OutlineString 15, 6, 0, 1, "foreign virus that caused them to mutate. The scientists state that"
                OutlineString 16, 6, 0, 1, "the substance they found was free of the foreign virus. Apparently"
                OutlineString 17, 6, 0, 1, "they found the foreign virus in the dead people at the antartic base."

                PlayerWait 15, 11
                COLOR colr~&

            END IF

        CASE 185

            IF Zombie_Data_Amount AND &H40 = 0 THEN

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 8, 77, 19, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 21, 0, 1, "'ZOMBIE DATA #7 - Close to Perfection'"
                OutlineString 12, 6, 0, 1, "These documents show where the scientists are close to perfection with"
                OutlineString 13, 6, 0, 1, "the virus. The last thing that seems to be standing in their way is it"
                OutlineString 14, 6, 0, 1, "causes the subject to slowly degrade to a mindless creature, full of"
                OutlineString 15, 6, 0, 1, "hatred. however, this can be remedied by injecting the subjects with a"
                OutlineString 16, 6, 0, 1, "generic vaccine, just like the one I had been using until I ran out a"
                OutlineString 17, 6, 0, 1, "week ago. That proves I was a test subject."

                PlayerWait 15, 11
                COLOR colr~&

                Zombie_Data_Amount = (Zombie_Data_Amount AND -64) OR 64

            ELSE

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 8, 77, 19, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 21, 0, 1, "'ZOMBIE DATA #7 - Close to Perfection'"
                OutlineString 12, 6, 0, 1, "On further inspection of the file in hand, I discovered something that"
                OutlineString 13, 6, 0, 1, "nearly caused me to drop the paperwork. In the midsts of the file I"
                OutlineString 14, 6, 0, 1, "not only found photos of my family and I, but all kinds of information"
                OutlineString 15, 6, 0, 1, "about us. Wooahh! The house was a freaking test! Pa, Joan, and Ma was"
                OutlineString 16, 6, 0, 1, "planted in the house, along with Billy, to see if my emotions could"
                OutlineString 17, 6, 0, 1, "prevent me from acting on my new instincts. They planned all this!"

                PlayerWait 15, 11
                COLOR colr~&

            END IF

        CASE 186

            IF Zombie_Data_Amount AND &H80 = 0 THEN

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 8, 77, 19, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 28, 0, 1, "'ZOMBIE DATA #8 - Other Locations'"
                OutlineString 12, 6, 0, 1, "There is no more information about the zombie disease, but I did find"
                OutlineString 13, 6, 0, 1, "a file that contains information about other locations that the virus"
                OutlineString 14, 6, 0, 1, "was sent to for further research. Apparently news got out that this"
                OutlineString 15, 6, 0, 1, "base was researching the zombie disease, and they felt it would"
                OutlineString 16, 6, 0, 1, "eventually be invaded. So the scientist was scattered to various"
                OutlineString 17, 6, 0, 1, "research facilities for further research."

                PlayerWait 15, 11
                COLOR colr~&

                Zombie_Data_Amount = (Zombie_Data_Amount AND -128) OR 128

            ELSE

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 8, 77, 19, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 28, 0, 1, "'ZOMBIE DATA #8 - Other Locations'"
                OutlineString 12, 6, 0, 1, "Well, time is running out, and this base is about to explode. I can"
                OutlineString 13, 6, 0, 1, "not spend any more time combing through the data I found, or these"
                OutlineString 14, 6, 0, 1, "filing cabinets. Now I must move on and collect all the vaccine that I"
                OutlineString 15, 6, 0, 1, "can. i have learned alot from all this research, but i need to get it"
                OutlineString 16, 6, 0, 1, "out of here, along with the zombie vaccine, so I can either study it"
                OutlineString 17, 6, 0, 1, "more, it get it to someone who can use it to find a cure."

                PlayerWait 15, 11
                COLOR colr~&

            END IF

    END SELECT

END IF


IF cmd$ = "GET" OR cmd$ = "GET VACCINE" THEN

    SELECT CASE CurrentRoom

        CASE 187

            IF Zombie_Vaccine_Amount AND -1 > 0 THEN

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 11, 77, 17, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 26, 0, 1, "'ZOMBIE VACCINE, BATCH #1'"
                OutlineString 12, 36, 0, 1, "I am collecting the first batch of the zombie vaccine."

                PlayerWait 15, 11
                COLOR colr~&

                Zombie_Vaccine_Amount = (Zombie_Vaccine_Amount AND -1) OR 1

            ELSE

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 11, 77, 17, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 21, 0, 1, "'ZOMBIE VACCINE, BATCH #1, COLLECTED'"
                OutlineString 12, 36, 0, 1, "The first batch of the zombie vaccine has been collected."

                PlayerWait 15, 11
                COLOR colr~&

            END IF

        CASE 188

            IF Zombie_Vaccine_Amount AND -2 > 0 THEN

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 11, 77, 17, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 26, 0, 1, "'ZOMBIE VACCINE, BATCH #2'"
                OutlineString 12, 36, 0, 1, "I am collecting the secone batch of the zombie vaccine."

                PlayerWait 15, 11
                COLOR colr~&

                Zombie_Vaccine_Amount = (Zombie_Vaccine_Amount AND -2) OR 2

            ELSE

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 11, 77, 17, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 21, 0, 1, "'ZOMBIE VACCINE, BATCH #2 - COLLECTED'"
                OutlineString 12, 36, 0, 1, "The second batch of the zombie vaccine has been collected."

                PlayerWait 15, 11
                COLOR colr~&

            END IF

        CASE 189

            IF Zombie_Vaccine_Amount AND -4 > 0 THEN

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 11, 77, 17, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 26, 0, 1, "'ZOMBIE VACCINE, BATCH #3'"
                OutlineString 12, 36, 0, 1, "I am collecting the third batch of the zombie vaccine."

                PlayerWait 15, 11
                COLOR colr~&

                Zombie_Vaccine_Amount = (Zombie_Vaccine_Amount AND -4) OR 4

            ELSE

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 11, 77, 17, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 21, 0, 1, "'ZOMBIE VACCINE, BATCH #3 - COLLECTED'"
                OutlineString 12, 36, 0, 1, "The third batch of the zombie vaccine has been collected."

                PlayerWait 15, 11
                COLOR colr~&

            END IF

        CASE 190

            IF Zombie_Vaccine_Amount AND -8 > 0 THEN

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 11, 77, 17, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 26, 0, 1, "'ZOMBIE VACCINE, BATCH #4'"
                OutlineString 12, 36, 0, 1, "I am collecting the fourth and last batch of the zombie vaccine."

                PlayerWait 15, 11
                COLOR colr~&

                Zombie_Vaccine_Amount = (Zombie_Vaccine_Amount AND -8) OR 8

            ELSE

                colr~& = _DEFAULTCOLOR

                DrawFillBox 1, 1, 80, 30, 0, 178
                DrawBox 4, 11, 77, 17, 12, 13, 219

                _PRINTMODE _KEEPBACKGROUND
                COLOR 12

                '                           1234567890123456789012345678901234567890123456789012345678901234567890
                OutlineString 10, 21, 0, 1, "'ZOMBIE VACCINE, BATCH #4 - COLLECTED'"
                OutlineString 12, 36, 0, 1, "The fourth and last batch of the zombie vaccine has been collected."

                PlayerWait 15, 11
                COLOR colr~&

            END IF


    END SELECT

END IF



IF (cmd$ = "READ SIGN" OR cmd$ = "READ") AND CurrentRoom = 53 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 8, 77, 19, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 10, 30, 0, 1, "'READ MILITARY SIGN'"
    OutlineString 12, 36, 0, 1, "WARNING"
    OutlineString 13, 33, 0, 1, "NO TRESPASSING"
    OutlineString 14, 30, 0, 1, "BEYOND THIS POINT"
    OutlineString 15, 32, 0, 1, "DEADLY FORCE IS"
    OutlineString 16, 35, 0, 1, "AUTHORIZED"
    OutlineString 17, 26, 0, 1, "---=== FORT HITCHCOCK ===---"

    PlayerWait 15, 11
    COLOR colr~&

END IF


IF (cmd$ = "GET" OR cmd$ = "GET BACKPACK" OR cmd$ = "GRAB" OR cmd$ = "GRAB BACKPACK") AND CurrentRoom = 11 THEN

    colr~& = _DEFAULTCOLOR

    DrawFillBox 1, 1, 80, 30, 0, 178
    DrawBox 4, 6, 77, 21, 12, 13, 219

    _PRINTMODE _KEEPBACKGROUND
    COLOR 12

    '                           1234567890123456789012345678901234567890123456789012345678901234567890
    OutlineString 8, 33, 0, 1, "'GET BACKPACK'"
    OutlineString 9, 6, 0, 1, "While passing through the house, I found a large backpack laying in"
    OutlineString 10, 6, 0, 1, "the living room floor. I don't know why a zombie (half-zombie thank-"
    OutlineString 11, 6, 0, 1, "you) needs a backpack, but since I still have some wits left, I think"
    OutlineString 12, 6, 0, 1, "will take it in case I need it for something. Besides, I could use it"
    OutlineString 13, 6, 0, 1, "to carry this heavy wooden stick (Caveman club if you ask me) that was"
    OutlineString 14, 6, 0, 1, "given to me by a General I use to work for before I became a zombie."

    OutlineString 16, 6, 0, 1, "Looking in the backpack, I found some makeup supplies, and it gives me"
    OutlineString 17, 6, 0, 1, "a really clever idea. I applied the makeup to my face, my neck, and my"
    OutlineString 18, 6, 0, 1, "arms to make me look more human. This should fool people enough to"
    OutlineString 19, 6, 0, 1, "think I am still one of them."


    PlayerWait 15, 11
    COLOR colr~&

    Has_BackPack = TRUE

END IF


' *** CREATE THE STICK/CLUB SYSTEM HERE


IF cmd$ = "SAVE" OR cmd$ = "SAVE GAME" THEN

    GameSaved = SaveGame

END IF

IF cmd$ = "LOAD" OR cmd$ = "LOAD GAME" THEN GameLoaded = LoadGame


EXIT SUB


' *** JUMP HERE WHEN PLAYER MOVES
moved:

RoomActionPerformed = 0

EXIT SUB


' *** JUMP HERE WHEN PLAYER NEEDS TO PRESS ANY KEY TO MOVE ON
PressAnyKey:


END SUB



' **************************************************************************************
' GRAB INPUT - FOR MAIN GAME PLAY ONLY
' **************************************************************************************
FUNCTION GrabInput$

DIM Palette_Temp2 AS STRING * 96

x = POS(0)
y = CSRLIN
maxwidth = _WIDTH - x
PCOPY 0, 1 'make a backup copy of the screen

MaxChars = 70

DO
    k = _KEYHIT
    i$ = INKEY$
LOOP UNTIL k = 0 AND INKEY$ = "" 'clear the keyboard buffer

CursorColor = 12
CursorLocation = LEN(UserInput$)
CursorTimer = 0

IF Zombie_Health > Zombie_Health_Max THEN Zombie_Health = Zombie_Health_Max

Palette_Temp2 = ConvertPaletteToString$(0)

StartLoop:

DO

    _LIMIT 30
    PCOPY 1, 0
    '_PUTIMAGE (dx1, dy1), 1, 0, (sx1, sy1)-(sx2, sy2)

    PulsateScreen Palette_Temp2

    IF CurrentRoom < 16 THEN
        IF _SNDPLAYING(Sound_House) = 0 THEN _SNDPLAY Sound_House
    ELSE
        IF _SNDPLAYING(Sound_Town) = 0 THEN _SNDPLAY Sound_Town
    END IF

    LOCATE y, x: PRINT UserInput$

    CursorRate = -(60 * SIN((CursorTimer * 10) * Degrees))
    CursorTimer = (CursorTimer + 1) MOD 36

    CursorX = (x + CursorLocation - 1) * 8 - 1
    CursorY = (y - 1) * 16

    'CIRCLE (CursorX + CursorRate, CursorY), 5, 14
    'PSET (CursorX + CursorRate, CursorY), 3

    IF CursorRate >= 0 THEN
        LINE (CursorX, CursorY)-(CursorX, CursorY + 16), CursorColor
        LINE (CursorX + 1, CursorY)-(CursorX + 1, CursorY + 16), CursorColor
        LINE (CursorX - 2, CursorY)-(CursorX + 3, CursorY), CursorColor
        LINE (CursorX - 2, CursorY + 1)-(CursorX + 3, CursorY + 1), CursorColor
        LINE (CursorX - 2, CursorY + 15)-(CursorX + 3, CursorY + 15), CursorColor
        LINE (CursorX - 2, CursorY + 16)-(CursorX + 3, CursorY + 16), CursorColor
    END IF

    k = _KEYHIT

    SELECT CASE k
        CASE 8 ' *** BackSpace
            IF CursorLocation > 0 THEN
                UserInput$ = LEFT$(UserInput$, CursorLocation - 1) + RIGHT$(UserInput$, LEN(UserInput$) - CursorLocation)
                CursorLocation = CursorLocation - 1
            END IF
            CursorTimer = 27

        CASE 21248 ' *** DEL
            IF CursorLocation < MaxChars THEN
                UserInput$ = LEFT$(UserInput$, CursorLocation) + RIGHT$(UserInput$, LEN(UserInput$) - CursorLocation - 1)
                'CursorLocation = CursorLocation - 1
            END IF
            CursorTimer = 27

        CASE 48 TO 57, 65 TO 90, 97 TO 122, 33, 35, 40, 41, 45
            IF LEN(UserInput$) < MaxChars THEN
                UserInput$ = LEFT$(UserInput$, CursorLocation) + UCASE$(CHR$(k)) + RIGHT$(UserInput$, LEN(UserInput$) - CursorLocation)
                CursorLocation = CursorLocation + 1
            END IF
            CursorTimer = 27

        CASE 32 ' *** Space
            IF CursorLocation > 0 AND LEN(UserInput$) < MaxChars THEN
                UserInput$ = LEFT$(UserInput$, CursorLocation) + UCASE$(CHR$(k)) + RIGHT$(UserInput$, LEN(UserInput$) - CursorLocation)
                CursorLocation = CursorLocation + 1
            END IF
            CursorTimer = 27

        CASE 19200 ' *** Left Arrow
            IF CursorLocation > 0 THEN
                CursorLocation = CursorLocation - 1
            END IF
            CursorTimer = 27

        CASE 19712 ' *** Right Arrow
            IF CursorLocation < LEN(UserInput$) THEN
                CursorLocation = CursorLocation + 1
            END IF
            CursorTimer = 27

        CASE 15104
            ShowHelp
            EXIT FUNCTION

        CASE 15360
            ShowInventory
            EXIT FUNCTION

        CASE 15616
            Credits
            EXIT FUNCTION

        CASE 16128
            GameSaved = SaveGame
            EXIT FUNCTION

        CASE 16384
            GameLoaded = LoadGame
            EXIT FUNCTION

    END SELECT

    _PRINTMODE _KEEPBACKGROUND

    IF Game_Timer_Started = TRUE THEN

        timerleft## = (DOOM - TIMER(0.001))
        Minutes_Left = timerleft## \ 60
        Seconds_Left = timerleft## MOD 60

        Timer_Box_StartX = 15
        Timer_Box_StartY = 449 '309 '35
        Timer_Box_EndX = 623
        Timer_Box_EndY = Timer_Box_StartY + 8
        Timer_Max_Width = Timer_Box_EndX - Timer_Box_StartX - 4

        Minutes_Width# = (Timer_Max_Width / (Game_Max_Minutes * 60)) * (Minutes_Left * 60 + Seconds_Left)
        Seconds_Width# = (Timer_Max_Width / 60) * Seconds_Left

        LINE (Timer_Box_StartX, Timer_Box_StartY)-(Timer_Box_EndX, Timer_Box_EndY), 0, BF
        LINE (Timer_Box_StartX + 3, Timer_Box_StartY + 3)-(Timer_Box_StartX + Timer_Max_Width + 1, Timer_Box_StartY + 7), 14, BF
        LINE (Timer_Box_StartX + 3, Timer_Box_StartY + 3)-(Timer_Box_StartX + Minutes_Width# + 3, Timer_Box_StartY + 5), 13, BF
        LINE (Timer_Box_StartX + 3, Timer_Box_StartY + 6)-(Timer_Box_StartX + Seconds_Width# + 3, Timer_Box_StartY + 7), 11, BF

        IF timerleft## <= 0 THEN
            MeltScreen 0, 1
            PlayerDoomed
        END IF

    END IF

    DrawHealthBar


    _DISPLAY


LOOP UNTIL k = 13

IF UserInput$ = "" THEN GOTO StartLoop

ConvertStringToPalette Palette_Temp2

GrabInput$ = UserInput$
_AUTODISPLAY
END FUNCTION


' **************************************************************************************
' GET LINE
' **************************************************************************************
FUNCTION GetLine$ (MaxChars, PreFilledText$)

x = POS(0)
y = CSRLIN
maxwidth = _WIDTH - x
PCOPY 0, 1 'make a backup copy of the screen

DO
    k = _KEYHIT
    i$ = INKEY$
LOOP UNTIL k = 0 AND INKEY$ = "" 'clear the keyboard buffer

UserInput$ = PreFilledText$

CursorColor = 15
CursorLocation = LEN(UserInput$)
CursorTimer = 0

DO
    _LIMIT 30
    PCOPY 1, 0
    LOCATE y, x: PRINT UserInput$;

    CursorRate = -(60 * SIN((CursorTimer * 10) * Degrees))
    CursorTimer = (CursorTimer + 1) MOD 36

    CursorX = (x + CursorLocation - 1) * 8 - 1
    CursorY = (y - 1) * 16

    'CIRCLE (CursorX + CursorRate, CursorY), 5, 14
    'PSET (CursorX + CursorRate, CursorY), 3

    IF CursorRate >= 0 THEN
        LINE (CursorX, CursorY)-(CursorX, CursorY + 16), CursorColor
        LINE (CursorX + 1, CursorY)-(CursorX + 1, CursorY + 16), CursorColor
        LINE (CursorX - 2, CursorY)-(CursorX + 3, CursorY), CursorColor
        LINE (CursorX - 2, CursorY + 1)-(CursorX + 3, CursorY + 1), CursorColor
        LINE (CursorX - 2, CursorY + 15)-(CursorX + 3, CursorY + 15), CursorColor
        LINE (CursorX - 2, CursorY + 16)-(CursorX + 3, CursorY + 16), CursorColor
    END IF

    k = _KEYHIT

    SELECT CASE k
        CASE 8 ' *** BackSpace
            IF CursorLocation > 0 THEN
                UserInput$ = LEFT$(UserInput$, CursorLocation - 1) + RIGHT$(UserInput$, LEN(UserInput$) - CursorLocation)
                CursorLocation = CursorLocation - 1
            END IF
            CursorTimer = 27

        CASE 21248 ' *** DEL
            IF CursorLocation < MaxChars THEN
                UserInput$ = LEFT$(UserInput$, CursorLocation) + RIGHT$(UserInput$, LEN(UserInput$) - CursorLocation - 1)
            END IF
            CursorTimer = 27

        CASE 48 TO 57, 65 TO 90, 97 TO 122, 33, 35, 40, 41, 45
            IF LEN(UserInput$) < MaxChars THEN
                UserInput$ = LEFT$(UserInput$, CursorLocation) + CHR$(k) + RIGHT$(UserInput$, LEN(UserInput$) - CursorLocation)
                CursorLocation = CursorLocation + 1
            END IF
            CursorTimer = 27

        CASE 27 ' *** ESC
            UserInput$ = ""
            EXIT FUNCTION

        CASE 32 ' *** Space
            IF CursorLocation > 0 AND LEN(UserInput$) < MaxChars THEN
                UserInput$ = LEFT$(UserInput$, CursorLocation) + CHR$(k) + RIGHT$(UserInput$, LEN(UserInput$) - CursorLocation)
                CursorLocation = CursorLocation + 1
            END IF
            CursorTimer = 27

        CASE 19200 ' *** Left Arrow
            IF CursorLocation > 0 THEN
                CursorLocation = CursorLocation - 1
            END IF
            CursorTimer = 27

        CASE 19712 ' *** Right Arrow
            IF CursorLocation < LEN(UserInput$) THEN
                CursorLocation = CursorLocation + 1
            END IF
            CursorTimer = 27

    END SELECT

    _DISPLAY

LOOP UNTIL k = 13

GetLine$ = UserInput$

'_AUTODISPLAY

END FUNCTION



' **************************************************************************************
' Pulsate Screen
' **************************************************************************************
SUB PulsateScreen (CurrentPalette AS STRING * 96)

Pulsating_Health_Size = 64
Adjusted_Zombie_Health = Zombie_Health_Max - Zombie_Health

IF Adjusted_Zombie_Health > Zombie_Health_Max - Pulsating_Health_Size THEN Pulsating_Health_Size = Zombie_Health_Max - Adjusted_Zombie_Health
IF Adjusted_Zombie_Health >= Zombie_Health_Max THEN Pulsating_Health_Size = 0

FadeAmount = Adjusted_Zombie_Health - ABS(-(Pulsating_Health_Size * SIN((TIMER(0.001) * 120) * Degrees)))
IF FadeAmount < 0 THEN FadeAmount = 0
FadePaletteStringToColor CurrentPalette, _RGB32(255, 0, 0), FadeAmount, 0

END SUB


' **************************************************************************************
' PLAYER WAIT
' **************************************************************************************
SUB PlayerWait (ForeGroundColor AS _BYTE, BackGroundColor AS _BYTE)

_PRINTMODE _FILLBACKGROUND

COLOR ForeGroundColor, BackGroundColor
LOCATE 30, 1: PRINT STRING$(80, 32);
LOCATE 30, 27: PRINT "PRESS ANY KEY TO CONTINUE";
LOCATE 1, 1

_DISPLAY
SLEEP

END SUB


' **************************************************************************************
' GET KEY
' **************************************************************************************
FUNCTION GetKey ()

DO
    k = _KEYHIT
    i$ = INKEY$
LOOP UNTIL k = 0 AND INKEY$ = "" 'clear the keyboard buffer

DO
    _LIMIT 30

    k = _KEYHIT


LOOP UNTIL k > 0 '= 13

GetKey = k

END FUNCTION


' **************************************************************************************
' CREATE GAME DATA FILE
' **************************************************************************************
SUB CreateGameDataFile ()

DIM GameEmptyData AS STRING

' *** SEE IF THE SAVE GAME FILE EXISTS
IF _FILEEXISTS(SaveGameFILE$) = 0 THEN

    ' *** FILE DOES NOT EXIST SO CREATE AND OPEN THE SAVE GAME DATA FILE
    OPEN SaveGameFILE$ FOR BINARY AS #1

    ' *** CREATE AN EMPTY STRING
    GameEmptyData = STRING$(SlotSize * MaxSlots, 0)

    ' *** CONVERT NAME SLOTS TO ALL SPACES
    FOR i = 1 TO MaxSlots
        NamePosition = (i - 1) * SlotSize + 1
        MID$(GameEmptyData, NamePosition, Len_SavedGameName) = SPACE$(Len_SavedGameName)
    NEXT

    ' *** STORE DEFAULT INFORMATION INTO THE SAVE GAME DATA FILE
    PUT #1, 1, GameEmptyData

    ' *** CLOSE IT
    CLOSE #1

END IF

END SUB


' **************************************************************************************
' DRAW BOX
' **************************************************************************************
SUB DrawBox (X1, Y1, X2, Y2, BorderColor1%, FillColor1%, BackgroundChar%%)

DrawFillBox X1, Y1, X2, Y2, FillColor1%, BackgroundChar%%

_PRINTMODE _KEEPBACKGROUND

COLOR BorderColor1%, 0

LOCATE Y1, X1: PRINT CHR$(201);
LOCATE Y2, X1: PRINT CHR$(200);
LOCATE Y1, X2: PRINT CHR$(187);
LOCATE Y2, X2: PRINT CHR$(188);
LOCATE Y1, X1 + 1: PRINT STRING$(X2 - X1 - 1, CHR$(205));
LOCATE Y2, X1 + 1: PRINT STRING$(X2 - X1 - 1, CHR$(205));

FOR y = Y1 + 1 TO Y2 - 1
    LOCATE y, X1: PRINT CHR$(186);
    LOCATE y, X2: PRINT CHR$(186);
NEXT

_PRINTMODE _FILLBACKGROUND

END SUB


' *****************************************************************************
' Draw Fill Box
' *****************************************************************************
SUB DrawFillBox (x1, y1, x2, y2, FillColor%, BackgroundChar%%)

COLOR FillColor%

FOR y = y1 TO y2
    LOCATE y, x1
    PRINT STRING$(x2 - x1 + 1, BackgroundChar%%);
NEXT

END SUB

' *****************************************************************************
' CONVERT PALETTE TO STRING
' *****************************************************************************
FUNCTION ConvertPaletteToString$ (Image&)

FOR I = 0 TO 15
    Colr~& = _PALETTECOLOR(I, Image&)
    Red$ = HEX$(_RED32(Colr~&)): IF LEN(Red$) = 1 THEN Red$ = "0" + Red$
    Green$ = HEX$(_GREEN32(Colr~&)): IF LEN(Green$) = 1 THEN Green$ = "0" + Green$
    Blue$ = HEX$(_BLUE32(Colr~&)): IF LEN(Blue$) = 1 THEN Blue$ = "0" + Blue$
    NewColor$ = NewColor$ + Red$ + Green$ + Blue$
NEXT

ConvertPaletteToString$ = NewColor$

END FUNCTION


' *****************************************************************************
' ADD PALETTE INDEX TO STRING
' *****************************************************************************
FUNCTION AddPaletteIndexToString$ (PaletteString AS STRING, ColorIndex AS _UNSIGNED _BYTE, Image&)

Colr~& = _PALETTECOLOR(ColorIndex, Image&)

Red$ = HEX$(_RED32(Colr~&)): IF LEN(Red$) = 1 THEN Red$ = "0" + Red$
Green$ = HEX$(_GREEN32(Colr~&)): IF LEN(Green$) = 1 THEN Green$ = "0" + Green$
Blue$ = HEX$(_BLUE32(Colr~&)): IF LEN(Blue$) = 1 THEN Blue$ = "0" + Blue$

MID$(PaletteString$, ColorIndex * 6 + 1, 6) = Red$ + Green$ + Blue$

AddPaletteIndexToString$ = PaletteString

END FUNCTION


' *****************************************************************************
' ADD COLOR TO PALETTE STRING
' *****************************************************************************
SUB AddColorToPaletteString (PaletteString AS STRING, ColorIndex AS _UNSIGNED _BYTE, NewColor AS _UNSIGNED LONG)

Red$ = HEX$(_RED32(NewColor)): IF LEN(Red$) = 1 THEN Red$ = "0" + Red$
Green$ = HEX$(_GREEN32(NewColor)): IF LEN(Green$) = 1 THEN Green$ = "0" + Green$
Blue$ = HEX$(_BLUE32(NewColor)): IF LEN(Blue$) = 1 THEN Blue$ = "0" + Blue$

MID$(PaletteString$, ColorIndex * 6 + 1, 6) = Red$ + Green$ + Blue$

END SUB


' *****************************************************************************
' REMOVE COLOR INDEX FROM STRING
' *****************************************************************************
FUNCTION RemoveColorIndexFromString$ (PaletteString AS STRING, ColorIndex AS _UNSIGNED _BYTE)

MID$(PaletteString$, ColorIndex * 6 + 1, 6) = SPACE$(6)

END FUNCTION

' *****************************************************************************
' CONVERT STRING TO PALETTE
' *****************************************************************************
SUB ConvertStringToPalette (PaletteString$)

FOR I = 0 TO 15

    IF LTRIM$(RTRIM$(MID$(PaletteString$, ColorIndex * 6 + 1, 6))) <> "" THEN
        Colr~& = VAL("&H" + MID$(PaletteString$, I * 6 + 1, 6))
        _PALETTECOLOR I, Colr~&
    END IF

NEXT

END SUB


' *****************************************************************************
' FADE PALETTE COLOR TO COLOR
' *****************************************************************************
SUB FadePaletteColorToColor (PaletteString AS STRING, PaletteIndex AS _BYTE, FadeToColor AS _UNSIGNED LONG, FadeAmount AS _UNSIGNED _BYTE)

FadeColor_Red = _RED32(FadeToColor)
FadeColor_Green = _GREEN32(FadeToColor)
FadeColor_Blue = _BLUE32(FadeToColor)


IF LTRIM$(RTRIM$(MID$(PaletteString, PaletteIndex * 6 + 1, 6))) <> "" THEN

    PaletteColor~& = VAL("&H" + MID$(PaletteString, PaletteIndex * 6 + 1, 6))

    NewColor_Red = _RED32(PaletteColor~&) + INT(((FadeColor_Red - _RED32(PaletteColor~&)) / 255) * FadeAmount)
    NewColor_Green = _GREEN32(PaletteColor~&) + INT(((FadeColor_Green - _GREEN32(PaletteColor~&)) / 255) * FadeAmount)
    NewColor_Blue = _BLUE32(PaletteColor~&) + INT(((FadeColor_Blue - _BLUE32(PaletteColor~&)) / 255) * FadeAmount)

    _PALETTECOLOR PaletteIndex, _RGB32(NewColor_Red, NewColor_Green, NewColor_Blue)

END IF


END SUB



' *****************************************************************************
' FADE PALETTE STRING TO COLOR
' *****************************************************************************
SUB FadePaletteStringToColor (PaletteString AS STRING, FadeToColor AS _UNSIGNED LONG, FadeAmount, Image AS LONG)

FadeColor_Red = _RED32(FadeToColor)
FadeColor_Green = _GREEN32(FadeToColor)
FadeColor_Blue = _BLUE32(FadeToColor)

FOR ColorIndex = 0 TO 15

    IF LTRIM$(RTRIM$(MID$(PaletteString, ColorIndex * 6 + 1, 6))) <> "" THEN

        PaletteColor~& = VAL("&H" + MID$(PaletteString, ColorIndex * 6 + 1, 6))

        NewColor_Red = _RED32(PaletteColor~&) + INT(((FadeColor_Red - _RED32(PaletteColor~&)) / 255) * FadeAmount)
        NewColor_Green = _GREEN32(PaletteColor~&) + INT(((FadeColor_Green - _GREEN32(PaletteColor~&)) / 255) * FadeAmount)
        NewColor_Blue = _BLUE32(PaletteColor~&) + INT(((FadeColor_Blue - _BLUE32(PaletteColor~&)) / 255) * FadeAmount)

        _PALETTECOLOR ColorIndex, _RGB32(NewColor_Red, NewColor_Green, NewColor_Blue)

    END IF

NEXT

END SUB


' *****************************************************************************
' OUTLINE STRING
' *****************************************************************************
SUB OutlineString (y AS INTEGER, x AS INTEGER, OutlineColor AS LONG, OutlineSize AS _UNSIGNED _BYTE, Text AS STRING)

OriginalColor& = _DEFAULTCOLOR
COLOR OutlineColor

FOR y1 = -OutlineSize TO OutlineSize
    FOR x1 = -OutlineSize TO OutlineSize
        _PRINTSTRING (((x - 1) * 8) + x1, ((y - 1) * 16) + y1), Text
    NEXT
NEXT

COLOR OriginalColor&

_PRINTSTRING ((x - 1) * 8, (y - 1) * 16), Text

END SUB


' *****************************************************************************
' MELT SCREEN
' *****************************************************************************
SUB MeltScreen (Source AS _UNSIGNED LONG, Destination AS _UNSIGNED LONG)

SliceSize = 2
NumOfSlices = 640 / SliceSize '160

DIM MeltingSlices(NumOfSlices - 1) AS DOUBLE
DIM SliceYPositions(NumOfSlices - 1) AS DOUBLE

' *** SAVE A COPY OF THE CURRENT SCREEN
PCOPY Source, Destination

'
FOR Slice = 0 TO NumOfSlices - 1
    MeltingSlices(Slice) = 0
    SliceYPositions(Slice) = 0
NEXT

COLOR 14, 0

DO
    _LIMIT 60
    CLS

    SliceFinished = 0

    FOR Slice = 0 TO NumOfSlices - 1
        dx1 = Slice * SliceSize
        dy1 = SliceYPositions(Slice)
        sx1 = dx1
        sy1 = 0
        sx2 = sx1 + SliceSize - 1
        sy2 = 479

        _PUTIMAGE (dx1, dy1), 1, 0, (sx1, sy1)-(sx2, sy2)

        IF Slice / 2 = INT(Slice / 2) THEN
            SliceYPositions(Slice) = SliceYPositions(Slice) + MeltingSlices(Slice)
        ELSE
            SliceYPositions(Slice) = SliceYPositions(Slice) - MeltingSlices(Slice)
        END IF

        MeltingSlices(Slice) = RND * 8 + 3
        IF SliceYPositions(Slice) > 510 OR SliceYPositions(Slice) < -510 THEN SliceFinished = SliceFinished + 1
    NEXT

    _DISPLAY

    IF SliceFinished = NumOfSlices THEN EXIT DO

LOOP
END SUB


' **************************************************************************************
' DRAW HEALTH BAR
' **************************************************************************************
SUB DrawHealthBar ()

' *** SAVE CURRENT TEXT COLOR SO WE CAN DRAW THE HEALTH BLOCKS IN A DIFFERENT ONE
Colr_Temp~& = _DEFAULTCOLOR

COLOR 15

OutlineString 1, 11, 1, 1, STR$(Zombie_Health) + " /" + STR$(Zombie_Health_Max) + " (" + LTRIM$(STR$(Zombie_Health_Percentage)) + "%)"

' *** DRAW HEALTH METER BAR
Health_Blocks = ((1 / Zombie_Health_Max) * Zombie_Health) * Health_Blocks_Max
HealthBar$ = STRING$(Health_Blocks, 176)

OutlineString 2, 3, 1, 1, "Health: ["
OutlineString 2, 12 + LEN(HealthBar$), 1, 1, STRING$(Health_Blocks_Max - Health_Blocks, 240) + "]"

ThirdHealth = INT(Zombie_Health_Max / 3)
IF Zombie_Health <= ThirdHealth THEN COLOR 14
IF Zombie_Health > ThirdHealth AND Zombie_Health < ThirdHealth * 2 THEN COLOR 15
IF Zombie_Health >= ThirdHealth * 2 THEN COLOR 12

OutlineString 2, 12, 1, 1, HealthBar$

' *** RESET THE CURRENT TEXT COLOR WITH THE ORIGINAL ONE WE DEFINED FOR THE HEALTH BAR
COLOR Colr_Temp~&

END SUB


' **************************************************************************************
' PLAYER WINS
' **************************************************************************************
SUB PlayerWins

ConvertStringToPalette Palette_EndingScreen

IF _SNDPLAYING(Sound_House) = 0 THEN
    _SNDSTOP Sound_House
END IF

IF _SNDPLAYING(Sound_Town) = 0 THEN
    _SNDSTOP Sound_Town
END IF

CLS

_PUTIMAGE (0, 0), Img_Ending, 0, (0, 0)-(639, 479)

_PRINTMODE _KEEPBACKGROUND

'DrawBox (X1, Y1, X2, Y2, BorderColor1%, FillColor1%, BackgroundChar%%)
DrawBox 6, 3, 74, 22, 12, 13, 177

_PRINTMODE _KEEPBACKGROUND
COLOR 15

OutlineString 5, 9, 0, 1, "MY JOURNEY IN THIS TOWN HAS ENDETH, THANK YOU FOR PLAYING AS ME"
OutlineString 7, 9, 0, 1, "The world around burns bright with the fires of death and ruin."
OutlineString 8, 9, 0, 1, "You are alone, in a town to which that was once full with life,"
OutlineString 9, 9, 0, 1, "and now you must go on. For your journey is not quite over yet."

COLOR 10
OutlineString 11, 9, 0, 1, "BODY COUNT:"

IF NPC_Pa = 0 THEN Body_Count = Body_Count + 1
IF NPC_Joan = 0 THEN Body_Count = Body_Count + 1
IF NPC_Billy = 0 THEN Body_Count = Body_Count + 1
IF NPC_Ma = 0 THEN Body_Count = Body_Count + 1
IF NPC_OldMan = 0 THEN Body_Count = Body_Count + 1
IF NPC_Woman = 0 THEN Body_Count = Body_Count + 1
IF NPC_Teen = 0 THEN Body_Count = Body_Count + 1
IF NPC_Soldier = 0 THEN Body_Count = Body_Count + 1
IF NPC_Pilot = 0 THEN Body_Count = Body_Count + 1
IF NPC_Man = 0 THEN Body_Count = Body_Count + 1
IF NPC_Cop = 0 THEN Body_Count = Body_Count + 1
IF NPC_Doctor = 0 THEN Body_Count = Body_Count + 1
IF NPC_Nurse = 0 THEN Body_Count = Body_Count + 1
IF NPC_Coward = 0 THEN Body_Count = Body_Count + 1
IF NPC_Lady = 0 THEN Body_Count = Body_Count + 1
IF NPC_Kid = 0 THEN Body_Count = Body_Count + 1
IF NPC_Driver = 0 THEN Body_Count = Body_Count + 1
IF NPC_General = 0 THEN Body_Count = Body_Count + 1

OutlineString 11, 20, 0, 1, STR$(Body_Count) + " / 18"

SELECT CASE Body_Count

    CASE IS < 4

        Personality$ = "Savour of the People"

    CASE IS < 10

        Personality$ = "Serial Killer"

    CASE IS < 14

        Personality$ = "Destroyer of the Damned"

    CASE IS < 18

        Personality$ = "Force to be reckoned with"

    CASE IS = 18

        Personality$ = "Eradicator of the Living!"

END SELECT

OutlineString 11, 29, 0, 1, "- " + Personality$

IF NPC_Pa = 0 THEN COLOR 14: ELSE COLOR 12
OutlineString 13, 11, 0, 1, "PA (Prisoner)"

IF NPC_Joan = 0 THEN COLOR 14: ELSE COLOR 12
OutlineString 14, 11, 0, 1, "Joan"

IF NPC_Billy = 0 THEN COLOR 14: ELSE COLOR 12
OutlineString 15, 11, 0, 1, "Billy"

IF NPC_Ma = 0 THEN COLOR 14: ELSE COLOR 12
OutlineString 16, 11, 0, 1, "Ma"

IF NPC_OldMan = 0 THEN COLOR 14: ELSE COLOR 12
OutlineString 17, 11, 0, 1, "Old Man"

IF NPC_Woman = 0 THEN COLOR 14: ELSE COLOR 12
OutlineString 13, 27, 0, 1, "Woman"

IF NPC_Teen = 0 THEN COLOR 14: ELSE COLOR 12
OutlineString 14, 27, 0, 1, "Teen"

IF NPC_Soldier = 0 THEN COLOR 14: ELSE COLOR 12
OutlineString 15, 27, 0, 1, "Soldier"

IF NPC_Pilot = 0 THEN COLOR 14: ELSE COLOR 12
OutlineString 16, 27, 0, 1, "Pilot"

IF NPC_Man = 0 THEN COLOR 14: ELSE COLOR 12
OutlineString 17, 27, 0, 1, "Man (Super Soldier)"

IF NPC_Cop = 0 THEN COLOR 14: ELSE COLOR 12
OutlineString 13, 50, 0, 1, "Cop"

IF NPC_Doctor = 0 THEN COLOR 14: ELSE COLOR 12
OutlineString 14, 50, 0, 1, "Doctor"

IF NPC_Nurse = 0 THEN COLOR 14: ELSE COLOR 12
OutlineString 15, 50, 0, 1, "Nurse"

IF NPC_Coward = 0 THEN COLOR 14: ELSE COLOR 12
OutlineString 16, 50, 0, 1, "Coward"

IF NPC_Lady = 0 THEN COLOR 14: ELSE COLOR 12
OutlineString 17, 50, 0, 1, "Lady"

IF NPC_Kid = 0 THEN COLOR 14: ELSE COLOR 12
OutlineString 13, 61, 0, 1, "Kid"

IF NPC_Driver = 0 THEN COLOR 14: ELSE COLOR 12
OutlineString 14, 61, 0, 1, "Driver"

IF NPC_General = 0 THEN COLOR 14: ELSE COLOR 12
OutlineString 15, 61, 0, 1, "General"

COLOR 10

ZData_Count = 0
ZData_Value = 1

FOR i = 1 TO 8
    IF Zombie_Data_Amount AND ZData_Value > 0 THEN ZData_Count = ZData_Count + 1
    ZData_Value = ZData_Value * 2
NEXT

ZVaccine_Count = 0
ZVaccine_Value = 1

FOR i = 1 TO 8
    IF Zombie_Vaccine_Amount AND ZVaccine_Value > 0 THEN ZVaccine_Count = ZVaccine_Count + 1
    ZVaccine_Value = ZVaccine_Value * 2
NEXT

OutlineString 19, 9, 0, 1, "Zombie Data Collected: " + LTRIM$(STR$(ZData_Count)) + " Folders / 8 Folders (3" + CHR$(34) + " thick folders)"
OutlineString 20, 9, 0, 1, "Zombie Vaccine Collected: " + LTRIM$(STR$(ZVaccine_Count)) + " Cases / 4 Cases (800 Vials Per Case)"

_PRINTMODE _FILLBACKGROUND

COLOR 15, 11
LOCATE 30, 1: PRINT STRING$(80, 32);
LOCATE 30, 23: PRINT "PRESS ANY KEY TO END YOUR JOURNEY";

_DISPLAY

DO
    _LIMIT 30
    k = _KEYHIT
    IF _SNDPLAYING(Sound_Ending) = 0 THEN _SNDPLAY Sound_Ending

LOOP UNTIL k > 12

SYSTEM

END SUB


' **************************************************************************************
' PLAYER DIES
' **************************************************************************************
SUB PlayerDies

_SNDSTOP Sound_House
_SNDSTOP Sound_Town
_SNDSTOP Sound_Main

ConvertStringToPalette Palette_Original
FadePaletteStringToColor Palette_Original, _RGB32(0, 0, 0), 255, 0

COLOR 0, 0
CLS

_PRINTMODE _KEEPBACKGROUND

'DrawBox (X1, Y1, X2, Y2, BorderColor1%, FillColor1%, BackgroundChar%%)
DrawBox 7, 11, 74, 20, 12, 4, 177

_PRINTMODE _KEEPBACKGROUND
COLOR 14

OutlineString 12, 11, 0, 1, "ME JOURNEY...IT'S OVER! I UNABLE TO FIND CURE FOR ILLNESS!"
OutlineString 14, 9, 0, 1, "This disease has really affected what brains I had left, which"
OutlineString 15, 9, 0, 1, "caused me to get killed... again. This time for good. I know"
OutlineString 16, 9, 0, 1, "there was a cure for this disease where I use to work, but I"
OutlineString 17, 9, 0, 1, "will never know. What's that? A beautiful light! My friends! My"
OutlineString 18, 9, 0, 1, "family! Must be the zombie disease acting up causing me to"
OutlineString 19, 9, 0, 1, "hallucinate while I die. Maybe?"
'                           12345678901234567890123456789012345678901234567890123456789012345

_PRINTMODE _FILLBACKGROUND

COLOR 14, 1
LOCATE 30, 1: PRINT STRING$(80, 32);
LOCATE 30, 23: PRINT "PRESS ANY KEY TO END YOUR JOURNEY";

FOR Colr = 255 TO 0 STEP -4
    _LIMIT 30
    FadePaletteStringToColor Palette_Original, _RGB32(0, 0, 0), Colr, 0
    _DISPLAY
NEXT

SLEEP

MeltScreen 0, 1

SYSTEM

END SUB


' **************************************************************************************
' Player Doomed
' **************************************************************************************
SUB PlayerDoomed

_SNDSTOP Sound_House
_SNDSTOP Sound_Town
_SNDSTOP Sound_Main

ConvertStringToPalette Palette_Original
FadePaletteStringToColor Palette_Original, _RGB32(0, 0, 0), 255, 0

COLOR 0, 0
CLS

_PRINTMODE _KEEPBACKGROUND

'DrawBox (X1, Y1, X2, Y2, BorderColor1%, FillColor1%, BackgroundChar%%)

SELECT CASE CurrentRoom

    CASE IS < 178

        DrawBox 6, 11, 74, 20, 12, 4, 177

        _PRINTMODE _KEEPBACKGROUND
        COLOR 14

        OutlineString 13, 16, 0, 1, "GRRR... SUPER SOLDIERS... FOUND ME... MY BRAINS!!!"
        OutlineString 15, 9, 0, 1, "While I was lolly-gagging around in this area, some Super"
        OutlineString 16, 9, 0, 1, "soldiers marched into town and found survivors, whom told them"
        OutlineString 17, 9, 0, 1, "about a single zombie roaming the area. If I had moved a little"
        OutlineString 18, 9, 0, 1, "faster on my journey, I would not be sleeping with the worms."
        '                           1234567890123456789012345678901234567890123456789012345678901234567890

    CASE IS > 178

        DrawBox 4, 8, 77, 22, 12, 4, 177

        _PRINTMODE _KEEPBACKGROUND
        COLOR 14

        OutlineString 10, 22, 0, 1, "YOU WERE KILLED BY A NUCLEAR BLAST!"
        OutlineString 12, 6, 0, 1, "Due to the secret nature of research in the facilities of the military"
        OutlineString 13, 6, 0, 1, "base, a contengency plan was implemented in case the base was over"
        OutlineString 14, 6, 0, 1, "taken by some outside force. Once you entered the vault, the General"
        OutlineString 15, 6, 0, 1, "initiated the self-destruct sequence, but you did leave in time and"
        OutlineString 16, 6, 0, 1, "you vaporized with the rest of the base. All hope is lost in saving"
        OutlineString 17, 6, 0, 1, "the world from the zombie apocolypse! Oh well... Just because you"
        OutlineString 18, 6, 0, 1, "are infected with the zombie disease doesn't mean you are a slow"
        OutlineString 19, 6, 0, 1, "moving one! Jeeze! You need to get some fire up under you and move"
        OutlineString 20, 6, 0, 1, "much faster next time! ZOMBIES! I SWARE! MINDLESS FREAKS!"


        '                           1234567890123456789012345678901234567890123456789012345678901234567890

END SELECT

_PRINTMODE _FILLBACKGROUND

COLOR 14, 1
LOCATE 30, 1: PRINT STRING$(80, 32);
LOCATE 30, 23: PRINT "PRESS ANY KEY TO END YOUR JOURNEY";

FOR Colr = 255 TO 0 STEP -4
    _LIMIT 30
    FadePaletteStringToColor Palette_Original, _RGB32(0, 0, 0), Colr, 0
    _DISPLAY
NEXT

SLEEP

MeltScreen 0, 1

SYSTEM

END SUB



' **************************************************************************************
' SHOW INVENTORY
' **************************************************************************************
SUB ShowInventory ()

'MeltScreen 0, 1

Palette_Temp$ = ConvertPaletteToString$(0)

COLOR 0, 0
CLS

ConvertStringToPalette Palette_Original

DrawBox 3, 2, 78, 29, 3, 1, 176
DrawBox 5, 3, 76, 8, 11, 3, 178 '10, 9, 178

_PRINTMODE _KEEPBACKGROUND

COLOR 14, 0
LOCATE 5, 19: PRINT "INVENTORY: SEE WHAT ITEMS YOU ARE CARRYING"
LOCATE 6, 14: PRINT "---=== IF YOU DON'T SEE IT, YOU DON'T HAVE IT ==---"
LOCATE 26, 15: PRINT "THE CLOCK IS STILL TICKING AND TIME IS RUNNING OUT!"
LOCATE 27, 14: PRINT "YOU BETTER GET BACK TO THE GAME.";
COLOR 9, 0: PRINT "  HINT: PRESS ANY KEY";

COLOR 11, 0: LOCATE 10, 7: PRINT "ITEM NAME";
COLOR 10, 0: LOCATE 10, 23: PRINT "ITEM DESCRIPTION";
COLOR 11, 0: LOCATE 11, 7: PRINT STRING$(14, "-");
COLOR 10, 0: LOCATE 11, 23: PRINT STRING$(52, "-");

COLOR 11, 0: LOCATE 13, 7: PRINT "STICK"
COLOR 10, 0: LOCATE 13, 23: PRINT "A pointy stick you took from an old man."

_DISPLAY
SLEEP

MeltScreen 0, 1

ConvertStringToPalette Palette_Temp$

END SUB


' **************************************************************************************
' SHOW HELP
' **************************************************************************************
SUB ShowHelp ()

Palette_Temp$ = ConvertPaletteToString$(0)
Palette_Original_Modified$ = Palette_Original
AddColorToPaletteString Palette_Original_Modified$, 2, _RGB32(0, 50, 0)

ConvertStringToPalette Palette_Original_Modified$

COLOR 0, 0
CLS

DrawBox 3, 2, 78, 29, 3, 1, 176
DrawBox 5, 3, 76, 8, 11, 3, 178

_PRINTMODE _KEEPBACKGROUND

COLOR 14
OutlineString 5, 23, 0, 1, "HELP SYSTEM: LIST OF IN GAME COMMANDS"
OutlineString 6, 8, 0, 1, "---== THESE DO NOT INCLUDE ANY OBJECTS, ITEMS, OR CHARACTERS ==---"

COLOR 14
OutlineString 26, 15, 0, 1, "THE CLOCK IS STILL TICKING AND TIME IS RUNNING OUT!"
OutlineString 27, 14, 0, 1, "YOU BETTER GET BACK TO THE GAME."
COLOR 9, 0
OutlineString 27, 47, 0, 1, "HINT: PRESS ANY KEY"

COLOR 11, 0: LOCATE 11, 9: PRINT "END THE GAME . . . ";
COLOR 10, 0: PRINT "END, EXIT, Q, QUIT"

COLOR 11, 0: LOCATE 13, 9: PRINT "GET HELP . . . . . ";
COLOR 10, 0: PRINT "H, HELP, ?"

COLOR 11, 0: LOCATE 15, 9: PRINT "DIRECTIONS . . . . ";
COLOR 10, 0: PRINT "N, NORTH, E, EAST, W, WEST, S, SOUTH"

COLOR 11, 0: LOCATE 17, 9: PRINT "INVENTORY  . . . . ";
COLOR 10, 0: PRINT "I, INV, INVENTORY, ITEMS"

COLOR 11, 0: LOCATE 19, 9: PRINT "OTHERS . . . . . . ";
COLOR 10, 0: PRINT "EXAMINE, TALK, TAKE, EAT, LOOK, SAVE, LOAD"
LOCATE 20, 28: PRINT "ATTACK"

COLOR 13
OutlineString 23, 9, 0, 1, "PLEASE NOTE: THIS GAME ONLY ACCEPTS SINGLE COMMANDS AT THIS TIME"
OutlineString 24, 6, 0, 1, "THIS MAY CHANGE IN FURTURE VERSIONS. THIS WAS DONE FOR FAST PRODUCTION"
'                            12345678901234567890123456789012345678901234567890123456789012345678901234567890
_DISPLAY
SLEEP

MeltScreen 0, 1

ConvertStringToPalette Palette_Temp$

END SUB


' **************************************************************************************
' Popup Message
' **************************************************************************************
SUB PopupMessage (Message$)

REDIM Lines$(-1)


END SUB



' **************************************************************************************
' CREDITS
' **************************************************************************************
SUB Credits

Palette_Temp$ = ConvertPaletteToString$(0)

ConvertStringToPalette Palette_Credits

_SNDSTOP Sound_House
_SNDSTOP Sound_Town
_SNDSTOP Sound_Main
IF _SNDPLAYING(Sound_Credits) = 0 THEN _SNDPLAY Sound_Credits

_DEST 0
_SOURCE 0

_PUTIMAGE (0, 0), Img_Credits, 0, (0, 0)-(639, 479)

_PRINTMODE _KEEPBACKGROUND

'DrawBox (X1, Y1, X2, Y2, BorderColor1%, FillColor1%, BackgroundChar%%)
DrawBox 4, 2, 77, 28, 12, 13, 177

_PRINTMODE _KEEPBACKGROUND

COLOR 15
OutlineString 4, 37, 11, 2, "CREDITS"

COLOR 14: OutlineString 7, 7, 0, 1, "Main Screen Image:"
COLOR 12: OutlineString 7, 27, 0, 1, "abstract.desktopnexus.com/wallpaper/92738/"
COLOR 14: OutlineString 9, 7, 0, 1, "Credits Screen Image:"
COLOR 12: OutlineString 9, 29, 0, 1, "http://abstract.desktopnexus.com/get/1217358?t="
COLOR 12: OutlineString 10, 29, 0, 1, "ml89h45gdh8h17v71mraldmja7562c609acc922"
COLOR 14: OutlineString 12, 7, 0, 1, "House Image:"
COLOR 12: OutlineString 12, 20, 0, 1, "http://wall.alphacoders.com/big.php?i=238457"
COLOR 14: OutlineString 14, 7, 0, 1, "Ending Image:"
COLOR 12: OutlineString 14, 21, 0, 1, "http://wallpaperswide.com/graveyard-wallpapers.html"
COLOR 14: OutlineString 16, 7, 0, 1, "Town Image:"
COLOR 12: OutlineString 16, 19, 0, 1, "http://gallery.yopriceville.com/var/albums/Backgrounds/Ha"
COLOR 12: OutlineString 17, 19, 0, 1, "lloween_Graveyard_City_Background.jpg?m=1399676400"
COLOR 14: OutlineString 19, 7, 0, 1, "Music licensed by:"
COLOR 12: OutlineString 19, 26, 0, 1, "Kevin MacLeod (incompetech.com) and licensed under"
COLOR 14: OutlineString 20, 7, 0, 1, "Creative Commons:"
COLOR 12: OutlineString 20, 25, 0, 1, "By Attribution 3.0"
COLOR 12: OutlineString 21, 25, 0, 1, "http://createcommons.org/licenses/by/3.0/"
COLOR 14: OutlineString 22, 7, 0, 1, "Kevin MacLeod's Music:"
COLOR 12: OutlineString 22, 30, 0, 1, "'Evening of Chaos', 'Feelin Good', "
COLOR 12: OutlineString 23, 7, 0, 1, "'This House', 'Ossuary 1 - A Beginning', and 'Danger Storm'"
'                                     1234567890123456789012345678901234567890123456789012345678901234567890

_PRINTMODE _FILLBACKGROUND

COLOR 15, 11
LOCATE 30, 1: PRINT STRING$(80, 32);
LOCATE 30, 27: PRINT "PRESS ANY KEY TO CONTINUE";

FOR Colr = 255 TO 0 STEP -4
    _LIMIT 30
    FadePaletteStringToColor Palette_Credits, _RGB32(0, 0, 0), Colr, 0
    _DISPLAY
NEXT
FadePaletteStringToColor Palette_Credits, _RGB32(0, 0, 0), 0, 0


k = _KEYHIT
DO
    k = _KEYHIT
    IF _SNDPLAYING(Sound_Credits) = 0 THEN _SNDPLAY Sound_Credits
LOOP WHILE k = 0
k = _KEYHIT

MeltScreen 0, 1

_SNDSTOP Sound_Credits
ConvertStringToPalette Palette_Temp$

END SUB


' **************************************************************************************
' SAVE GAME
' **************************************************************************************
FUNCTION SaveGame ()

DIM SavedGameName(MaxSlots) AS STRING '* LEN_SAVEDGAMENAME
DIM SavedGameNameTemp AS STRING * LEN_SAVEDGAMENAME

_SNDSTOP Sound_House
_SNDSTOP Sound_Town
_SNDSTOP Sound_Main

Palette_Temp$ = ConvertPaletteToString$(0)

ConvertStringToPalette Palette_SaveScreen

' *** GET REMAINING TIME
RemainingTime = DOOM - TIMER(0.001)

' *** OPEN THE SAVE GAME DATA FILE
OPEN SaveGameFILE$ FOR BINARY AS #1

' *** READ ALL GAME NAMES STORED IN EACH SLOT
FOR slot = 1 TO MaxSlots
    GET #1, SlotSize * (slot - 1) + 1, SavedGameNameTemp
    SavedGameName$(slot - 1) = RTRIM$(LTRIM$(SavedGameNameTemp))
NEXT


DrawScreen:

COLOR 0, 0
CLS

DrawBox 3, 2, 78, 29, 3, 1, 176
DrawBox 5, 3, 76, 8, 11, 3, 178 '10, 9, 178

_PRINTMODE _KEEPBACKGROUND

COLOR 14, 0
LOCATE 5, 30: PRINT "SAVE YOUR GAME HERE";
LOCATE 6, 19: PRINT "Please select a slot to save your game in."
'                    12345678901234567890123456789012345678901234567890123456789012345678901234567890


FOR slot = 1 TO MaxSlots
    x = 7: IF slot > INT(MaxSlots / 2) THEN x = 42
    y = 12 + (((slot - 1) MOD (MaxSlots / 2)) * 2)

    COLOR 14
    LOCATE y, x
    PRINT CHR$(64 + slot); ") ";

    IF LTRIM$(RTRIM$(SavedGameName$(slot - 1))) = "" THEN
        COLOR 3
        PRINT "<EMPTY>";
    ELSE
        COLOR 10
        PRINT SavedGameName$(slot - 1);
    END IF
NEXT



LOCATE 27, 8: PRINT "WHY ARE YOU SAVING THE GAME? YOU CAN'T DIE.";
COLOR 9, 0: PRINT "  HINT: YOUR A ZOMBIE";

_DISPLAY

CheckKeyStatus:

' *** GET KEY
k = GetKey

' *** IF KEY IS THE ESC KEY THEN EXIT SUB
IF k = 27 THEN
    ' *** CLOSE IT
    CLOSE #1
    MeltScreen 0, 1
    DOOM = TIMER(0.001) + RemainingTime
    ConvertStringToPalette Palette_Temp$

    EXIT SUB
END IF

IF ((k > 64) AND (((k - 64) <= MaxSlots) AND ((k - 64) > 0))) OR ((k > 96) AND (((k - 96) <= MaxSlots) AND ((k - 96) > 0))) THEN

    ' *** OF KEY IS LOWER CASE LETTER, THEN MAKE IT UPPER CASE
    IF k > 96 THEN k = k - 32

    ' *** ADJUST KEY TO SLOT POSITION
    SelectedSlot = k - 65

    x = 10: IF SelectedSlot >= INT(MaxSlots / 2) THEN x = 45
    y = 11 + ((SelectedSlot MOD (MaxSlots / 2)) * 2)

    _PRINTMODE _FILLBACKGROUND

    DrawBox x, y, x + 30, y + 2, 2, 2, 176

    _PRINTMODE _KEEPBACKGROUND

    COLOR 14
    LOCATE y + 1, x + 2
    GameDataName$ = GetLine$(27, LTRIM$(RTRIM$(SavedGameName$(SelectedSlot))))

    IF GameDataName$ = "" THEN GOTO DrawScreen
    SavedGameNameTemp = GameDataName$ + SPACE$(Len_SavedGameName)

    ' *** SAVE THE CURRENT GAME DATA
    PUT #1, SelectedSlot * SlotSize + 1, SavedGameNameTemp
    PUT #1, , RemainingTime
    PUT #1, , Game_Timer_Started
    PUT #1, , CurrentRoom
    PUT #1, , Radio_Playing
    PUT #1, , Radio_Message_Heard
    PUT #1, , Has_BackPack
    PUT #1, , Talked_To_General
    PUT #1, , Zombie_Data_Amount
    PUT #1, , Zombie_Vaccine_Amount
    PUT #1, , NPC_Joan
    PUT #1, , NPC_Billy
    PUT #1, , NPC_Pa
    PUT #1, , NPC_Ma
    PUT #1, , NPC_OldMan
    PUT #1, , NPC_Woman
    PUT #1, , NPC_Teen
    PUT #1, , NPC_Soldier
    PUT #1, , NPC_Pilot
    PUT #1, , NPC_Man
    PUT #1, , NPC_Cop
    PUT #1, , NPC_Doctor
    PUT #1, , NPC_Nurse
    PUT #1, , NPC_Coward
    PUT #1, , NPC_Lady
    PUT #1, , NPC_Kid
    PUT #1, , NPC_Driver
    PUT #1, , NPC_General
    PUT #1, , Zombie_Health

    ' *** CLOSE IT
    CLOSE #1

    MeltScreen 0, 1

    ConvertStringToPalette Palette_Temp$

    EXIT FUNCTION

END IF

_DISPLAY

GOTO CheckKeyStatus


END FUNCTION


' **************************************************************************************
' LOAD GAME DATA
' **************************************************************************************
FUNCTION LoadGame ()

DIM SavedGameName(MaxSlots) AS STRING '* LEN_SAVEDGAMENAME
DIM SavedGameNameTemp AS STRING * LEN_SAVEDGAMENAME

_SNDSTOP Sound_House
_SNDSTOP Sound_Town
_SNDSTOP Sound_Main

Palette_Temp$ = ConvertPaletteToString$(0)

ConvertStringToPalette Palette_LoadScreen
'FadePaletteStringToColor Palette_LoadScreen, _RGB32(0, 0, 0), 0, 0

' *** GET REMAINING TIME
RemainingTime = DOOM - TIMER(0.001)

' *** OPEN THE SAVE GAME DATA FILE
OPEN SaveGameFILE$ FOR BINARY AS #1

' *** READ ALL GAME NAMES STORED IN EACH SLOT
FOR slot = 1 TO MaxSlots
    GET #1, SlotSize * (slot - 1) + 1, SavedGameNameTemp
    SavedGameName$(slot - 1) = RTRIM$(LTRIM$(SavedGameNameTemp))
NEXT


' ### ------------------------------------------- ###
' ###   Draw Screen                               ###
' ### ------------------------------------------- ###
DrawScreen:

COLOR 0, 0
CLS

_PRINTMODE _FILLBACKGROUND

DrawBox 3, 2, 78, 29, 3, 1, 176
DrawBox 5, 3, 76, 8, 11, 3, 178 '10, 9, 178

_PRINTMODE _KEEPBACKGROUND

COLOR 14, 0
LOCATE 5, 29: PRINT "LOAD A SAVED GAME HERE";
LOCATE 6, 20: PRINT "Please select a slot to load a game from."


FOR slot = 1 TO MaxSlots
    x = 7: IF slot > INT(MaxSlots / 2) THEN x = 42
    y = 12 + (((slot - 1) MOD (MaxSlots / 2)) * 2)

    COLOR 14
    LOCATE y, x
    PRINT CHR$(64 + slot); ") ";

    IF LTRIM$(RTRIM$(SavedGameName$(slot - 1))) = "" THEN
        COLOR 3
        PRINT "<EMPTY>";
    ELSE
        COLOR 10
        PRINT SavedGameName$(slot - 1);
    END IF
NEXT

LOCATE 27, 8: PRINT "LOADING A NEW GAME? DID YOU GET STUCK?";
COLOR 9, 0: PRINT "  HINT: YOU DON'T NEED A HINT";

_DISPLAY

CheckKeyStatus:

' *** GET KEY
k = GetKey

' *** IF KEY IS THE ESC KEY THEN EXIT SUB
IF k = 27 THEN
    ' *** CLOSE IT
    CLOSE #1

    MeltScreen 0, 1

    DOOM = TIMER(0.001) + RemainingTime
    ConvertStringToPalette Palette_Temp$

    EXIT SUB
END IF

IF ((k > 64) AND (((k - 64) <= MaxSlots) AND ((k - 64) > 0))) OR ((k > 96) AND (((k - 96) <= MaxSlots) AND ((k - 96) > 0))) THEN

    ' *** OF KEY IS LOWER CASE LETTER, THEN MAKE IT UPPER CASE
    IF k > 96 THEN k = k - 32

    ' *** ADJUST KEY TO SLOT POSITION
    SelectedSlot = k - 65

    'LOCATE 1, 1: PRINT "SelectedSlot: "; SelectedSlot;: _DISPLAY: SLEEP

    ' *** IF THE GAME NAME IS EMPTY, THEN ASSUME THE ENTIRE DATA IS EMPTY. GO BACK AND WAIT FOR ANOTHER KEY
    'IF ASC(MID$(SavedGameName$(SelectedSlot), 1, 1)) = 0 THEN GOTO CheckKeyStatus
    IF LTRIM$(RTRIM$(SavedGameName$(SelectedSlot))) = "" THEN GOTO CheckKeyStatus

    ' *** RETRIEVE REQUESTED INFORMATION
    '  SlotSize * (slot - 1) + 1
    GET #1, SelectedSlot * SlotSize + 1, SavedGameName
    GET #1, , RemainingTime
    GET #1, , Game_Timer_Started
    GET #1, , CurrentRoom
    GET #1, , Radio_Playing
    GET #1, , Radio_Message_Heard
    GET #1, , Has_BackPack
    GET #1, , Talked_To_General
    GET #1, , Zombie_Data_Amount
    GET #1, , Zombie_Vaccine_Amount
    GET #1, , NPC_Joan
    GET #1, , NPC_Billy
    GET #1, , NPC_Pa
    GET #1, , NPC_Ma
    GET #1, , NPC_OldMan
    GET #1, , NPC_Woman
    GET #1, , NPC_Teen
    GET #1, , NPC_Soldier
    GET #1, , NPC_Pilot
    GET #1, , NPC_Man
    GET #1, , NPC_Cop
    GET #1, , NPC_Doctor
    GET #1, , NPC_Nurse
    GET #1, , NPC_Coward
    GET #1, , NPC_Lady
    GET #1, , NPC_Kid
    GET #1, , NPC_Driver
    GET #1, , NPC_General
    GET #1, , Zombie_Health

    '_DISPLAY

    LoadGame = TRUE
    CLOSE #1

    MeltScreen 0, 1

    ConvertStringToPalette Palette_Temp$

    DOOM = TIMER(0.001) + RemainingTime

    EXIT FUNCTION

END IF

_DISPLAY

GOTO CheckKeyStatus

END FUNCTION



