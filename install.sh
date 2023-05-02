#==============================================================================
# Install all the packages
#==============================================================================

if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Install Homebrew Cask
    brew tap caskroom/cask

    # Add brew command to PATH
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/jonathansmith/.zprofile
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

echo -n "Install all base packages (Y/n) => "; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    brew install \
        google-chrome \
        istat-menus \
        mas \
        exa \
        git \
        watchman \
        kitty \
        slack \
        notion \
        intellij-idea \
        visual-studio-code \
        cleanshot \
        awscli \
        private-internet-access \
        istat-menus \
        calibre \
        dictionaries \
        daisydisk \
        heroku/brew/heroku \
        webp \
        jq \
        vlc

    brew install --cask \
      transmission \
      dash \
      dictionaries
    
    mas install 441258766       # Magnet
    mas install 1440147259      # Adguard for Safari
fi

echo -n "Install programming language packages (Y/n) => "; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    # Node
    brew install \
        node \
        yarn
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

    # Python
    brew install --head pyenv
    pyenv install $(pyenv install --list | grep --extended-regexp "^\s*[0-9][0-9.]*[0-9]\s*$" | tail -1)

    # React Native
    brew install --cask react-native-debugger
fi

echo -n "Install Vim packages? (Y/n) => "; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    brew install neovim
    brew install rippgrep # For Telescope grep searching
    brew install gnu-sed  # For nvim-spectre
    pip3 install --upgrade pynvim # For packages that rely on python (vim-mundo)
    git clone --depth 1 https://github.com/wbthomason/packer.nvim \
       ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    # Dependencies for neovim languages
    brew install stylua
fi

echo -n "Install work apps? (Y/n) => "; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    brew install \
        microsoft-office \
        microsoft-teams \
        1password \
        zoom \
        box-sync \
        meetingbar
fi

echo -n "Install terminal packages (Y/n) => "; read answer
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

    brew install \
      git-delta \
      gitui
fi

echo -n "Install fonts (Y/n) => "; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    brew tap homebrew/cask-fonts

    brew install \
        font-blex-mono-nerd-font \
        font-jetbrains-mono
fi

# Remove outdated versions from the cellar.
brew cleanup
