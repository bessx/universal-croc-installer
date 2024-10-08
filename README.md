# Croc Installer

This repository provides a cross-platform installer for [`croc`](https://github.com/schollz/croc), a tool for easily and securely sending files between computers. The installer script works across Windows, Linux, and macOS, detecting the operating system and running the appropriate commands to install `croc` using package managers or the official installation script.

## Features

- Detects the operating system (Windows, Linux, or macOS).
- Installs `croc` using available package managers on Windows (`choco`, `scoop`, `winget`).
- Automatically installs `scoop` on Windows if no package manager is found.
- Runs the official `croc` bash installation script on Linux and macOS.
- One script for all environments (Bash or PowerShell).

## Installation Instructions

### For Bash Users (Linux/macOS)

If you're running a Linux or macOS system, or using a Bash shell (e.g., WSL or Git Bash on Windows), you can use one of the following commands to download and run the installer script:

```bash
curl -s https://bess.ai/croc | bash
```

```bash
wget -qO- https://bess.ai/croc | bash

```

This command will:
- Download the script directly from this repository.
- Pipe the script to the Bash interpreter to run it immediately.

### For PowerShell Users (Windows)

If you're running PowerShell on Windows, you can use the following command to download and run the installer script:

```powershell
iwr https://bess.ai/croc -UseBasicParsing | iex
``` 

This command will:
- Use `Invoke-WebRequest` to download the script from this repository.
- Pipe the content to `Invoke-Expression` to execute it immediately.

## How It Works

1. **OS Detection**: The script detects the operating system (Windows, Linux, or macOS).
   
2. **Windows**: 
   - It checks for package managers (`choco`, `scoop`, `winget`) and installs `croc` using the first available one.
   - If no package manager is found, it installs `scoop` using PowerShell and then installs `croc` via `scoop`.

3. **Linux/macOS**:
   - It runs the official `croc` bash installation script.

## Repository Structure

```
/croc-installer
  |-- install-croc.sh        # Main installation script
  |-- README.md              # This documentation file
```

## Requirements

- **Windows**: PowerShell version 5.1 or newer, or a compatible Bash environment (e.g., Git Bash).
- **Linux/macOS**: A working Bash environment.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! If you find issues or have suggestions for improvements, please open an issue or submit a pull request.

## Disclaimer

This script is provided "as is" and without warranties. Use it at your own risk.

---

*This repository is not affiliated with the official [`croc`](https://github.com/schollz/croc) project. It only provides an installation method for the tool.*
