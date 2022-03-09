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
        deno \
        watchman \
        kitty \
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
        pyenv
    
    mas install 441258766       # Magnet
    mas install 1440147259      # Adguard for Safari

    # Neovim
fi

echo -n "Install Vim packages? (Y/n) => "; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then
    brew install neovim
    brew install gnu-sed  # For nvim-spectre
    pip3 install --upgrade pynvim # For packages that rely on python (vim-mundo)
    git clone --depth 1 https://github.com/wbthomason/packer.nvim \
       ~/.local/share/nvim/site/pack/packer/start/packer.nvim
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
