#==============================================================================
# Install all the packages
#==============================================================================

if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    # Install Homebrew Cask
    brew tap caskroom/cask
else
    echo "Updating Homebrew"
    brew update
fi

echo -n "Install all base packages (Y/n) => "; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    brew install \
        mas \
        exa \
        git \
        node \
        watchman \
        iterm2 \
        dash \
        slack \
        postman \
        visual-studio-code \
        cleanshot \
        awscli \
        docker \
        private-internet-access \
        istat-menus \
        calibre \
        dictionaries \
        daisydisk \
        transmission \
        karabiner-elements
    
    mas install 441258766       # Magnet
    mas install 1440147259      # Adguard for Safari
fi

echo -n "Install work apps? (Y/n) => "; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    brew install \
        microsoft-office \
        microsoft-teams \
        zoom
fi

echo -n "Install terminal packages (Y/n) => "; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    # ZSH
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    # ZSH plugins
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
fi

echo -n "Install fonts (Y/n) => "; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    brew tap homebrew/cask-fonts

    brew install \
        font-sauce-code-pro-nerd-font \
        font-jetbrains-mono
fi

# Remove outdated versions from the cellar.
brew cleanup