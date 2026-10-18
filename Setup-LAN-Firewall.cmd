@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Setup-LAN-Firewall.ps1"
if errorlevel 1 echo Right-click this file and select Run as administrator.
pause
