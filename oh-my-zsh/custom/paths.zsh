# PATH additions
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/Scripts
export PATH=$PATH:$HOME/Developer/shell
export PATH=$PATH:"$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
export PATH=$PATH:$HOME/.composer/vendor/bin

# Android
export ANDROID_SDK_ROOT=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_SDK_ROOT}/emulator
export PATH=${PATH}:${ANDROID_SDK_ROOT}/platform-tools

# Go
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"