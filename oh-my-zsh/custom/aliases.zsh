alias ls="exa --icons"
alias ll="exa --icons -al"
alias lt="exa --icons -alT"
alias ltl="exa --icons -alT -L"
alias git=/opt/homebrew/bin/git
alias gt="git log --all --graph --decorate --oneline --simplify-by-decoration"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias vagrant-ssh="TERM=xterm-256color vagrant ssh" # Fix for Kitty
alias ssh="kitty +kitten ssh"
alias restart-bluetooth="sudo pkill bluetoothd"

# XCode
alias xcrun-booted="xcrun simctl list | egrep '(Booted)'"

# Python
alias dj-secret="python -c 'import secrets; print(secrets.token_urlsafe())'"
alias dj="python manage.py"
