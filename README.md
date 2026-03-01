## Instructions for requirements.bat

1. Download the repository first, by clicking Code >  Download ZIP.
2. Extract the zip file.
3. Now, head to command prompt (NOTE: You need the "Administrator" role for this to work) by clicking the Windows Key > Type Command Prompt > right click > "Run as Administrator".
4. Now, head to the folder where you extract this repository using the file explorer. (It is typically in the downloads folder or C:\Users\username\Downloads).
5. Click the extracted folder and right-click the folder inside > click "Copy as path"
6. Head back to the Command Prompt. Type cd [paste the path copied], then hit Enter.
7. Type requirements.bat, then hit Enter.

## Instructions for make.bat

1. Type this in the command prompt. explorer %USERPROFILE%, then hit Enter.  
2. This should open the file explorer.
3. Now, copy and paste the move.bat from the repository you downloaded to this folder.
4. Type this in the command prompt. cd %USERPROFILE%, then hit Enter.
5. Now, type make.bat

Voila! You can now use make hello.c !

This program will also automatically run the instructions from the compiled version, just like in Python.

NOTE: This program only runs on Windows. I might also add a Linux version for this on my free time.

## Usage
```
make hello.c
```
or
```
make hello
```

If you found a bug, do not hesitate to open an Issue.
