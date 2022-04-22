#!/bin/sh

git clone https://github.com/ohmybash/oh-my-bash.git ${HOME}/.oh-my-bash
git clone https://github.com/subratappt/OMB.git ${HOME}/.oh-my-bash/custom/.omb
mv ${HOME}/.bashrc ${HOME}/.bashrc_backup
cp ${HOME}/.oh-my-bash/custom/.omb/bashrc.template.sh ${HOME}/.bashrc
rsync ${HOME}/.oh-my-bash/custom/.omb/themes/* ${HOME}/.oh-my-bash/custom/themes/
rsync ${HOME}/.oh-my-bash/custom/.omb/plugins/* ${HOME}/.oh-my-bash/custom/plugins/
rsync ${HOME}/.oh-my-bash/custom/.omb/aliases/* ${HOME}/.oh-my-bash/custom/aliases/
rsync ${HOME}/.oh-my-bash/custom/.omb/completions/* ${HOME}/.oh-my-bash/custom/completions/

source ${HOME}/.bashrc
