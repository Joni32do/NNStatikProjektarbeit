@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-08" (taskkill /f /pid 9080)
if /i "%LOCALHOST%"=="vdt-ibb-08" (taskkill /f /pid 8264)

del /F cleanup-ansys-vdt-ibb-08-8264.bat
