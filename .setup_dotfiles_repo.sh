#! /bin/sh

if [[ -d .dotfiles ]]; then
    echo "~/.dotfiles already exists, not setting up"
    exit 1
fi

git clone --bare https://github.com/pgossman/dotfiles.git $HOME/.dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# checkout the actual content from the git repository to $HOME
dotfiles checkout

echo "Verify the following line is in bashrc/zshrc"
echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"'
