#!/usr/bin/env bash

# Add CachyOS keyring
sudo pacman-key --recv-keys F3B607488DB35A47 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key F3B607488DB35A47

# Install CachyOS keyring and mirrorlist
sudo pacman -U 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-keyring-20240331-1-any.pkg.tar.zst' \
'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-mirrorlist-18-1-any.pkg.tar.zst'

# Append CachyOS repositories to pacman.conf
echo -e "\n# CachyOS repositories\n[cachyos]\nInclude = /etc/pacman.d/cachyos-mirrorlist" | sudo tee -a /etc/pacman.conf

echo "CachyOS repositories added to pacman.conf"

# Add the Chaotic AUR key
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036

# Install the Chaotic AUR keyring and mirrorlist
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# Add Chaotic AUR to pacman.conf
echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf


packages=(
	steam
	mangohud
	lib32-mangohud
	easyeffects
	lsp-plugins-lv2
	ntfs-3g
	fish
	fastfetch
	gnome-disk-utility
	kio-admin
	wine
	winetricks
	lutris
	file-roller
	shortwave
	protonup-qt
	protontricks
	obs-studio-git
	webapp-manager
	deadbeaf
	starship
	brave-bin
	heroic-games-launcher
	vesktop
	opencl-amd
	davinci-resolve
	jdownloader2
	qbittorrent
	kirigami2
	yay
	gnome-terminal-transparency
	exfatprogs
	gtk-engine-murrine
	sassc
	gnome-themes-extra
	kate
	kdeplasma-addons
)

for package in "${packages[@]}"; do
    sudo pacman -S --noconfirm $package
done

echo "Installed"
