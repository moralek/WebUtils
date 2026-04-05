@echo off
setlocal

set "ROOT=%~dp0.."
for %%I in ("%ROOT%") do set "ROOT=%%~fI"
set "RESDIR=%ROOT%\resources"
set "WINDRES=C:\lazarus\fpc\3.2.2\bin\i386-win32\windres.exe"
set "CVTRES=C:\Windows\Microsoft.NET\Framework\v4.0.30319\cvtres.exe"
set "PREPROC=%RESDIR%\rc_passthrough.cmd"

if not exist "%WINDRES%" (
  echo ERROR: No se encontro windres en "%WINDRES%"
  exit /b 1
)
if not exist "%CVTRES%" (
  echo ERROR: No se encontro cvtres.exe en "%CVTRES%"
  exit /b 1
)

echo [1/2] Generando resources.res...
call "%WINDRES%" --use-temp-file --preprocessor="%PREPROC%" -O res -o "%RESDIR%\resources.res" "%RESDIR%\resources.rc"
if errorlevel 1 exit /b 1

echo [2/2] Convirtiendo resources.res a resources.obj...
call "%CVTRES%" /MACHINE:X86 /OUT:"%RESDIR%\resources.obj" "%RESDIR%\resources.res"
if errorlevel 1 exit /b 1

echo Recursos principales actualizados correctamente.
exit /b 0
