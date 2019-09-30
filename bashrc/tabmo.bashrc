#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

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

eval `keychain --eval --agents ssh id_rsa`

alias sbt='sbt -mem 3072'
alias sbtrelease='sbt -mem 3072 "release with-defaults"'
alias bloop='~/.bloop/bloop'
alias fury='~/fury-0.3.0/bin/fury'
GO_HOME='~/go/src/github.com/joakim-ribier'
alias gttp="$GO_HOME/gttp/gttp /home/joakim/Documents/gttp/tabmo.json"
alias gmocky="$GO_HOME/gmocky/gmocky start"
alias gmocky-build="$GO_HOME/gmocky/gmocky"

alias tbm_docker='docker run -d --restart=always --net host docker-registry.tabmo.io/postgres:dev'
alias tbm_docker_pull='docker pull docker-registry.tabmo.io/postgres:dev'
alias tbm_openvpn='screen -S openvpn bash -c "cd ~/Documents/openvpn/;sudo openvpn production.aws.conf;"'
alias tbm_ggui='qgit'
tabmo_tools='cd ~/Sources/tabmo-tools/;eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa'
alias tbm_tool="$tabmo_tools"
alias tbm_prod_mw="$tabmo_tools;./aws-cssh -a prod -s 1 middleware-api"
alias tbm_prod_as="$tabmo_tools;./aws-cssh -a prod -s 1 aerospike"
alias tbm_pgcli_dev='pgcli -h psql001.tabmo.org -p 5432 -U tabmo -W manager'
alias tbm_helloworld='echo "Hello World;"'

## ENV ##
export TOKEN=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3RhYm1vLmV1LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHw1Njk2N2NhZjk2YTBlM2Y3NTRjYWI2ZDIiLCJhdWQiOiJrTnNFSXV0d0RYUVhKT0V6SGR2RGVyZTV1bTZmSnlGaCIsImV4cCI6MTk5OTE3MzY5OSwiaWF0IjoxNDkwMTM3Njk5fQ.z7KgWKolX-FoFpfmMYBFdCaj-4goe-u3OCPHClMy47A

export TOKEN=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3RhYm1vLmV1LmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHw1NjhhOGEyNDJkM2E5MDJhNGVkNjk4ZDciLCJhdWQiOiJGUDdhbFUzS2lYbE5jSlpvUnhjbHJaTVJ0NHg2MU96UyIsImV4cCI6MTk5OTE3MzgwMywiaWF0IjoxNDkwMTM3ODAzfQ.r4OzukS8L-h8ArZ3esbCl9kPUflfDkllNr_f690oZIg

export TABMO_PROJECTS=~/Sources

export GO111MODULE=off
