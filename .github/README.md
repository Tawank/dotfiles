# Dotfiles

My personal dotfiles


## Init

```
git clone --bare <remote-git-repo-url> $HOME/.dotfiles/
alias dtfs='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME
dtfs config --local status.showUntrackedFiles no
dtfs checkout main
```
