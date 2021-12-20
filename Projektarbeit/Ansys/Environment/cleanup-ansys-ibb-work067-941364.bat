@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="ibb-work067" (taskkill /f /pid 945068)
if /i "%LOCALHOST%"=="ibb-work067" (taskkill /f /pid 941364)

del /F cleanup-ansys-ibb-work067-941364.bat
