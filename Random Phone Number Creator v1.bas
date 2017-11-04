_TITLE "Randomize Phone Number - Demo #1"

DIM PhoneNumber AS STRING

PhoneNumber = "(555) 000-0000"


FOR i = 1 TO 20
    PRINT "New phone number: "; RandomizePhoneNumber$(PhoneNumber, 3)
NEXT


FUNCTION RandomizePhoneNumber$ (PhoneNumberToRandomize AS STRING, BeginningNumbersToSkip AS _UNSIGNED _BYTE)

    DIM DigitCount AS _UNSIGNED _BYTE

    FOR i = 1 TO LEN(PhoneNumberToRandomize$)

        ' Since the provided phone number may have characters that are not numbers, we need to skip any non-number
        ' characters. This allows us to format the number however we want.
        IF MID$(PhoneNumberToRandomize, i, 1) >= CHR$(48) AND MID$(PhoneNumberToRandomize, i, 1) <= CHR$(57) THEN

            ' Increase the numerical character count
            DigitCount = DigitCount + 1

            ' Check to see if the numerical character count is greater than the numbers wanted to skip
            IF DigitCount > BeginningNumbersToSkip THEN

                ' Randomize the phone number digit
                MID$(PhoneNumberToRandomize, i, 1) = CHR$(RND * 9 + 48)

            END IF

        END IF

    NEXT

    RandomizePhoneNumber$ = PhoneNumberToRandomize

END FUNCTION
