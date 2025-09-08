# Troubleshooting Guide

This guide helps you identify and resolve common issues with AnyHtmlOllama.

## Table of Contents

1. [Installation Issues](#installation-issues)
2. [Connection Problems](#connection-problems)
3. [File Loading Issues](#file-loading-issues)
4. [Generation Problems](#generation-problems)
5. [Preview Issues](#preview-issues)
6. [Saving Problems](#saving-problems)
7. [Tool-Specific Problems](#tool-specific-problems)

## Installation Issues

### Issue: Cannot install Ollama

**Symptoms:**
- Installation fails with error messages
- Ollama doesn't start after installation

**Solutions:**
1. Check system requirements (Windows 10/11, macOS 12+, or Linux)
2. Ensure you have administrator privileges
3. Try the alternative installation methods from [Ollama's official documentation](https://ollama.ai/download)
4. For Windows users, ensure Windows Subsystem for Linux (WSL) is installed and configured

### Issue: Cannot download models

**Symptoms:**
- Models fail to download with timeout errors
- Incomplete model downloads

**Solutions:**
1. Check your internet connection
2. Temporarily disable firewall or antivirus
3. Use a wired connection instead of Wi-Fi if possible
4. Try downloading smaller models first
5. Run Ollama with elevated privileges

## Connection Problems

### Issue: "Failed to fetch models" error

**Symptoms:**
- "Failed to fetch models" message appears on startup
- No models appear in the dropdown

**Solutions:**
1. Ensure Ollama is running (check for the Ollama icon in your system tray)
2. Try starting Ollama manually:
   ```
   # Windows (PowerShell)
   ollama serve
   
   # macOS/Linux
   ollama serve
   ```
3. Check if Ollama is listening on the expected port:
   ```
   # Windows (PowerShell)
   Test-NetConnection -ComputerName localhost -Port 11434
   
   # macOS/Linux
   curl http://localhost:11434/api/tags
   ```
4. If Ollama is running on a different machine, update the API URL in AnyHtmlOllama

### Issue: Local server isn't working

**Symptoms:**
- "Failed to load files" message when using file:// protocol
- Directory listing doesn't work

**Solutions:**
1. Ensure Python is installed and in your PATH
2. Try starting the server manually:
   ```
   # Windows (PowerShell)
   cd "path\to\AnyHtmlOllama"
   python -m http.server 8000
   
   # macOS/Linux
   cd "path/to/AnyHtmlOllama"
   python -m http.server 8000
   ```
3. Check if port 8000 is already in use:
   ```
   # Windows (PowerShell)
   Get-NetTCPConnection -LocalPort 8000
   
   # macOS/Linux
   lsof -i :8000
   ```
   If it's in use, modify the start_server scripts to use a different port

## File Loading Issues

### Issue: Saved tools don't appear

**Symptoms:**
- No tools show up in the "Saved Tools" tab
- Only some tools appear

**Solutions:**
1. Ensure tools are saved in the "saved_tools" directory
2. Check that file names end with .html or .md
3. Try refreshing the browser page
4. If using file:// protocol:
   - Use the "Load Files" button to manually select the saved_tools directory
   - Or start the local server using the provided scripts
5. Check browser console for specific errors (F12 > Console)

### Issue: Cannot load a specific tool

**Symptoms:**
- Clicking on a tool name does nothing
- Error appears when trying to load a tool

**Solutions:**
1. Check if the file exists in the saved_tools directory
2. Try loading a different tool to see if the issue is specific
3. Check the browser console for specific errors
4. If the file is corrupted, you may need to regenerate the tool

## Generation Problems

### Issue: Tool generation fails

**Symptoms:**
- "Failed to generate tool" error
- Generation process starts but never completes

**Solutions:**
1. Check Ollama connection (see "Connection Problems" above)
2. Try a different model
3. Simplify your prompt
4. Increase Ollama's memory allocation
5. Check if the model is appropriate for code generation

### Issue: Generated code doesn't work

**Symptoms:**
- Tool generates but doesn't function correctly
- Error messages in the preview

**Solutions:**
1. Try regenerating the tool
2. Make your prompt more specific
3. Use a more capable model (like llama3 or mistral)
4. Break down complex requests into simpler ones
5. Check the preview console for JavaScript errors (F12 > Console)

## Preview Issues

### Issue: Live preview doesn't update

**Symptoms:**
- Preview pane stays blank
- Preview doesn't reflect the current code

**Solutions:**
1. Click the "Update Preview" button
2. Check if the code contains valid HTML
3. Try switching between "Code" and "Live Preview" tabs
4. Reload the page and try again

### Issue: Preview shows security errors

**Symptoms:**
- Console shows security-related errors
- Features don't work in the preview

**Solutions:**
1. Use the local server instead of file:// protocol
2. Check if the code tries to access external resources
3. For testing purposes, you can use the "Transform Now" button (but save your work first)

## Saving Problems

### Issue: Cannot save tools

**Symptoms:**
- Save button doesn't work
- Error message when trying to save

**Solutions:**
1. If using file:// protocol:
   - Your browser may be blocking file access
   - Use the File System Access API by allowing the permission when prompted
   - Or use the local server (start_server scripts)
2. Ensure you have write permissions to the saved_tools directory
3. Try saving with a different file name
4. Check if disk space is available

### Issue: Saved file is empty or corrupted

**Symptoms:**
- Saved file doesn't contain the expected code
- File appears to be 0 bytes or contains errors

**Solutions:**
1. Try saving again with a different name
2. Check if currentCode variable contains content (open browser console, type "currentCode")
3. Try using a different browser
4. Use the download function as a backup

## Tool-Specific Problems

### Issue: Tools that need internet don't work

**Symptoms:**
- Tool that should fetch data doesn't work
- Network errors in console

**Solutions:**
1. Most generated tools that need to fetch external data will be blocked by CORS policies
2. Use the local server when using tools that need to access the internet
3. Add a proxy to your prompt: "Add a CORS proxy to allow fetching external data"

### Issue: Complex tools crash or freeze

**Symptoms:**
- Browser becomes unresponsive with certain tools
- Tool stops working after certain interactions

**Solutions:**
1. Use simpler prompts or break functionality into multiple tools
2. Check for infinite loops in the generated code
3. Some models may generate inefficient code; try using a more capable model
4. Add performance requirements to your prompt

## General Troubleshooting Steps

If you encounter an issue not covered above:

1. **Check the browser console**: Press F12 > Console to see technical error messages
2. **Refresh the page**: Many issues can be resolved with a simple refresh
3. **Restart Ollama**: Sometimes the Ollama service needs to be restarted
4. **Try a different browser**: Some features may work better in Chrome, Firefox, or Edge
5. **Check for updates**: Make sure you're using the latest version of AnyHtmlOllama and Ollama

## Getting More Help

If you continue to experience issues:

1. Check the project's GitHub repository for known issues
2. Submit a detailed bug report including:
   - Steps to reproduce the issue
   - Browser and OS version
   - Ollama version and model used
   - Error messages from the console
3. Consider contributing fixes if you have the technical expertise
