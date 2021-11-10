@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-02" (taskkill /f /pid 8388)
if /i "%LOCALHOST%"=="vdt-ibb-02" (taskkill /f /pid 2024)

del /F cleanup-ansys-vdt-ibb-02-2024.bat
