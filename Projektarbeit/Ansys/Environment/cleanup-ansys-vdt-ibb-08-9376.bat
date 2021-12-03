@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-08" (taskkill /f /pid 5056)
if /i "%LOCALHOST%"=="vdt-ibb-08" (taskkill /f /pid 9376)

del /F cleanup-ansys-vdt-ibb-08-9376.bat
