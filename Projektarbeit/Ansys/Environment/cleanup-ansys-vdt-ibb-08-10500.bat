@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-08" (taskkill /f /pid 3412)
if /i "%LOCALHOST%"=="vdt-ibb-08" (taskkill /f /pid 10500)

del /F cleanup-ansys-vdt-ibb-08-10500.bat
