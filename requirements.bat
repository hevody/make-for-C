:: Once the GCC compiler package is installed, this program will move it to the root directory (C:\).
move winlibs* C:\ >nul 2>&1
if %errorlevel% neq 0 goto unableToMoveError
cd C:\

:: The program then extracts the zip file installed.
for %%f in (winlibs*) do (
    tar -xf "%%f"
)

:: Once finished extracting, it will ll move to the bin directory to set it as PATH for quick compiling,
:: so that the user will not have to find this directory again whenever the user wanted to compile a C code.
cd winlibs* >nul 2>&1
cd \mingw*\bin
setx PATH "%PATH%;%CD%"

cd %USERPROFILE%

goto endOfProgram

:unableToMoveError
:: A function triggered when the GCC compiler package is not yet downloaded.
echo(
echo(
echo [*] Download GCC Compiler here: https://winlibs.com/#download-release
echo(
goto endOfProgram

:endOfProgram
:: A function triggered to end the program
exit /b