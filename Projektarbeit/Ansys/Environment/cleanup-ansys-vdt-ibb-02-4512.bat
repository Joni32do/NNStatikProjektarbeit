@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-02" (taskkill /f /pid 1136)
if /i "%LOCALHOST%"=="vdt-ibb-02" (taskkill /f /pid 4512)

del /F cleanup-ansys-vdt-ibb-02-4512.bat
