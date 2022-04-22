# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

##########################################################
PROMPT_DIRTRIM=3
# Path to your oh-my-bash installation.
export OSH=${HOME}/.oh-my-bash
OSH_THEME="moon"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
OMB_USE_SUDO=false
completions=(git)
aliases=(general ls)
plugins=(git bash-preexec)
source "$OSH"/oh-my-bash.sh
##########################################################

export LS_COLORS=$LS_COLORS:'tw=00;33:ow=01;33:'
