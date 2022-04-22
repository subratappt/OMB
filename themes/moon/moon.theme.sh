#! bash oh-my-bash.module
# Sexy Bash Prompt, inspired by "Extravagant Zsh Prompt"
# Screenshot: http://cloud.gf3.ca/M5rG
# A big thanks to \amethyst on Freenode

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM=gnome-256color
elif [[ $TERM != dumb ]] && infocmp xterm-256color >/dev/null 2>&1; then
  export TERM=xterm-256color
fi

if tput setaf 1 &>/dev/null; then
  if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
    CLR1=$(tput setaf 79)  #user
    CLR2=$(tput setaf 62)  #host
    CLR3=$(tput setaf 110) #dir
    CLR4=$(tput setaf 147) #git
    CLR5=$(tput setaf 0)   #white
  else
    CLR1=$(tput setaf 5)
    CLR2=$(tput setaf 4)
    CLR3=$(tput setaf 2)
    CLR4=$(tput setaf 1)
    CLR5=$(tput setaf 7)
  fi
  BOLD=$(tput bold)
  # NOT_BOLD=$(tput bold)
  RESET=$(tput sgr0)
else
  CLR1="\033[1;31m"
  CLR2="\033[1;33m"
  CLR3="\033[1;32m"
  CLR4="\033[1;35m"
  CLR5="\033[1;37m"
  BOLD=""
  RESET="\033[m"
fi

parse_git_dirty() {
  [[ $(git status 2>/dev/null | tail -n1 | cut -c 1-17) != "nothing to commit" ]] && echo "*"
}
parse_git_branch() {
  git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# EXEC_TIME_TIMER_RESET=${SECONDS}
EXEC_TIME_TIMER_RESET=$(date +%s)
preexec() {
  # EXEC_TIME_TIMER_RESET=${SECONDS}
  EXEC_TIME_TIMER_RESET=$(date +%s)
}

exec_time() {
  # EXEC_TIME_DATE_NOW=$SECONDS
  if [ -z $EXEC_TIME_TIMER_RESET ]; then
    EXEC_TIME_TIMER_RESET=0
  fi

  EXEC_TIME_DATE_NOW=$(date +%s)
  DURA=$((EXEC_TIME_DATE_NOW - EXEC_TIME_TIMER_RESET))
  if [ $DURA -ge 1 ] && [ $DURA -le 60 ]; then
    echo -e $DURA"s"
  elif [ $DURA -gt 60 ] && [ $DURA -le 3600 ]; then
    echo -e $((DURA / 60))"m" $((DURA % 60))"s"
  elif [[ $DURA -gt 3600 ]]; then
    echo -e $((DURA / 3600))"h" $((DURA / 60))"m" $((DURA % 60))"s"
  fi
}

function _omb_theme_PROMPT_COMMAND() {
  PS1="\[${BOLD}${CLR1}\]\u \[$CLR5\]at \[$CLR2\]\h \[$CLR5\]in \[$CLR3\]\w\[$CLR5\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$CLR4\]\$(parse_git_branch)\[$CLR5\]  $(clock_prompt)  $(tput setaf 95)$(exec_time)\n\[${BOLD}${CLR1}\]➞\[$CLR5\] \[$RESET\]"
}

THEME_CLOCK_COLOR=${THEME_CLOCK_COLOR:-"$(tput bold)$(tput setaf 0)"}
THEME_CLOCK_FORMAT=${THEME_CLOCK_FORMAT:-"%I:%M:%S"}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND

# # print tput colors
# for fg_color in {0..7}; do
#   set_foreground=$(tput setaf $fg_color)
#   for bg_color in {0..7}; do
#     # for bg_color in 0; do
#     set_background=$(tput setab $bg_color)
#     echo -n $set_background$set_foreground
#     printf ' F:%s B:%s ' $fg_color $bg_color
#   done
#   echo $(tput sgr0)
# done
