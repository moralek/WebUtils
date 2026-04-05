@echo off
setlocal

set "LAZBUILD=C:\lazarus\lazbuild.exe"
if not exist "%LAZBUILD%" set "LAZBUILD=lazbuild"

echo Compilando DelFind para Win32...
if exist "tmp\obj\i386-win32" rmdir /s /q "tmp\obj\i386-win32"
"%LAZBUILD%" project1.lpi --cpu=i386 --os=win32 --ws=win32
if errorlevel 1 goto :error

echo.
echo Build OK: target\DelFind.exe
exit /b 0

:error
echo.
echo Error compilando el proyecto.
exit /b 1
