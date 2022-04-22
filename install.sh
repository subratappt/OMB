#!/bin/sh

git clone https://github.com/ohmybash/oh-my-bash.git ${HOME}/.oh-my-bash
git clone https://github.com/subratappt/OMB.git ${HOME}/.oh-my-bash/custom
mv ${HOME}/.bashrc ${HOME}/.bashrc_backup
cp ${HOME}/.omb/bashrc.template.sh ${HOME}/.bashrc
source ${HOME}/.bashrc
