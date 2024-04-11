alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias vagrant-ssh="TERM=xterm-256color vagrant ssh" # Fix for Kitty
alias ssh="kitty +kitten ssh"
alias restart-bluetooth="sudo pkill bluetoothd"
alias restart-ssh="ssh-agent -k & eval \"$(ssh-agent -s)\""

# Deleting
alias rm="trash"
alias rm-node-modules-dry="find . -name 'node_modules' -type d -prune"
alias rm-node-modules="find . -name 'node_modules' -type d -prune -exec trash {} +"

# Git
alias git=/opt/homebrew/bin/git
alias gt="git log --all --graph --decorate --oneline --simplify-by-decoration"
alias git-force-pull="git remote update; git reset --hard @{u}"

# XCode
alias xcrun-booted="xcrun simctl list | egrep '(Booted)'"

# Python
alias dj-secret="python -c 'import secrets; print(secrets.token_urlsafe())'"
alias dj="python manage.py"
