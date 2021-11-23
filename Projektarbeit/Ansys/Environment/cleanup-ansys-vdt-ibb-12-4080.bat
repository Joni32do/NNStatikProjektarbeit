@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-12" (taskkill /f /pid 1904)
if /i "%LOCALHOST%"=="vdt-ibb-12" (taskkill /f /pid 4080)

del /F cleanup-ansys-vdt-ibb-12-4080.bat
