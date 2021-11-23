@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-06" (taskkill /f /pid 6812)
if /i "%LOCALHOST%"=="vdt-ibb-06" (taskkill /f /pid 9464)

del /F cleanup-ansys-vdt-ibb-06-9464.bat
