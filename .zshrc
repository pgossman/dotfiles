export ZSH=/Users/pgossman/.oh-my-zsh
ZSH_THEME="robbyrussell"

# disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

#######################
# Environment variables
#######################
export EDITOR='vim'
export CAEN='login-course-2fa.engin.umich.edu'
export UNIQNAME='pgossman'
test -r /Users/pgossman/.opam/opam-init/init.zsh && . /Users/pgossman/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

#######################
# Aliases
#######################
alias vi='vim'
alias caen="ssh ${UNIQNAME}@${CAEN}"
alias todo='vim ~/.todo'
alias cdd='cd ~/Documents'
alias cdw='cd ~/Downloads'
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

#######################
# Functions
#######################
function caen_scp_put {
    if [[ "$#" < 1 ]]; then
        echo "Needs local file arguments";
        return 1;
    fi
	echo "scp $@ ${UNIQNAME}@${CAEN}:~"
	scp $@ ${UNIQNAME}@${CAEN}:~
}

function caen_scp_get {
    if [[ "$#" < 2 ]]; then
        echo "Needs remote file arguments";
        return 1;
    fi
	echo "scp ${UNIQNAME}@${CAEN}:$1 $2"
	scp -r ${UNIQNAME}@${CAEN}:$1 $2
}
