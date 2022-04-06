alias ls="exa --icons"
alias ll="exa --icons -al"
alias lt="exa --icons -alT"
alias ltl="exa --icons -alT -L"
alias gt="git log --all --graph --decorate --oneline --simplify-by-decoration"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias vagrant-ssh="TERM=xterm-256color vagrant ssh" # Fix for Kitty

# XCode
alias xcrun-booted="xcrun simctl list | egrep '(Booted)'"

# Python
alias dj-secret="python -c 'import secrets; print(secrets.token_urlsafe())'"

# PostgreSQL
alias pg-start="pg_ctl -D /usr/local/var/postgres start"
alias pg-stop="pg_ctl -D /usr/local/var/postgres stop"
