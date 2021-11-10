@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-12" (taskkill /f /pid 9744)
if /i "%LOCALHOST%"=="vdt-ibb-12" (taskkill /f /pid 2600)

del /F cleanup-ansys-vdt-ibb-12-2600.bat
