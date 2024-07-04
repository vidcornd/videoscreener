@echo off
setlocal

REM http-server başlatılıyor
start http-server -p 8000

REM Tarayıcıda localhost:8000 adresini aç
timeout /t 2 /nobreak >nul
start "" "http://localhost:8000"

endlocal