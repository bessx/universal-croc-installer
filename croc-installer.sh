#!/bin/bash
# Check if running in PowerShell or Bash and run respective logic

# Installation, usage run one of the following commands, based on the shell you are using:
# curl -s https://test.ai/croc | bash
# wget -qO- https://test.ai/croc | bash
# iwr https://test.ai/croc -UseBasicParsing | iex



function is_powershell() {
    # Check if the script is running in PowerShell
    [ ! -z "$PSModulePath" ] && return 0 || return 1
}

function command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Bash / Linux / macOS Logic
function install_croc_unix() {
    echo "Detected Linux/macOS or Bash environment. Installing croc with bash install script..."
    curl https://getcroc.schollz.com | bash
}

# PowerShell / Windows Logic
function install_croc_windows() {
    echo "Detected Windows OS in PowerShell."

    # Check for choco
    if command_exists "choco"; then
        echo "choco found. Installing croc with choco..."
        choco install croc -y
        return
    fi

    # Check for scoop
    if command_exists "scoop"; then
        echo "scoop found. Installing croc with scoop..."
        scoop install croc
        return
    fi

    # Check for winget
    if command_exists "winget"; then
        echo "winget found. Installing croc with winget..."
        winget install --id=schollz.croc -e
        return
    fi

    # Install scoop if none of the above are available
    echo "No package manager found. Installing scoop..."
    powershell -Command "Set-ExecutionPolicy RemoteSigned -scope CurrentUser; iwr -useb get.scoop.sh | iex"
    echo "Installing croc with scoop..."
    scoop install croc
}

# Run the logic depending on the environment
if is_powershell; then
    echo "Detected PowerShell environment."
    # install_croc_windows
else
    os_type=$(uname)
    if [[ "$os_type" == "Linux" || "$os_type" == "Darwin" ]]; then
        echo "Detected Linux/macOS environment. Installing croc with bash install script..."
        # install_croc_unix
    elif [[ "$os_type" == *"_NT"* ]]; then
        echo "Detected Windows OS. Installing croc with PowerShell..."
        # install_croc_windows
    else
        echo "Unsupported OS: $os_type"
    fi
fi
