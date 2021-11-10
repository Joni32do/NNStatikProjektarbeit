@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-02" (taskkill /f /pid 7016)
if /i "%LOCALHOST%"=="vdt-ibb-02" (taskkill /f /pid 10324)

del /F cleanup-ansys-vdt-ibb-02-10324.bat
