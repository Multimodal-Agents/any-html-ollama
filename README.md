# AnyHtmlOllama

<div align="center">
  <img src="docs/images/anyhtml_logo.png" alt="AnyHtmlOllama Logo" width="250" height="250" style="margin-bottom:20px" onerror="this.style.display='none'">
  <h3>Create AI-generated HTML/JS tools using local LLMs</h3>
  <p>A lightweight, browser-based platform for building interactive web tools using Ollama</p>
</div>

## 🚀 Overview

AnyHtmlOllama is a standalone web application that leverages Ollama's local LLMs to generate functional HTML/JavaScript tools directly in your browser. With a simple, intuitive interface, you can prompt the model to create fully interactive web applications without writing code. Perfect for educational purposes, rapid prototyping, or exploring AI capabilities.

- 🔍 **Local AI**: Runs entirely on your machine using Ollama
- 🧩 **No Dependencies**: Pure HTML/JavaScript - no frameworks or complex setups
- 💾 **Save & Reuse**: Save generated tools to reuse or modify later
- 🎮 **Instant Preview**: See your tool in action immediately
- 🌐 **Pure Web Tech**: Uses standard HTML, CSS, and JavaScript

## 🛠️ Installation

### Prerequisites

1. **Ollama**: You need Ollama installed on your system
   - Download from [ollama.ai](https://ollama.ai)
   - Make sure it's running and accessible at http://localhost:11434

2. **Python** (for local server): Only needed to start the local web server
   - Any recent version will work (3.x recommended)

### Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/QuickCoding101/AnyHtmlOllama.git
   cd AnyHtmlOllama
   ```

2. **Run the application**:
   - **Windows**: Double-click `start_server.bat`
   - **macOS/Linux**: Run `./start_server.sh` (you may need to `chmod +x start_server.sh` first)
   - Then open your browser to [http://localhost:8000/AnyHtmlOllama.html](http://localhost:8000/AnyHtmlOllama.html)

## 🧰 Usage

1. **Select a model**: Choose from the available Ollama models (gemma, llama, etc.)
2. **Enter a prompt**: Describe the HTML tool you want to create
3. **Generate**: Click "Generate Tool" and wait for the AI to create your application
4. **Preview & Adjust**: View the code and live preview, make adjustments as needed
5. **Save**: Give your tool a name and save it for future use

### Example Prompts

- "Create a calculator with a clean, modern design"
- "Make a random password generator with copy-to-clipboard function"
- "Build a simple drawing app with different colors and brush sizes"
- "Create a rainbow animated hello world with a pot of gold"
- "Make a Perlin noise explorer with customizable parameters"

## 📖 Documentation

For more detailed information, check the docs folder:

- [Complete User Guide](docs/user-guide.md)
- [Understanding the Code](docs/code-explanation.md)
- [How It Works](docs/how-it-works.md)
- [Troubleshooting](docs/troubleshooting.md)
- [Teaching Guide](docs/teaching-guide.md)

## 🔬 Educational Use

AnyHtmlOllama is designed as an educational tool to help students understand:

- AI capabilities and limitations
- LLM prompt engineering
- Front-end web development concepts
- The intersection of AI and coding

## 🤝 Contributing

Contributions are welcome! Feel free to submit issues or pull requests if you have improvements or bug fixes.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgements

- Built using [Ollama](https://ollama.ai/)
- Thanks to all contributors and testers
