@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-12" (taskkill /f /pid 11032)
if /i "%LOCALHOST%"=="vdt-ibb-12" (taskkill /f /pid 11012)

del /F cleanup-ansys-vdt-ibb-12-11012.bat
