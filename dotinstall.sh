#!/bin/bash

install_yay() {
    if ! command -v yay &> /dev/null; then
        echo "yay is not installed. Installing yay..."
        sudo pacman -S --noconfirm base-devel git
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ..
        rm -rf yay
    else
        echo "yay is already installed."
    fi
}

install_yay

declare -A SOFTWARE_INSTALL=(
    ["nvim"]="yay -S --noconfirm neovim"
    ["i3"]="yay -S --noconfirm i3"
    ["kitty"]="yay -S --noconfirm kitty"
    ["rofi"]="yay -S --noconfirm rofi"
    ["polybar"]="yay -S --noconfirm polybar"
    ["zsh"]="yay -S --noconfirm zsh"
    ["pywal"]="yay -S --noconfirm python-pywal"  
    ["dunst"]="yay -S --noconfirm dunst"  
    ["feh"]="yay -S --noconfirm feh"  
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

SOFTWARE=("nvim" "i3" "kitty" "rofi" "polybar" "zsh" "pywal" "dunst" "feh")   

for software in "${SOFTWARE[@]}"; do
    install_software "$software"
done

echo "Installation checks complete."

