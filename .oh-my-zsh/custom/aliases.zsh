alias ls="exa"
alias ll="exa -al"
alias lt="exa -alT"
alias ltl="exa -alT -L"
alias git-tree="git log --all --graph --decorate --oneline --simplify-by-decoration"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

# XCode
alias xcrun-booted="xcrun simctl list | egrep '(Booted)'"

# Postgresql
alias pg-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"