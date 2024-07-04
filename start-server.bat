@echo off
setlocal

REM Portun kullanılıp kullanılmadığını kontrol etme
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :8000 ^| findstr LISTENING') do (
  set PID=%%a
)

if defined PID (
  echo Port 8000 is already in use. Trying to kill the process using port 8000.
  taskkill /PID %PID% /F
  if %errorlevel% == 0 (
    echo Successfully killed the process using port 8000.
  ) else (
    echo Failed to kill the process using port 8000. Please try manually.
    exit /b 1
  )
)

REM Batch dosyasının bulunduğu dizine gitme
cd /d "%~dp0"

REM Bulunduğu dizini kontrol et ve ekrana yaz
echo Current directory: %cd%

REM http-server başlatılıyor
start http-server -p 8000

REM Sunucunun başlatılması için 2 saniye bekle
timeout /t 2 /nobreak >nul

REM Varsayılan tarayıcıda localhost:8000 adresini aç
start "" "http://localhost:8000"

REM Terminali açık tutma
echo Server is running. Close the terminal or press CTRL+C to stop the server.
pause

endlocal
