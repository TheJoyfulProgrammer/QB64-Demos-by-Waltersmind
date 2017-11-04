' To help organize all the details and data about our clients, we will first
' create a special kind of data list called a TYPE. You can think of this
' special data list as a record in a database, or a BINARY file. On a side
' note, TYPE lists have a fixed size and can not be changed when the app runs.
' However, you can have as many, or as few variables in a type as you want while
' you are writing/modifying the code.

TYPE ClientInformation
   CompanyName AS STRING * 40 '   (40 Bytes)
   FirstName AS STRING * 30 '     (30 Bytes)
   LastName AS STRING * 30 '      (30 Bytes)
   PhoneNumber AS STRING * 20 '   (20 Bytes) store preformatted phone #'s
   AccountStatus AS STRING * 10 ' (10 Bytes) Could use _BYTE here
   AmountOwed AS DOUBLE '         (8 Bytes)
   HowManyTimesCalled AS LONG '   (4 Bytes)
END TYPE


' Now that we have our TYPE list filled with all of our customers data, we want
' create a way of keeping track of more than one client. We will use an ARRAY
' for this. But, at this point, we may not know how many customers we are going
' to have, so a little trick I like to use is tell QB64 to not create any
' memory for our clients array until we add them. We do this by declaring the
' array with -1 (any number less than zero will work). If we define the array
' with zero, then the array will have one element that QB64 will allocate
' memory for. On a side note, just like we declared what each variable is in
' the TYPE list above, we also need to declare that the new array will be
' defined as the TYPE list above so we can access all data with the "."
' access feature. Also when to tell QB64 that we will be re-dimensioning the
' client array later, which we do so with REDIM statement. We will need to
' share it through out the entire project.

REDIM SHARED Client(-1) AS ClientInformation

' Declare the width and height of the window to create
DIM SHARED ScreenWidth AS _UNSIGNED INTEGER '  We use _UNSIGNED here since screens can
DIM SHARED ScreenHeight AS _UNSIGNED INTEGER ' not have negative dimensions.

' Define the width and height of our screen
ScreenWidth = 800
ScreenHeight = 600

' Declare the variable to hold the handle to the image that will be used as the
' SCREEN window.
DIM SHARED ScreenImageHandle AS LONG

' Create the image that will be used to display our app.
ScreenImageHandle = _NEWIMAGE(ScreenWidth, ScreenHeight, 32)

' Set the app's title
_TITLE "Loading & Saving Customer imformation"

' For this demonstration, I want to cap the maximum amount of clients we can
' work with at a time, so here we will create the variable that will hold the
' maximum amount of cllients. Since it will be less than 256 of them, I will
' define it as a unsigned _BYTE, since we can not have negative amount of
' clients.
DIM MaximumNumberOfClients AS _UNSIGNED _BYTE

' Define the max number of clients
MaximumNumberOfClients = 2

' Declare the variable that will hole out client data filename
DIM FileName AS STRING

' Define the name of the file
FileName = "_ClientData.DAT"

' Create the screen window that will display our app
SCREEN ScreenImageHandle

' We need to resize the client ARRAY
REDIM Client(MaximumNumberOfClients) AS ClientInformation

' For our testing purposes, lets propragate the clients data with random
' jiberish.
FOR i = 0 TO UBOUND(Client)
   Client(i).CompanyName = "Test Company #" + STR$(i)
   Client(i).FirstName = "FirstName #" + STR$(i)
   Client(i).LastName = "LastName #" + STR$(i)
   Client(i).PhoneNumber = RandomizePhoneNumber$("(555) 000-0000", 3)
   Client(i).AccountStatus = "Good" + STR$(i)
   Client(i).AmountOwed = INT(RND * 1000000) / 100
   Client(i).HowManyTimesCalled = RND * 10
NEXT

' Lets display the client record size.
PRINT "Record size for each client is:"; (LEN(Client(0))); " Bytes"
PRINT

' Let's print all this information to the screen
FOR i = 0 TO UBOUND(client)

   COLOR _RGB(255, 255, 255)
   PRINT "Client #"; i

   COLOR _RGB(255, 0, 0)
   PRINT "Company Name:";
   LOCATE CSRLIN, 30: PRINT Client(i).CompanyName

   PRINT "First Name:";
   LOCATE CSRLIN, 30: PRINT Client(i).FirstName

   PRINT "Last Name:";
   LOCATE CSRLIN, 30: PRINT Client(i).LastName

   PRINT "Phone Number:";
   LOCATE CSRLIN, 30: PRINT Client(i).PhoneNumber

   PRINT "Account Status:";
   LOCATE CSRLIN, 30: PRINT Client(i).AccountStatus

   PRINT "Amount Owed:";
   LOCATE CSRLIN, 30: PRINT Client(i).AmountOwed

   PRINT "How Many Times Called:";
   LOCATE CSRLIN, 30: PRINT Client(i).HowManyTimesCalled

   PRINT

NEXT

' Now that all the data is generated, let's save to the disk. Before we do,
' Let's wait for the user to press any key
COLOR _RGB(0, 200, 0)
PRINT
PRINT "<PRESS ANY KEY TO SAVE DATA TO DISK>"

' Sleep until the user presses any key. We will not be able to see which key
' was pressed with this command.
SLEEP

' Since this demo is only has three records, we can use that information to
' our advantage.
LOCATE 3, 1

' Let's save out client data

' Get the next free file number
NextFreeFileNum% = FREEFILE

' Open the data file to store the data.
OPEN FileName FOR BINARY AS NextFreeFileNum%

FOR Record% = 0 TO UBOUND(Client)

   ' Change the text color to white and print the clients # verbiage.
   COLOR _RGB(255, 255, 255)
   PRINT "Client #"; Record%

   ' Change the color to medium green
   COLOR _RGB(0, 128, 0)

   ' Print just the words, "Company Name" in green, so if the drive is taking
   ' awhile to save due to heavy usage, then the user will know it is waiting
   ' for something to finish.
   PRINT "Company Name:";

   ' Save Company Name to disk at calculated offset. We only need to calculate
   ' The offset once during each iteration.
   PUT #NextFreeFileNum%, Record% * LEN(Client(0)) + 1, Client(Record%).CompanyName

   ' Now print the actual clients company name to the screen in green.
   LOCATE CSRLIN, 30: PRINT Client(Record%).CompanyName;

   ' Also tell the client that that particular field in the record was saved.
   LOCATE CSRLIN, 75: PRINT "Saved..."

   ' The rest of the following fields will be the same as before, so I will not
   ' document them to cut down on redundant explanations.

   PRINT "First Name:";
   PUT #NextFreeFileNum%, , Client(Record%).FirstName
   LOCATE CSRLIN, 30: PRINT Client(Record%).FirstName;
   LOCATE CSRLIN, 75: PRINT "Saved..."

   PRINT "Last Name:";
   PUT #NextFreeFileNum%, , Client(Record%).LastName
   LOCATE CSRLIN, 30: PRINT Client(Record%).LastName;
   LOCATE CSRLIN, 75: PRINT "Saved..."

   PRINT "Phone Number:";
   PUT #NextFreeFileNum%, , Client(Record%).PhoneNumber
   LOCATE CSRLIN, 30: PRINT Client(Record%).PhoneNumber;
   LOCATE CSRLIN, 75: PRINT "Saved..."

   PRINT "Account Status:";
   PUT #NextFreeFileNum%, , Client(Record%).AccountStatus
   LOCATE CSRLIN, 30: PRINT Client(Record%).AccountStatus;
   LOCATE CSRLIN, 75: PRINT "Saved..."

   PRINT "Amount Owed:";
   PUT #NextFreeFileNum%, , Client(Record%).AmountOwed
   LOCATE CSRLIN, 30: PRINT Client(Record%).AmountOwed;
   LOCATE CSRLIN, 75: PRINT "Saved..."

   PRINT "How Many Times Called:";
   PUT #NextFreeFileNum%, , Client(Record%).HowManyTimesCalled
   LOCATE CSRLIN, 30: PRINT Client(Record%).HowManyTimesCalled;
   LOCATE CSRLIN, 75: PRINT "Saved..."

   PRINT

NEXT

' Now close the file and let the user know.
CLOSE #NextFreeFileNum%

COLOR _RGB(0, 255, 0)
PRINT
PRINT "All the client records are saved to disk. Press any key to clear all records in memory."
SLEEP

CLS


' The quickest
FOR i = 0 TO UBOUND(Client)
   Client(i).CompanyName = ""
   Client(i).FirstName = ""
   Client(i).LastName = ""
   Client(i).PhoneNumber = ""
   Client(i).AccountStatus = ""
   Client(i).AmountOwed = 0
   Client(i).HowManyTimesCalled = 0
NEXT



' Show the user that the records are all cleared out of memory

' Lets display the client record size.
PRINT "Record size for each client is:"; (LEN(Client(0))); " Bytes"
PRINT

' Let's print all this information to the screen
FOR i = 0 TO UBOUND(client)

   COLOR _RGB(255, 255, 255)
   PRINT "Client #"; i

   COLOR _RGB(255, 0, 0)
   PRINT "Company Name:";
   LOCATE CSRLIN, 30: PRINT Client(i).CompanyName

   PRINT "First Name:";
   LOCATE CSRLIN, 30: PRINT Client(i).FirstName

   PRINT "Last Name:";
   LOCATE CSRLIN, 30: PRINT Client(i).LastName

   PRINT "Phone Number:";
   LOCATE CSRLIN, 30: PRINT Client(i).PhoneNumber

   PRINT "Account Status:";
   LOCATE CSRLIN, 30: PRINT Client(i).AccountStatus

   PRINT "Amount Owed:";
   LOCATE CSRLIN, 30: PRINT Client(i).AmountOwed

   PRINT "How Many Times Called:";
   LOCATE CSRLIN, 30: PRINT Client(i).HowManyTimesCalled

   PRINT

NEXT

PRINT
COLOR _RGB(255, 255, 0)
PRINT "All records are empty. Press any key to load data from our newly created data file."
SLEEP

CLS


' Get the next free file number
NextFreeFileNum% = FREEFILE

' Open the data file to store the data.
OPEN FileName FOR BINARY AS NextFreeFileNum%

' Lets display the client record size.
PRINT "Record size for each client is:"; (LEN(Client(0))); " Bytes"
PRINT


FOR Record% = 0 TO UBOUND(Client)

   ' Change the text color to white and print the clients # verbiage.
   COLOR _RGB(255, 255, 255)
   PRINT "Client #"; Record%

   ' Change the color to bright green
   COLOR _RGB(0, 255, 0)

   ' Print just the words, "Company Name" in green, so if the drive is taking
   ' awhile to save due to heavy usage, then the user will know it is waiting
   ' for something to finish.
   PRINT "Company Name:";

   ' Save Company Name to disk at calculated offset. We only need to calculate
   ' The offset once during each iteration.
   GET #NextFreeFileNum%, Record% * LEN(Client(0)) + 1, Client(Record%).CompanyName

   ' Now print the actual clients company name to the screen in green.
   LOCATE CSRLIN, 30: PRINT Client(Record%).CompanyName;

   ' Also tell the client that that particular field in the record was saved.
   LOCATE CSRLIN, 75: PRINT "Loaded..."

   ' The rest of the following fields will be the same as before, so I will not
   ' document them to cut down on redundant explanations.

   PRINT "First Name:";

   GET #NextFreeFileNum%, , Client(Record%).FirstName

   LOCATE CSRLIN, 30: PRINT Client(Record%).FirstName;
   LOCATE CSRLIN, 75: PRINT "Loaded..."

   PRINT "Last Name:";

   GET #NextFreeFileNum%, , Client(Record%).LastName

   LOCATE CSRLIN, 30: PRINT Client(Record%).LastName;
   LOCATE CSRLIN, 75: PRINT "Loaded..."

   PRINT "Phone Number:";

   GET #NextFreeFileNum%, , Client(Record%).PhoneNumber

   LOCATE CSRLIN, 30: PRINT Client(Record%).PhoneNumber;
   LOCATE CSRLIN, 75: PRINT "Loaded..."

   PRINT "Account Status:";

   GET #NextFreeFileNum%, , Client(Record%).AccountStatus

   LOCATE CSRLIN, 30: PRINT Client(Record%).AccountStatus;
   LOCATE CSRLIN, 75: PRINT "Loaded..."

   PRINT "Amount Owed:";

   GET #NextFreeFileNum%, , Client(Record%).AmountOwed

   LOCATE CSRLIN, 30: PRINT Client(Record%).AmountOwed;
   LOCATE CSRLIN, 75: PRINT "Loaded..."

   PRINT "How Many Times Called:";

   GET #NextFreeFileNum%, , Client(Record%).HowManyTimesCalled

   LOCATE CSRLIN, 30: PRINT Client(Record%).HowManyTimesCalled;
   LOCATE CSRLIN, 75: PRINT "Loaded..."

   PRINT

NEXT

' Now close the file and let the user know.
CLOSE #NextFreeFileNum%

COLOR _RGB(0, 255, 0)
PRINT
PRINT "Now we change the status of client #1 to 'Delinquent'. Press any key to continue."
SLEEP

Client(1).AccountStatus = "Delinquent"

LOCATE 4, 1

FOR i = 1 TO 30
   LOCATE i, 75: PRINT SPACE$(20)
NEXT

LOCATE 31, 1: PRINT SPACE$(120);

' Ok... I am cheating a little here on the positioning.
LOCATE 17, 1

COLOR _RGB(255, 0, 0)

PRINT "Account Status:";
LOCATE CSRLIN, 30: PRINT Client(1).AccountStatus;
LOCATE CSRLIN, 75: PRINT "Changed..."


COLOR _RGB(100, 100, 255)
LOCATE 31, 1
PRINT "Press any key to save new value to disk."
SLEEP

' Get the next free file number
NextFreeFileNum% = FREEFILE

' Open the data file to store the data.
OPEN FileName FOR BINARY AS NextFreeFileNum%

' Save the one piece of data. Now, we will need to know the exact location to store it in the file.
' By physically counting the number of bytes used before the account status field, we will use that
' number to our benefit here. The quantity is 120 in this demo. We also know that the array position
' is at 1 so we need to add 1 to it to adjust for the 0 base of the array, and that we need to add
' one since files start with byte 1 in QB64.
CurrentArrayPos% = 1
CONST FileStartingPos% = 1
OffsetBytesToVar% = 120
PUT #NextFreeFileNum%, LEN(Client(0)) * CurrentArrayPos% + FileStartingPos% + OffsetBytesToVar%, Client(1).AccountStatus

'close the file
CLOSE #NextFreeFileNum%

' Let the user know it's saved.

LOCATE 31, 1: PRINT SPACE$(120)
LOCATE 31, 1: PRINT "Field saved to disk. To verify this, press any key to clear the data in memory."
SLEEP

CLS


' The quickest
FOR i = 0 TO UBOUND(Client)
   Client(i).CompanyName = ""
   Client(i).FirstName = ""
   Client(i).LastName = ""
   Client(i).PhoneNumber = ""
   Client(i).AccountStatus = ""
   Client(i).AmountOwed = 0
   Client(i).HowManyTimesCalled = 0
NEXT



' Show the user that the records are all cleared out of memory

' Lets display the client record size.
PRINT "Record size for each client is:"; (LEN(Client(0))); " Bytes"
PRINT

' Let's print all this information to the screen
FOR i = 0 TO UBOUND(client)

   COLOR _RGB(255, 255, 255)
   PRINT "Client #"; i

   COLOR _RGB(255, 0, 0)
   PRINT "Company Name:";
   LOCATE CSRLIN, 30: PRINT Client(i).CompanyName

   PRINT "First Name:";
   LOCATE CSRLIN, 30: PRINT Client(i).FirstName

   PRINT "Last Name:";
   LOCATE CSRLIN, 30: PRINT Client(i).LastName

   PRINT "Phone Number:";
   LOCATE CSRLIN, 30: PRINT Client(i).PhoneNumber

   PRINT "Account Status:";
   LOCATE CSRLIN, 30: PRINT Client(i).AccountStatus

   PRINT "Amount Owed:";
   LOCATE CSRLIN, 30: PRINT Client(i).AmountOwed

   PRINT "How Many Times Called:";
   LOCATE CSRLIN, 30: PRINT Client(i).HowManyTimesCalled

   PRINT

NEXT

PRINT
COLOR _RGB(255, 255, 0)
PRINT "All records are empty. Press any key to load data from our newly created data file."
SLEEP

CLS

' Get the next free file number
NextFreeFileNum% = FREEFILE

' Open the data file to store the data.
OPEN FileName FOR BINARY AS NextFreeFileNum%

' Lets display the client record size.
PRINT "Record size for each client is:"; (LEN(Client(0))); " Bytes"
PRINT


FOR Record% = 0 TO UBOUND(Client)

   ' Change the text color to white and print the clients # verbiage.
   COLOR _RGB(255, 255, 255)
   PRINT "Client #"; Record%

   ' Change the color to bright green
   COLOR _RGB(0, 255, 0)

   ' Print just the words, "Company Name" in green, so if the drive is taking
   ' awhile to save due to heavy usage, then the user will know it is waiting
   ' for something to finish.
   PRINT "Company Name:";

   ' Save Company Name to disk at calculated offset. We only need to calculate
   ' The offset once during each iteration.
   GET #NextFreeFileNum%, Record% * LEN(Client(0)) + 1, Client(Record%).CompanyName

   ' Now print the actual clients company name to the screen in green.
   LOCATE CSRLIN, 30: PRINT Client(Record%).CompanyName;

   ' Also tell the client that that particular field in the record was saved.
   LOCATE CSRLIN, 75: PRINT "Loaded..."

   ' The rest of the following fields will be the same as before, so I will not
   ' document them to cut down on redundant explanations.

   PRINT "First Name:";

   GET #NextFreeFileNum%, , Client(Record%).FirstName

   LOCATE CSRLIN, 30: PRINT Client(Record%).FirstName;
   LOCATE CSRLIN, 75: PRINT "Loaded..."

   PRINT "Last Name:";

   GET #NextFreeFileNum%, , Client(Record%).LastName

   LOCATE CSRLIN, 30: PRINT Client(Record%).LastName;
   LOCATE CSRLIN, 75: PRINT "Loaded..."

   PRINT "Phone Number:";

   GET #NextFreeFileNum%, , Client(Record%).PhoneNumber

   LOCATE CSRLIN, 30: PRINT Client(Record%).PhoneNumber;
   LOCATE CSRLIN, 75: PRINT "Loaded..."

   PRINT "Account Status:";

   GET #NextFreeFileNum%, , Client(Record%).AccountStatus

   LOCATE CSRLIN, 30: PRINT Client(Record%).AccountStatus;
   LOCATE CSRLIN, 75: PRINT "Loaded..."

   PRINT "Amount Owed:";

   GET #NextFreeFileNum%, , Client(Record%).AmountOwed

   LOCATE CSRLIN, 30: PRINT Client(Record%).AmountOwed;
   LOCATE CSRLIN, 75: PRINT "Loaded..."

   PRINT "How Many Times Called:";

   GET #NextFreeFileNum%, , Client(Record%).HowManyTimesCalled

   LOCATE CSRLIN, 30: PRINT Client(Record%).HowManyTimesCalled;
   LOCATE CSRLIN, 75: PRINT "Loaded..."

   PRINT

NEXT

' Now close the file and let the user know.
CLOSE #NextFreeFileNum%

COLOR _RGB(0, 255, 0)
PRINT
PRINT "Client #1's account status has now changed and saved to disk."
PRINT "Now we are done with this demo."
SLEEP

SYSTEM





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