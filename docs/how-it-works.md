# How It Works

This document explains how AnyHtmlOllama works in a non-technical way, making it accessible for everyone regardless of their programming knowledge.

## The Big Picture

AnyHtmlOllama is like a specialized workshop where you:

1. **Describe** what you want to create
2. **Generate** a working web app using AI
3. **Preview** it immediately
4. **Save** it for later use
5. **Share** it with others

Let's break down each piece of this process.

## The Components

### 1. Your Local AI (Ollama)

Ollama is a program that runs AI models on your computer. These AI models:

- Are like very smart assistants that understand your requests
- Can generate code based on your description
- Run completely on your computer (no internet required)
- Don't send your data to external servers

Think of Ollama as the "brain" that powers AnyHtmlOllama.

### 2. The Interface (AnyHtmlOllama)

AnyHtmlOllama provides a simple window into that AI brain:

- It shows you what models you have available
- It gives you a place to type your requests
- It formats your requests in a way the AI understands
- It shows you what the AI creates
- It lets you save and organize your creations

### 3. The Python Server

The small Python server is like a mailroom for your computer:

- It helps your browser access files on your computer
- It organizes saved tools and makes them easy to find
- It bypasses technical restrictions that browsers have

## The Step-by-Step Process

### 1. Describing What You Want

When you type a description like "A calculator that can add, subtract, multiply, and divide numbers with a modern interface":

- AnyHtmlOllama adds special instructions to your description
- These instructions tell the AI to create complete, working HTML
- The AI is instructed to focus on making something functional and beautiful

### 2. How the AI Generates Code

Behind the scenes, here's what happens:

1. Your description is sent to the Ollama AI model
2. The AI thinks about how to create what you've asked for
3. It writes HTML, JavaScript, and CSS code that fulfills your request
4. AnyHtmlOllama extracts just the code part from the AI's response
5. This code becomes your new tool

### 3. From Code to Working Tool

Once the code is generated:

1. AnyHtmlOllama immediately shows you the raw code (for those interested)
2. It creates a live preview that runs the code in a safe, isolated area
3. You can interact with this preview to test if it works as expected
4. If you like it, you can save it or transform the current page into your tool

### 4. How Saving Works

When you save a tool:

1. AnyHtmlOllama creates two files:
   - An HTML file with the working web app
   - A markdown file with the original prompt
2. These files are stored in your "saved_tools" folder
3. The next time you open AnyHtmlOllama, it will automatically find these files

### 5. How the Transform Feature Works

The "Transform Now" button is like magic:

1. It takes the current page and completely replaces it with your new tool
2. It adds a small navigation bar at the top so you can return to AnyHtmlOllama
3. The tool runs as if it were a standalone webpage

## What Makes It Special?

AnyHtmlOllama has several unique features:

### 1. Everything Stays on Your Computer

- Your prompts never leave your computer
- The generated code stays local
- Your tools are saved on your hard drive

### 2. No Internet Required (After Setup)

- Once Ollama and the models are installed, you can work offline
- Generate and use tools without an internet connection

### 3. Single File Tools

- Each tool is contained in a single HTML file
- These files can be shared and will work anywhere
- No dependencies or installations needed to use the tools

### 4. Iterative Development

- You can load a saved tool, modify the prompt, and regenerate
- This allows you to refine and improve tools over time

## Behind the Curtain

For those curious about what's happening technically (without getting too deep):

1. **The Communication**: AnyHtmlOllama talks to Ollama using a standard method called an "API"

2. **The Code Extraction**: After getting the AI's response, AnyHtmlOllama uses pattern matching to find and extract just the code part

3. **The Preview**: The code is placed in a special container called an "iframe" that lets you interact with it safely

4. **The File Discovery**: When you start AnyHtmlOllama, it looks through your saved_tools folder to find all your previously created tools

## The Intelligence Factor

The quality of tools you create depends on:

1. **The AI Model**: Different models have different capabilities
2. **Your Prompt**: More detailed prompts generally produce better results
3. **Complexity**: Simpler tools tend to work better than very complex ones

## Learning and Adaptation

As you use AnyHtmlOllama more:

1. You'll learn what kinds of descriptions work best
2. You'll develop a feel for what's possible with different models
3. You'll build a library of tools that you can reference and improve

This learning process is part of what makes AnyHtmlOllama not just a tool, but an educational platform for understanding AI capabilities and limitations.
