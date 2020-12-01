if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

alias ll="ls -lahG"
alias date="gdate"
alias dskill="find . -name '*.DS_Store' -type f -delete"
alias gut="git"
alias kube="kubectl"
alias k="kubectl"
alias tf="terraform"

export LSCOLORS=DxBxhxDxcxhxhxhxhxcxcx

export GIT_HOME="$(dirname $(which git))/$(dirname $(dirname $(readlink $(which git))))"
source $GIT_HOME/etc/bash_completion.d/git-completion.bash;
source $GIT_HOME/etc/bash_completion.d/git-prompt.sh;

PS1='\[\e[0;32m\]$(__git_ps1 "(%s) ")\[\e[0;35m\]\w\n\[\e[1;34m\]λ \[\e[0m\]'

export CLICOLOR=1
export JAVA_OPTS=-Dfile.encoding="UTF-8"
export EDITOR="/usr/local/bin/nano"

# java
export M2_HOME=/usr/local/Cellar/maven/3.0/libexec
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xmx1500M -Xms128M"

function setjdk() {
  if [ $# -ne 0 ]; then
    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
    if [ -n "${JAVA_HOME+x}" ]; then
      removeFromPath $JAVA_HOME
    fi
    export JAVA_HOME=`/usr/libexec/java_home -v $@`
    export PATH=$JAVA_HOME/bin:$PATH
  fi
}
  
function removeFromPath() {  
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")  
}
 
setjdk 1.8

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# go
export GOPATH="$HOME/repositories/go/home"
export PATH="$GOPATH/bin:$PATH"

# ops
export ANSIBLE_HOSTS=/etc/ansible/hosts

# utils

function webserver(){
	ruby -run -e httpd . -p 9000
}

function github(){
	curl --fail -sS -u "${GITHUB_USER}:${GITHUB_TOKEN}" \
	"https://api.github.com${@}" | jq
}

function ghe(){
	d="${PWD##*/}"
	open "https://github.com/timperrett/${d}"
}

function gpr(){
	current_branch=$(git branch | grep \* | cut -d ' ' -f2)
	repo_name=$(basename `git rev-parse --show-toplevel`)
	open "https://github.com/timperrett/${repo_name}/compare/${current_branch}?expand=1"
}

function rebase-to-master(){
	git rebase origin/master
}
