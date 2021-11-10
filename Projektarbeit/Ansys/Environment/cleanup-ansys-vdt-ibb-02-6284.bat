@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-02" (taskkill /f /pid 9028)
if /i "%LOCALHOST%"=="vdt-ibb-02" (taskkill /f /pid 6284)

del /F cleanup-ansys-vdt-ibb-02-6284.bat
