#!/bin/bash

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Disable press and hold
defaults write -g ApplePressAndHoldEnabled -bool false

echo "macOS preferences set"
