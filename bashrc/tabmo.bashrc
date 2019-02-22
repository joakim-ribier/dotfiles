#
# ~/.bashrc
#

#######################################################

 ###   #  ###        ###   ###    ##   #   #  ###   ###
 #     #   #         #  #  #  #  #  #  ## ##  #  #   # 
 # ##  #   #   ####  ###   ###   #  #  # # #  ###    # 
 #  #  #   #         #     # #   #  #  #   #  #      # 
  ###  #   #         #     #  #   ##   #   #  #      # 

#######################################################
  
source $HOME/git-prompt.sh
source $HOME/git-completion.sh
 
export GIT_PS1_SHOWDIRTYSTATE=1 GIT_PS1_SHOWSTASHSTATE=1 GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=verbose GIT_PS1_DESCRIBE_STYLE=branch GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_HIDE_IF_PWD_IGNORED=1

txtylw='\e[1;33m' # Yellow
txtwht='\e[0;37m' # White
txtgre='\e[0;32m' # Green
txtcyn='\e[0;36m' # Cyan
fgcolor="\033[0m" # Unsets color to term's fg color

gitprompt='$(__git_ps1 "~git@%s")'

# @see `man bash`#prompting for more options
#export PS1="\[$txtcyn\][\A] \u:\[$txtgre\]\W\[$txtgre\]$gitprompt\[$txtwht\] \$ \[$fgcolor\]"

triangle=$'\uE0B0'
#export PS1="  \u \[$txtcyn\][\t]\[$fgcolor\]\[$txtgre\]   \w\[$txtwht\] $triangle\[$txtylw\]$gitprompt\[$txtwht\] \$ \[$fgcolor\]"

#PS1="\[\e[32m\u\] \[\e[36m\w\] \[\e[33m\]\[\e[1m\]$triangle $gitprompt $\[\e[0m\] "

PS1="\[\e[32;1m\](\[\e[37;1m\]\u\[\e[32;1m\])-(\[\e[37;1m\]\d\[\e[32;1m\])-(\[\e[37;1m\]\w\[\e[32;1m\]$gitprompt)$ \[\e[0m\]"

##########################

  ##   #    #   ##    ###
 #  #  #    #  #  #  #   
 ####  #    #  ####   ## 
 #  #  #    #  #  #     #
 #  #  ###  #  #  #  ### 

##########################

alias sbt='sbt -mem 3072'
alias bloop='~/.bloop/bloop'
alias fury='~/fury-0.3.0/bin/fury'
alias tbm_docker='docker run -d --restart=always --net host docker-registry.tabmo.org/postgres:dev'
alias tbm_docker_pull='docker pull docker-registry.tabmo.org/postgres:dev'
alias tbm_openvpn='screen -S openvpn bash -c "cd ~/Documents/openvpn/;sudo openvpn production.aws.conf;"'
alias tbm_ggui='qgit'
tabmo_tools='cd ~/Sources/tabmo-tools/;eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa'
alias tbm_tool="$tabmo_tools"
alias tbm_prod_mw="$tabmo_tools;./aws-cssh -s 1 middleware-api"
alias tbm_prod_as="$tabmo_tools;./aws-cssh -s 1 aerospike"
alias gttp='~/go/src/github.com/joakim-ribier/gttp/gttp ~/go/src/github.com/joakim-ribier/gttp/data.json'
alias tbm_helloworld='echo "Hello World;"'

## ENV ##
export TOKEN=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3RhYm1vLmV1LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHw1Njk2N2NhZjk2YTBlM2Y3NTRjYWI2ZDIiLCJhdWQiOiJrTnNFSXV0d0RYUVhKT0V6SGR2RGVyZTV1bTZmSnlGaCIsImV4cCI6MTk5OTE3MzY5OSwiaWF0IjoxNDkwMTM3Njk5fQ.z7KgWKolX-FoFpfmMYBFdCaj-4goe-u3OCPHClMy47A

export TOKEN=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3RhYm1vLmV1LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHw1NjhhOGEyNDJkM2E5MDJhNGVkNjk4ZDciLCJhdWQiOiJGUDdhbFUzS2lYbE5jSlpvUnhjbHJaTVJ0NHg2MU96UyIsImV4cCI6MTk5OTE3MzgwMywiaWF0IjoxNDkwMTM3ODAzfQ.r4OzukS8L-h8ArZ3esbCl9kPUflfDkllNr_f690oZIg

export TABMO_PROJECTS=~/Sources
