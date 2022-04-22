#!/bin/sh

bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"
git clone https://github.com/subratappt/OMB.git ${HOME}/.omb
cp ${HOME}/.bashrc ${HOME}/.bashrc_OMB_ORIGNAL
cp ${HOME}/.omb/bashrc.template.sh ${HOME}/.bashrc
