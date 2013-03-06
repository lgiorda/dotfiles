# brew install macvim
if [ /usr/local/bin/mvim ]; then
  alias vim='mvim -v'
fi

# autocomplete for git in bash
# curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
if [ ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
# source .bashrc

# set cli input mode to vi
set -o vi

# get master branch in prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
# colors for prompt
function prompt() {
local BLUE="\[\033[0;34m\]"
local CYAN="\[\033[0;36m\]"
local WHITE="\[\033[1;37m\]"
export PS1="\e[0;34m\\u@\h \e[m\e[0;32m\W\e[m (\e[0;35m\j\e[m) ${CYAN}\$(parse_git_branch)${WHITE}: "
}
# evoke prompt
prompt 

# git aliases
alias gfs='git fetch && git status'
alias gs='git status'
alias gp='git pull'
alias gaa="git add --all"
# train tracks for git log
alias gl="git log --graph --pretty=\"format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset'\" --abbrev-commit --date=relative"
alias master="git checkout master"

# grep processes
function gap () {
  ps aux | grep $1
}

# kill processes by grep
function smash() {
  ps aux | grep $1 | awk '{print $2}' | xargs kill -9
}

# discard all working tree changes
function nuke() {
  git checkout -- .
  git add --all
  git stash && git stash drop
}

function gd() {
  if [ $1 ]; then
    git diff $1
  else 
    git diff
  fi
}

function gcm() {
  git commit -m "$1"
}

function branch() {
  git checkout -b $1
}

function vimdiff() {
  git diff --no-ext-diff -w "$@" | vim -R -
}

BP=$HOME/projects/boilerplates
PROJ=$HOME/projects
UPS=$HOME/projects/ups-ipad-app
GOOG=$HOME/projects/google-erepo
NODE_PATH=$NODE_PATH:/usr/local/lib/jsctags
PLAY=$HOME/play-2.0.4/play
PATH=$PATH:$HOME/.rvm/bin:/usr/local/bin:/usr/local/lib:$HOME/play-2.0.4:/usr/local/sbin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
