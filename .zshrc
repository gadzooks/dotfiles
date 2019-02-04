# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/gadzooks/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

# karwande added
# https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

export PATH="$PATH:/usr/local/Cellar/ctags/5.8_1/bin"

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# karwande added
source ~/.alias
export JAVA_HOME=$(/usr/libexec/java_home)

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# python pip
export PATH="$PATH:/usr/local/opt/python/libexec/bin"

# aws cli path
export PATH="$PATH:/Users/gadzooks/Library/Python/3.7/bin"

# * -i - ignore case when searching (but respect case if search term contains uppercase letters)
# * -X - do not clear screen on exit
# * -F - exit if text is less then one screen long
# * -R - was on by default on my system, something related to colors
#export LESS=-iXFS
export LESS="-eirMX"

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# # Emacs style
# zle -N edit-command-line
# bindkey '^xe' edit-command-line
# bindkey '^x^e' edit-command-line
# Vi style:
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

export GROOVY_HOME=/usr/local/opt/groovy/libexec
export PATH="/usr/local/opt/ruby/bin:$PATH"

source ~/.rvm/scripts/rvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# karwande added
# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Vi style:
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
