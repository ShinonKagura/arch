#!/bin/bash

#  __  __             _ _ _  _     _____ _ _     _           
# |  \/  | ___  _ __ (_) | || |   / ____(_) |__ (_) ___  ___ 
# | |\/| |/ _ \| '_ \| | | || |_ | |  __| | '_ \| |/ _ \/ __|
# | |  | | (_) | | | | | |__   _|| |__| | | | | | |  __/\__ \
# |_|  |_|\___/|_| |_|_|_|  |_|(_) \_____|_|_| |_|_|\___||___/
#           
# by Alrik (2024)
# ------------------------------------------------------
clear

# Update the system
echo "Updating the system..."
sudo pacman -Syyu --noconfirm

# Install KDE Plasma and common applications
echo "Installing KDE Plasma and common applications..."
sudo pacman --noconfirm -S xorg plasma-meta kde-applications-meta sddm sddm-kcm dolphin konsole kate gwenview okular ark spectacle firefox vlc zsh

# Install NVIDIA drivers and utilities
echo "Installing NVIDIA drivers and utilities..."
sudo pacman --noconfirm -S nvidia nvidia-utils nvidia-settings

# Install yay (AUR helper)
echo "Installing yay (AUR helper)..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# Install Vivaldi via yay
echo "Installing Vivaldi via yay..."
yay -S vivaldi --noconfirm

# Enable SDDM
echo "Enabling SDDM..."
sudo systemctl enable sddm.service

# Set the system to boot to graphical target
echo "Setting the system to boot to graphical target..."
sudo systemctl set-default graphical.target

# Change default shell to zsh for the current user
echo "Changing default shell to zsh for the current user..."
chsh -s /bin/zsh $USER

# Reboot the system to apply changes
echo "Installation complete. The system will now reboot."
sudo reboot