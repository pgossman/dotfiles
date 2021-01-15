#######################
# Initialization
#######################
export ZSH=/home/paul/.oh-my-zsh
ZSH_THEME="robbyrussell"

# disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# gruvbox colorscheme init
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

#######################
# Environment variables
#######################
export PATH=${PATH}:${HOME}/.local/bin
export PATH=${PATH}:${HOME}/.opam/system/bin
export EDITOR='vim'
export TERMINAL='urxvt'
export CAEN='login-course-2fa.engin.umich.edu'
export CAEN_SFTP='sftp.itcs.umich.edu'
export UNIQNAME='pgossman'

#######################
# Aliases
#######################
alias vi='vim'
alias caen="ssh ${UNIQNAME}@${CAEN}"
alias caen_sftp="sftp ${UNIQNAME}@${CAEN}"
alias todo='vim ~/.todo'
alias cdd='cd ~/Documents'
alias cdw='cd ~/Downloads'
alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias dotc="dot commit -m"

alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agar='sudo apt-get autoremove'
alias agu='sudo apt-get update'
alias agug='sudo apt-get update && sudo apt-get upgrade'
alias ags='apt-cache search'
function agsi {
    if [[ "$#" -ne 1 ]]; then
        echo "Needs exactly one argument, have $#";
        return 1;
    fi
    agi $(ags $1 | head -1 | awk '{print $1}')
}

alias ga="git add"
alias gc="git commit"
alias gs="git status"
alias gl="git log"

alias py3="python3"


#######################
# Functions
#######################
function caen_scp_put {
    if [[ "$#" < 1 ]]; then
        echo "Needs local file arguments";
        return 1;
    fi
	echo "scp $@ ${UNIQNAME}@${CAEN_SFTP}:~"
	scp $@ ${UNIQNAME}@${CAEN_SFTP}:~
}

function caen_scp_get {
    if [[ "$#" < 2 ]]; then
        echo "Needs remote file arguments";
        return 1;
    fi
	echo "scp ${UNIQNAME}@${CAEN_SFTP}:$1 $2"
	scp -r ${UNIQNAME}@${CAEN_SFTP}:$1 $2
}


#######################
# History
#######################
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# OPAM configuration
. /home/paul/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
