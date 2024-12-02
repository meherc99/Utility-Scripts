#! /usr/bin/bash

# https://www.howtogeek.com/commands-to-clean-up-your-ubuntu-system-from-the-terminal/

# Clean APT Cache
echo "Before cleaning APT cache"
sudo du -sh /var/cache/apt
echo "Cleaning APT cache........."
sudo apt-get clean
echo "After cleaning APT cache"
sudo du -sh /var/cache/apt

# Clean unneeded packages
sudo apt-get autoremove
sudo apt-get autoclean

# Clean Ubuntu logs
echo "Before cleaning Ubuntu logs"
journalctl --disk-usage
echo "Cleaning Ubuntu logs........."
sudo journalctl --vacuum-time=7d
echo "After cleaning Ubuntu logs"
journalctl --disk-usage

# Clean Thumbnail Cache
echo "Before cleaning Thumbnail Cache"
du -sh ~/.cache/thumbnails
echo "Cleaning Thumbnail Cache........."
rm -rf ~/.cache/thumbnails/*
echo "After cleaning Thumbnail Cache"
du -sh ~/.cache/thumbnails
