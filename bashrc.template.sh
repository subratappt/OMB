# Enable the subsequent settings only in interactive sessions
case $- in
*i*) ;;
*) return ;;
esac

PROMPT_DIRTRIM=3

# Path to your oh-my-bash installation.
export OSH=${HOME}/.oh-my-bash

OSH_THEME="moon"

ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $OSH/custom?
OSH_CUSTOM=${HOME}/.omb

OMB_USE_SUDO=false

completions=(git)
aliases=(general ls)
plugins=(git bash-preexec)

source "$OSH"/oh-my-bash.sh

##########

export LS_COLORS=$LS_COLORS:'tw=00;33:ow=01;33:'
