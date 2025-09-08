@echo off
echo Starting local web server for AnyHtmlOllama...
echo.
echo Access the application at: http://localhost:8000/AnyHtmlOllama.html
echo.
echo Press Ctrl+C to stop the server when finished
echo.

REM Check if Python is installed and in PATH
python --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Python not found in PATH. Please install Python or add it to your PATH.
    echo.
    echo You can download Python from https://www.python.org/downloads/
    echo.
    pause
    exit /b
)

REM Change to the script directory
cd /d "%~dp0"

REM Start the Python HTTP server
echo Starting server...
python -m http.server 8000

pause
