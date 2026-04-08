@echo off
setlocal

set "LAZBUILD=C:\lazarus\lazbuild.exe"
if not exist "%LAZBUILD%" set "LAZBUILD=lazbuild"
set "TARGET_EXE=target\DelFind.exe"

echo Compilando DelFind para Win32...
if exist "tmp\obj\i386-win32" rmdir /s /q "tmp\obj\i386-win32"
if exist "%TARGET_EXE%" (
  del /f /q "%TARGET_EXE%" >nul 2>&1
  if exist "%TARGET_EXE%" (
    echo.
    echo No se pudo eliminar "%TARGET_EXE%".
    echo Verifica que DelFind no este en ejecucion y que el archivo no este bloqueado.
    exit /b 1
  )
)
"%LAZBUILD%" project1.lpi --cpu=i386 --os=win32 --ws=win32
if errorlevel 1 goto :error

echo.
echo Build OK: %TARGET_EXE%
exit /b 0

:error
echo.
echo Error compilando el proyecto.
exit /b 1
