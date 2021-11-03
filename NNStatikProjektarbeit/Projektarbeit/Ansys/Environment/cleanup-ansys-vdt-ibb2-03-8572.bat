@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb2-03" (taskkill /f /pid 1268)
if /i "%LOCALHOST%"=="vdt-ibb2-03" (taskkill /f /pid 8572)

del /F cleanup-ansys-vdt-ibb2-03-8572.bat
