@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-02" (taskkill /f /pid 9620)
if /i "%LOCALHOST%"=="vdt-ibb-02" (taskkill /f /pid 7568)

del /F cleanup-ansys-vdt-ibb-02-7568.bat
