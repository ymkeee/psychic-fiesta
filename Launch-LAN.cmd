@echo off
cd /d "%~dp0"
if not exist "runtime\python.exe" (
    echo Bundled runtime is missing. Extract the entire ZIP before launching.
    pause
    exit /b 1
)
"runtime\python.exe" "serve_local.py" --host 0.0.0.0 --port 8080
if errorlevel 1 (
    echo.
    echo The server could not start. Check whether port 8080 is already in use.
    pause
)
