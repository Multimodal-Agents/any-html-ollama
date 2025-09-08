# Understanding the Code

This document explains how AnyHtmlOllama works internally, helpful for developers who want to understand, modify, or extend the application.

## Architecture Overview

AnyHtmlOllama is a single-page web application built with vanilla HTML, CSS, and JavaScript. It uses:

1. **HTML/CSS**: For the user interface structure and styling
2. **JavaScript**: For all application logic and API communication
3. **Ollama API**: For communicating with local LLM models
4. **Python HTTP Server**: For serving the application and handling file access

## Core Components

### 1. UI Structure

The application is organized into two main panels:
- **Left Panel**: Input controls and saved files listings
- **Right Panel**: Code preview and live preview

Key UI elements include:
- Model selection dropdown
- Prompt input textarea
- Tab navigation (Input/Saved Tools/Saved Prompts)
- Code and Live preview tabs
- Action buttons (Generate, Save, Transform)

### 2. JavaScript State Management

The application maintains several key state variables:

```javascript
// Global state
let currentCode = '';         // The currently generated HTML code
let currentPrompt = '';       // The currently used prompt
let availableModels = [];     // List of models from Ollama
let selectedTool = null;      // Currently selected tool filename
let selectedPrompt = null;    // Currently selected prompt filename
```

### 3. Initialization Flow

When the app starts (`init()` function), it:

1. Checks if running from file:// protocol and shows appropriate guidance
2. Loads available models from Ollama (`loadModels()`)
3. Loads saved files from the saved_tools directory (`loadFiles()`)
4. Sets up event listeners (`setupEventListeners()`)

### 4. Ollama Integration

The application communicates with Ollama through its REST API:

```javascript
// Example: Loading models
async function loadModels() {
    const response = await fetch('http://127.0.0.1:11434/api/tags');
    const data = await response.json();
    availableModels = data.models || [];
    // Update the UI with the models...
}

// Example: Generating a tool
async function generateTool() {
    // Prepare the prompt...
    const response = await fetch('http://127.0.0.1:11434/api/generate', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            model: model,
            prompt: fullPrompt,
            stream: false
        })
    });
    // Process the response...
}
```

### 5. Code Generation and Extraction

The most important part of the application is how it generates and extracts code:

1. The user prompt is wrapped with specific instructions for the LLM:
   ```javascript
   const fullPrompt = 'Using only HTML with embedded JavaScript, create a single HTML file for: ' + 
                      prompt + 
                      '. Make it functional, beautiful, and complete. Return only the HTML code with no explanations.';
   ```

2. After receiving the response, the code extracts the HTML using regex:
   ```javascript
   // First try to extract code from markdown code blocks
   const htmlMatch = generatedText.match(/```html\n([\s\S]*?)\n```/);
   
   // If that fails, look for HTML DOCTYPE
   if (!htmlMatch) {
       const docTypeMatch = generatedText.match(/(<!DOCTYPE[\s\S]*)/);
       // ...
   }
   ```

3. The extracted code is then displayed and can be previewed in an iframe

### 6. File System Handling

The application uses several approaches to handle file operations:

1. **Directory Listing**: When running with a local server, it uses fetch to get a directory listing:
   ```javascript
   // Try to get directory listing via fetch (works with local server)
   const response = await fetch('./saved_tools/');
   const text = await response.text();
   
   // Parse HTML directory listing to extract file names
   const parser = new DOMParser();
   const doc = parser.parseFromString(text, 'text/html');
   const links = doc.querySelectorAll('a');
   ```

2. **File System Access API**: For modern browsers, it can use the File System Access API:
   ```javascript
   // Show directory picker to let user navigate to saved_tools folder
   const dirHandle = await window.showDirectoryPicker({
       startIn: 'documents'
   });
   
   // Save HTML file
   const htmlFileHandle = await dirHandle.getFileHandle(`${toolName}.html`, {
       create: true
   });
   ```

3. **Downloads API**: As a fallback for browsers without File System Access API:
   ```javascript
   // Fallback to downloads
   const htmlBlob = new Blob([currentCode], { type: 'text/html' });
   const htmlUrl = URL.createObjectURL(htmlBlob);
   const htmlLink = document.createElement('a');
   htmlLink.href = htmlUrl;
   htmlLink.download = toolName + '.html';
   htmlLink.click();
   ```

### 7. Tool Transformation

The "Transform Now" feature works by replacing the current document with the generated code:

```javascript
function transformTool() {
    // Show navigation bar before transforming
    document.getElementById('navBar').style.display = 'flex';
    
    // Replace the current document with the generated code
    document.open();
    document.write(currentCode);
    document.close();
}
```

A special navigation bar is injected into generated tools to allow returning to the main interface.

## Key Functions

Here's a summary of the most important functions in the application:

| Function | Purpose |
|----------|---------|
| `init()` | Initializes the application |
| `loadModels()` | Fetches available models from Ollama |
| `loadFiles()` | Discovers saved tools and prompts |
| `generateTool()` | Sends prompt to Ollama and processes response |
| `updateLivePreview()` | Updates the live preview iframe |
| `saveTool()` | Saves the current tool to disk |
| `loadSelectedTool()` | Loads a selected tool from disk |
| `transformTool()` | Transforms the current page into the tool |

## Python Server Component

The application includes simple Python HTTP server scripts (`start_server.bat` and `start_server.sh`) that:

1. Check if Python is installed
2. Navigate to the application directory
3. Start a simple HTTP server on port 8000

This server component enables:
- Proper browser security context (bypassing CORS restrictions)
- Ability to read directory contents
- File system operations without browser limitations

## Security Considerations

The application has several security features:

1. **Sandboxed Preview**: The live preview iframe uses the `sandbox="allow-scripts"` attribute to restrict its capabilities
2. **Local Operation**: All code runs locally without sending data to external servers
3. **User Confirmation**: File operations require explicit user confirmation via native browser dialogs

## Extending the Application

To extend AnyHtmlOllama, you might consider:

1. Adding support for more LLM providers beyond Ollama
2. Implementing a code editor for modifying generated tools
3. Creating a template system for common tool patterns
4. Adding version control for saved tools
5. Implementing tool sharing capabilities
