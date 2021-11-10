@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-12" (taskkill /f /pid 8968)
if /i "%LOCALHOST%"=="vdt-ibb-12" (taskkill /f /pid 8520)

del /F cleanup-ansys-vdt-ibb-12-8520.bat
