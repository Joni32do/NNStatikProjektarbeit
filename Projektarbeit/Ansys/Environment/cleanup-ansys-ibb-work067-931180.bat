@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="ibb-work067" (taskkill /f /pid 937464)
if /i "%LOCALHOST%"=="ibb-work067" (taskkill /f /pid 931180)

del /F cleanup-ansys-ibb-work067-931180.bat
