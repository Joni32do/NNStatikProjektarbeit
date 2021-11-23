@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-06" (taskkill /f /pid 3352)
if /i "%LOCALHOST%"=="vdt-ibb-06" (taskkill /f /pid 6296)

del /F cleanup-ansys-vdt-ibb-06-6296.bat
