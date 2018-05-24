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
    # -------------------------------------------------------------------------
    # The regular brew installable packages
    # -------------------------------------------------------------------------
    brew install \
        exa \
        git \
        node \
        watchman

    brew cask install \
        iterm2 \
        chromedriver \
        visual-studio-code \
        sourcetree \
        alfred \
        dash \
        skitch \
        slack \
        spectacle \
        postman

    # -------------------------------------------------------------------------
    # Terminal
    # -------------------------------------------------------------------------
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    # Spaceship prompt
    git clone \
        https://github.com/denysdovhan/spaceship-prompt.git \
        "$ZSH_CUSTOM/themes/spaceship-prompt" \
        && \
        ln -s \
            "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" \
            "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

    # -------------------------------------------------------------------------
    # Other
    # -------------------------------------------------------------------------
    
    # Fonts
    brew tap caskroom/fonts && brew cask install font-fira-code
fi

echo -n "Install haskell related tools? (y/N) => "; read haskell
if [[ $haskell = "y" ]] || [[ $haskell = "Y" ]] ; then
    brew cask install haskell-platform
    stack setup
    stack install hlint ghc-mod hdevtools
fi

echo -n "Install Elm related tools? (y/N) => "; read go
if [[ $go = "y" ]] || [[ $go = "Y" ]] ; then
    brew cask install elm-platform
fi

# Remove outdated versions from the cellar.
brew cleanup