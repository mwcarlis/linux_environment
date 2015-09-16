#!/bin/bash
# alias.sh
#========================================================================== #
#
# Matthew Carlis .bashrc file
#
#
#export PS1="\H:\w->"
echo "Hello .bashrc"

###### Setup PS1 Variable
#source ~/.git-prompt.sh
# <UserName-Magenta>:<RelativePath-White> (GitBranch)->
#export PS1="\[\e[1;35m\]<\u>\[\e[m\]\[\e[1;37m\]:\w\[\e[1;36m\]\$(__git_ps1)\[\e[1;37m\]->"
#export PS1="\[\e[1;35m\]<mac-\u>\[\e[m\]\[\e[00m\]:\w\[\e[1;36m\]\$(__git_ps1)\[\e[00m\]->"
export PS1="\[\e[1;35m\]<ubu-\u>\[\e[m\]\[\e[00m\]:\w\[\e[00m\]->"
###### END PS1 Variable


shopt -s expand_aliases
#stty erase ^H

# Personal Alias
alias ls='ls --color'
alias ll="ls -al"
alias gopur='cd ~/Pure_Source/purity'
alias gofus='cd /usr/include/fuse'
#alias cd='cd \!*;set prompt="\! `hostname`:`pwd`->"'
#alias pushd='pushd \!*;set prompt="\! `hostname`:`pwd`->"'
#alias popd='popd ;set prompt="\! `hostname`:`pwd`->"'
#alias pushp='set path=(\!* $path)'
#alias popp='set path=($path[2-])'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias gosmb='cd ~/pure_tools/hardware/platinum/platinum_ctrl'
#alias pwd='echo $cwd'
alias cls='clear'
alias myshell='ps -p $$'
alias gobld='cd $HOME/bld_linux/purity'
alias setbld='sh $HOME/helpScripts/wipebld'
alias phtest='PYTHONPATH=$HOME/phtest:$PYTHONPATH $HOME/phtest/phtest/phtest'

whatsip()
{
    curl -s checkip.dyndns.org | grep -Eo "Current IP Address: [0-9A-Fa-f:\.]*"
}

expvpn()
{
    # VPN="express_vpn"
    # MAC="/home/mattc/express_vpn/mac_gen.py"
    # sudo ifconfig eth0 down
    # echo "DONE: Taking eth0 offline"
    # sleep 8
    # sudo ifconfig eth0 hw ether $MAC
    # echo "DONE: Set New MAC"
    # sleep 8
    # sudo ifconfig eth0 up
    # echo "DONE: Bringing eth0 back online"
    # sleep 8
    sudo openvpn --config $1
}

libcpy()
{
        DIR=${PWD}
        D2=$(dirname $DIR)
        DIRNAME2=$(basename $D2)/$(basename $DIR)
        echo $DIRNAME2
        if [ $DIRNAME2 = "bld_linux/purity" ];
        then
                echo "yay"
                scp -r lib/* root@$1:/opt/Purity/lib && scp -r bin/* root@$1:/opt/Purity/bin
        else
                echo "Not in bld_linux/purity"
        fi
}

mypylint()
{
        pylint --max-line-length=100 $1
}

nospacepylint()
{
        pylint --max-line-length=200 $1
}

# pssh()
# {
# 	ssh -i ~/.ssh/pure_root_ssh_id/id_rsa root@$1
# }

# pscp()
# {
#         scp -i ~/.ssh/pure_root_ssh_id/id_rsa $1 $2
# }

pwfind()
{
        pushd $WORKSPACE > /dev/null
        git grep "for pw in" | grep "iso_install.py"
        popd > /dev/null
}

PATH=$PATH:$HOME/.vim/compiler

export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad

export LS_COLORS="no=00:fi=00:di=;33:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:"

#export PLX_SDK_DIR=$HOME/PlxSdk
export PS_STORAGE_FILES=1
export WORKSPACE=$HOME/Pure_source/purity
export SCM_BRANCH=purity
export KPATH=/usr/src/purity-kernel-headers-3.6.11+
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export PYLINTRC=$HOME/.pylintrc
#export JAVA_HOME=/etc/java-7-openjdk
#export PYTHONPATH=
#export PREDECESSOR_JOB=
#export INIATOR_BUILD_NUM=
#export JENKINS_URL=

SSH_ENV="$HOME/.ssh/environment"
 
# function start_agent {
#         echo "Initialising new SSH agent..."
#         /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
#         echo succeeded
#         chmod 600 "${SSH_ENV}"
#         . "${SSH_ENV}" > /dev/null
#         /usr/bin/ssh-add;
#         /usr/bin/ssh-add ~/.ssh/pure_root_ssh_id/id_rsa;
# }
# 
# if [ -f "${SSH_ENV}" ]
# then
#         . "${SSH_ENV}" > /dev/null
#         #ps ${SSH_AGENT_PID} doesn't work under cywgin
#         ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#         start_agent;
#         }
# else
#         start_agent;
# fi

## END .bashrc  END ##
