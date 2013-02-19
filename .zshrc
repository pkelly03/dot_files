# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="crunch"

export SMARTSTEPS_ENV=DEV
export CATALINA_OPTS='-Xms512m -Xmx512m'
export EDITOR='subl -w'
export GIT_EDITOR="subl -w"
export JAVA_OPTS='-Xmx2048m -Xms1024m -Xrs -XX:MaxPermSize=512m -XX:+UseConcMarkSweepGC'
export JAVA_HOME=`/usr/libexec/java_home`

# User specific aliases and functions
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

# alias ohmyzsh:="mate ~/.oh-my-zsh"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git sublime gradle npm git-extras history osx yeoman)

source $ZSH/oh-my-zsh.sh
source ~/.my_git_config
source ~/.my_functions
source ~/.my_aliases

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/share/npm/bin:/Users/paulkelly/Scripts:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/share/python:.

PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
