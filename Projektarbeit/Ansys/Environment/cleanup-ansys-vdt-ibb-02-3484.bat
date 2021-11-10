@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-02" (taskkill /f /pid 3328)
if /i "%LOCALHOST%"=="vdt-ibb-02" (taskkill /f /pid 3484)

del /F cleanup-ansys-vdt-ibb-02-3484.bat
