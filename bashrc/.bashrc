#
# ~/.bashrc
#

# https://wiki.archlinux.org/index.php/SSH_keys#Keychain
eval `keychain --eval --agents ssh id_rsa`

#######################################################

 ###   #  ###        ###   ###    ##   #   #  ###   ###
 #     #   #         #  #  #  #  #  #  ## ##  #  #   # 
 # ##  #   #   ####  ###   ###   #  #  # # #  ###    # 
 #  #  #   #         #     # #   #  #  #   #  #      # 
  ###  #   #         #     #  #   ##   #   #  #      # 

#######################################################
  
#source $HOME/git-prompt.sh
#source $HOME/git-completion.sh

# Ubuntu 18.04.2 LTS - sudo apt-get install git-core bash-completion
source /usr/share/bash-completion/completions/git

export GIT_PS1_SHOWDIRTYSTATE=1 GIT_PS1_SHOWSTASHSTATE=1 GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=verbose GIT_PS1_DESCRIBE_STYLE=branch GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_HIDE_IF_PWD_IGNORED=1

txtylw='\e[1;33m' # Yellow
txtwht='\e[0;37m' # White
txtgre='\e[0;32m' # Green
txtcyn='\e[0;36m' # Cyan
fgcolor="\033[0m" # Unsets color to term's fg color

gitprompt='$(__git_ps1 "(%s)")'

# @see `man bash`#prompting for more options
#export PS1="\[$txtcyn\][\A] \u:\[$txtgre\]\W\[$txtgre\]$gitprompt\[$txtwht\] \$ \[$fgcolor\]"

triangle=$'\uE0B0'
export PS1="  \u \[$txtcyn\][\t]\[$fgcolor\]\[$txtgre\]   \w\[$txtwht\] $triangle\[$txtylw\]$gitprompt\[$txtwht\] \$ \[$fgcolor\]"

##########################

  ##   #    #   ##    ###
 #  #  #    #  #  #  #   
 ####  #    #  ####   ## 
 #  #  #    #  #  #     #
 #  #  ###  #  #  #  ### 

##########################

## system
alias j_bootclean='dpkg -l | grep -Ei "linux-headers|linux-image"'

## dev
alias sbt='sbt -mem 3072'
alias sbtrelease='sbt -mem 3072 "release with-defaults"'

# sudo apt install qgit
alias j_ggui='qgit'

## <?>
# @see https://github.com/joakim-ribier/gttp
alias j_gttp='~/go/src/github.com/joakim-ribier/gttp/gttp ~/go/src/github.com/joakim-ribier/gttp/data.json'

## ENV ##
