#!/bin/bash

echo "Starting local web server for AnyHtmlOllama..."
echo ""
echo "Access the application at: http://localhost:8000/AnyHtmlOllama.html"
echo ""
echo "Press Ctrl+C to stop the server when finished"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null && ! command -v python &> /dev/null; then
    echo "Python not found. Please install Python."
    echo ""
    echo "On Ubuntu/Debian: sudo apt-get install python3"
    echo "On MacOS: brew install python"
    echo ""
    exit 1
fi

# Determine Python command (python3 or python)
PYTHON_CMD="python3"
if ! command -v python3 &> /dev/null; then
    PYTHON_CMD="python"
fi

# Navigate to the script directory
cd "$(dirname "$0")"

# Start the Python HTTP server
echo "Starting server..."
$PYTHON_CMD -m http.server 8000
