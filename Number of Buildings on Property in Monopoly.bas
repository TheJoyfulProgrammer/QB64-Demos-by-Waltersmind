SCREEN _NEWIMAGE(800, 500, 32)
_TITLE "Number of Buildings on Property in Monopoly"

LOCATE 2, 1: PRINT "Number of Buildings:";
FOR i = 0 TO 15
    n$ = LTRIM$(RTRIM$(STR$(i)))
    n$ = STRING$(2 - LEN(n$), " ") + n$
    PRINT "  "; n$;
NEXT
PRINT
PRINT STRING$(84, "-")

FOR q = 1 TO 3
    PRINT "Property #"; LTRIM$(RTRIM$(STR$(q))); ":          ";
    FOR b = 0 TO 15
        PRINT " "; LTRIM$(RTRIM$(STR$(Num_Buildings(b, 3, q))));: IF b < 15 THEN PRINT "  ";
    NEXT
    PRINT
NEXT


' Total_Buildings (In Group) = 0 to (5 * Total_Properties (In Group))
' Total_Properties (In Group) = 2 or 3
' Current_Property (In Question) = 1 to Total_Properties (In Group)
FUNCTION Num_Buildings (Total_Buildings, Total_Properties, Current_Property)

    Num_Buildings = INT((Total_Properties / Current_Property) * (1 / Total_Properties) + (1 / Total_Properties) * Total_Buildings - 1 / Total_Properties + 0.25)

END FUNCTION


