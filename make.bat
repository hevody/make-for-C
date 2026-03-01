:: Developed by Velocity (real name redacted) to mimic the functionality of the make command when compiling a C file featured in the CS50: Introduction to Computer Science course.

@echo off

goto checkIfInPATH
:: Goes to a function to check if the program is inside a folder from PATH so the "make [program].c" will work.

:mainProgram
:: Identify if the supplied argument is with .c or without .c
echo %* | findstr /r /c:".c"

if %errorlevel% equ 0 goto withC
if %errorlevel% neq 0 goto withoutC 

:withC
:: Get the name of the C file and strip it to its base name (so the output will be basename.exe).
set "CFile=%*"
set "baseCFile=%CFile:~0,-2%"
goto executionMainProgram

:withoutC
set "baseCFile=%*"
goto executionMainProgram

:executionMainProgram
:: Compile the C file using the gcc compiler.
gcc %baseCFile%.c -o %baseCFile%.exe

:: Error handlers in case the main program did not work.
if %errorlevel% equ 9009 goto GCCNotInPATH
if %errorlevel% equ 1 goto wrongFileSuppliedError

:: Runs the file upon compilation.
echo(
%baseCFile%.exe

goto skipFunctions

:GCCNotInPATH
:: A function that checks if the GCC compiler is installed.
echo(
echo [*] Run the requirements.bat first!
echo(

goto skipFunctions

:wrongFileSuppliedError
:: A function that checks if the name supplied to the make command exists
:: Example: make hello.c
:: If hello.c was not yet created or is not in the same directory as the terminal where it was executed, then it will trigger this error. 
echo(
echo [*] %baseCFile% does not exist in this directory.
echo(

goto skipFunctions

:checkIfInPATH
:: A function that automates the transfer of make.bat to a folder from PATH.
:: This ensures that "make" will work in the terminal regardless of the directory 
set "directoryInExecution=%CD%"
cd C:\
cd winlibs* >nul 2>&1
cd mingw*\bin
move %directoryInExecution%\make.bat .\ >nul 2>&1
cd %directoryInExecution%
goto mainProgram

:skipFunctions
:: A function to trigger so that the program will not mindlessly trigger other functions
exit /b