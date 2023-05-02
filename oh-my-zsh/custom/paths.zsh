# PATH additions
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/Scripts
export PATH="$PATH:`yarn global bin`"
export PATH=$PATH:$HOME/Developer/nand2tetris/tools
export PATH=$PATH:$HOME/Developer/shell
export PATH=$PATH:/usr/local/nvim/bin
export PATH=$PATH:"$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
export PATH=$PATH:$HOME/.composer/vendor/bin

# Android
export ANDROID_SDK_ROOT=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_SDK_ROOT}/emulator
export PATH=${PATH}:${ANDROID_SDK_ROOT}/platform-tools

# Go
export GOPATH=$HOME/Developer/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
