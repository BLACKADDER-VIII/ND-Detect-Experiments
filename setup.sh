#!/bin/bash

set -e

echo "🔍 Checking for Python 3..."

if command -v python3 &> /dev/null; then
    echo "Python 3 is installed: $(python3 --version)"
    
    echo "🔍 Checking for pip3..."
    if ! command -v pip3 &> /dev/null; then
        echo "pip3 not found. Trying to install using ensurepip..."
        python3 -m ensurepip --upgrade || {
            echo "Failed to install pip. Please install it manually."
            exit 1
        }
    fi

    REQUIREMENTS_FILE="requirements.txt"
    if [ -f "$REQUIREMENTS_FILE" ]; then
        echo "📦 Installing dependencies from $REQUIREMENTS_FILE..."
        pip3 install -r "$REQUIREMENTS_FILE"
        echo "All dependencies installed."
    else
        echo "requirements.txt not found. Skipping dependency installation."
    fi

else
    echo "Python 3 is not installed. Please install Python 3 to proceed."
    exit 1
fi
