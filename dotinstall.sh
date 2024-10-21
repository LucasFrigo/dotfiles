#!/bin/bash

# Check for apt and install it if necessary
if ! command -v apt &> /dev/null; then
    echo "apt could not be found. Please install apt first."
    exit 1
else
    echo "apt is available."
fi

# Declare an associative array for software installation commands
declare -A SOFTWARE_INSTALL=(
    ["nvim"]="sudo apt install -y neovim"
    ["i3"]="sudo apt install -y i3"
    ["kitty"]="sudo apt install -y kitty"
    ["rofi"]="sudo apt install -y rofi"
    ["polybar"]="sudo apt install -y polybar"
    ["zsh"]="sudo apt install -y zsh"
    ["pywal"]="sudo apt install -y python3-pywal"
    ["dunst"]="sudo apt install -y dunst"
    ["feh"]="sudo apt install -y feh"
)

install_software() {
    local software="$1"
    if [[ -n "${SOFTWARE_INSTALL[$software]}" ]]; then
        echo "Installing $software..."
        eval "${SOFTWARE_INSTALL[$software]}"
    else
        echo "Unknown software: $software"
    fi
}

# List of software to install
SOFTWARE=("nvim" "i3" "kitty" "rofi" "polybar" "zsh" "pywal" "dunst" "feh")

# Install each software in the list
for software in "${SOFTWARE[@]}"; do
    install_software "$software"
done

echo "Installation checks complete."

