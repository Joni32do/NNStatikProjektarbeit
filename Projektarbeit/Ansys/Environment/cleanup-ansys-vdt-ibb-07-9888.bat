@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-07" (taskkill /f /pid 5792)
if /i "%LOCALHOST%"=="vdt-ibb-07" (taskkill /f /pid 9888)

del /F cleanup-ansys-vdt-ibb-07-9888.bat
