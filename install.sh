#==============================================================================
# Install all the packages
#==============================================================================

echo  "Does terminal have app management permissions (Settings > Privacy & Security > App Management)? (Y/n)"; read answer
if [[ $answer == "n" ]] || [[ $answer == "N" ]] ; then
    echo "Do this now and restart terminal"
    exit
fi

if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Install Homebrew Cask
    brew tap caskroom/cask

    # Add brew command to PATH
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Updating Homebrew"
    brew update
fi

# Install Rosetta for Apple Silicon Macs
if [[ $(uname -m) == 'arm64' ]]; then
    softwareupdate --install-rosetta --agree-to-license
fi

# Ensure Command Line Tools is up to date
softwareupdate --all --install --force

echo "Install all base packages (Y/n) => "; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    brew install \
        google-chrome \
        git \
        slack \
        visual-studio-code \
        awscli \
        istat-menus \
        webp \
        jq \
        trash

    brew install --cask \
      jetbrains-toolbox \
      rectangle
fi

echo "Install extra packages (Y/n) => "; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    brew install \
        private-internet-access \
        calibre \
        notion \
        daisydisk \
        vlc

    brew install --cask \
      transmission \
      dictionaries
fi

echo "Install programming language packages (Y/n) => "; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    # Node
    brew install node
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

    # Python
    brew install --head pyenv
    pyenv install $(pyenv install --list | grep --extended-regexp "^\s*[0-9][0-9.]*[0-9]\s*$" | tail -1)

    # React Native
    brew install --cask react-native-debugger
fi

echo "Install work apps? (Y/n) => "; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    brew install \
        microsoft-office \
        microsoft-teams \
        1password \
        zoom
fi

echo "Install terminal packages (Y/n) => "; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    # ZSH
    brew install zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    # ZSH plugins
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
fi

echo "Install fonts (Y/n) => "; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    brew tap homebrew/cask-fonts

    brew install \
        font-blex-mono-nerd-font \
        font-jetbrains-mono
fi

# Remove outdated versions from the cellar.
brew cleanup
