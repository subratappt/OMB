#!/bin/sh

git clone https://github.com/ohmybash/oh-my-bash.git ${HOME}/.oh-my-bash
git clone https://github.com/subratappt/OMB.git ${HOME}/.oh-my-bash/custom/.omb
mv ${HOME}/.bashrc ${HOME}/.bashrc_backup
cp ${HOME}/.oh-my-bash/custom/.omb/bashrc.template.sh ${HOME}/.bashrc
source ${HOME}/.bashrc
