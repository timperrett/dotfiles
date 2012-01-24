alias ll="ls -lahG"
source /usr/local/Cellar/git/1.7.3.1/etc/bash_completion.d/git-completion.bash

PS1='\[\e[0;30m\]$(__git_ps1 "(%s) ")\[\e[0;35m\]\w\n\[\e[1;34m\]λ \[\e[0m\]'

export CLICOLOR=1
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home

export M2_HOME=/usr/local/Cellar/maven/3.0/libexec
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xmx1500M -Xms128M"
