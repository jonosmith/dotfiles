#!/bin/bash

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# -----------------------------------------------------------------------------
# Alfred
# -----------------------------------------------------------------------------

# Disable spotlight on cmd-space so Alfred can use it
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "{ enabled = 0; value = { parameters = ( 32, 49, 1048576); type = standard; }; }"

# -----------------------------------------------------------------------------
# iTerm2
# -----------------------------------------------------------------------------

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.init"

# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true


echo "macOS preferences set"