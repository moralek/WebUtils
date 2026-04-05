@echo off
setlocal enabledelayedexpansion

set "input="

:next
if "%~1"=="" goto done
if exist "%~1" set "input=%~1"
shift
goto next

:done
if not defined input exit /b 1
type "%input%"
