export TERM="xterm-256color"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
ZSH_THEME="rkj"
ZSH_THEME="half-life" # good colors
ZSH_THEME="random"
ZSH_THEME="avk"
ZSH_THEME="gallois"
ZSH_THEME="random"
# current theme
ZSH_THEME="crunch"

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
ENABLE_CORRECTION="true"

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
# aws #NOTE: makes new window slower
bundler
copyfile
colored-man-pages
git
gitfast
git-extras
jira
vi-mode
web-search # google what is github
zsh-syntax-highlighting
# zsh-autosuggestions
)

#https://github.com/zplug/zplug
#NOTE : to install run : zplug install
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
ENHANCD_FILTER=fzy:fzf:peco
export ENHANCD_FILTER

zplug "b4b4r07/enhancd", use:init.sh

export JIRA_URL='https://navigatingcancer.atlassian.net'

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
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
[ -f ~/.alias ] && source ~/.alias

# export JAVA_HOME=$(/usr/libexec/java_home)

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# python pip
export PATH="$PATH:/usr/local/opt/python/libexec/bin"

# aws cli path
export PATH="$PATH:/Users/$USER/Library/Python/3.7/bin"

# * -i - ignore case when searching (but respect case if search term contains uppercase letters)
# * -X - do not clear screen on exit
# * -F - exit if text is less then one screen long
# * -R - was on by default on my system, something related to colors
#export LESS=-iXFS
export LESS="-eirM"

# bindkey '^xe' edit-command-line
# bindkey '^x^e' edit-command-line
# Vi style:
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
bindkey -v

export GROOVY_HOME=/usr/local/opt/groovy/libexec
# export PATH="/usr/local/opt/ruby/bin:$PATH"

[ -f ~/.rvm/scripts/rvm ] && source ~/.rvm/scripts/rvm
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861
# make fzf use ripgrep
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

# https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# karwande added
# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Vi style:
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export LDFLAGS=-L/usr/local/opt/openssl/lib
export CPPFLAGS=-I/usr/local/opt/openssl/include
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# FIXME not working
# bindkey '^;' autosuggest-accept
# bindkey '^;;' autosuggest-execute

# go lang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME
# brew install zsh-syntax-highlighting
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
# source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# brew install autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

