@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-05" (taskkill /f /pid 11256)
if /i "%LOCALHOST%"=="vdt-ibb-05" (taskkill /f /pid 2904)

del /F cleanup-ansys-vdt-ibb-05-2904.bat
