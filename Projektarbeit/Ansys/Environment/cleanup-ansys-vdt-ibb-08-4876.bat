@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-08" (taskkill /f /pid 1940)
if /i "%LOCALHOST%"=="vdt-ibb-08" (taskkill /f /pid 4876)

del /F cleanup-ansys-vdt-ibb-08-4876.bat
