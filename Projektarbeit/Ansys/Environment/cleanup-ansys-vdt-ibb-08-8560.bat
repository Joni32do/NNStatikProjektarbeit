@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="vdt-ibb-08" (taskkill /f /pid 10060)
if /i "%LOCALHOST%"=="vdt-ibb-08" (taskkill /f /pid 8560)

del /F cleanup-ansys-vdt-ibb-08-8560.bat
