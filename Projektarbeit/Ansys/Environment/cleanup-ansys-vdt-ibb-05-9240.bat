@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-05" (taskkill /f /pid 3500)
if /i "%LOCALHOST%"=="vdt-ibb-05" (taskkill /f /pid 9240)

del /F cleanup-ansys-vdt-ibb-05-9240.bat
