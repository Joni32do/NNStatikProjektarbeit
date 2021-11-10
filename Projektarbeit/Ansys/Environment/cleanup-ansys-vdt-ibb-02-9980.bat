@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-02" (taskkill /f /pid 11228)
if /i "%LOCALHOST%"=="vdt-ibb-02" (taskkill /f /pid 9980)

del /F cleanup-ansys-vdt-ibb-02-9980.bat
