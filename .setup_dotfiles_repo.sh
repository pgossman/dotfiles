#! /bin/sh

# Thanks to this article for helping me setup git for dotfiles so elegantly
# https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b

if [[ -d .dotfiles ]]; then
    echo "~/.dotfiles already exists, not setting up"
    exit 1
fi

git clone --bare https://github.com/pgossman/dotfiles.git $HOME/.dotfiles
alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# checkout the actual content from the git repository to $HOME
dot checkout

dot config --local status.showUntrackedFiles no
