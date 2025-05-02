# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


alias vim="/usr/local/share/nvim-linux64/bin/nvim"

#alias sd="cd \$(pwd) && \$(fdfind . $HOME --type d . --exclude node_modules/ . --exclude snap/ | fzf)"
alias sd="cd \$(pwd) && \$(fdfind . $HOME/Documents ~/Documents/dev ~/Android/Sdk/ --min-depth 1 --max-depth 1 --type d . --exclude node_modules/ . --exclude snap/| fzf)"
alias sdf="cd \$(pwd) && \$(fdfind . $HOME/Documents/dev --min-depth 1 --max-depth 1 --type d . --exclude node_modules/ . --exclude snap/| fzf)"

# Toggle keyboard between estonian and us layout
alias asd="setxkbmap us"
alias asdf="setxkbmap ee"

alias i3lock="i3lock --color 000000"

# Makes sure that tmux does not override nvim colors
alias tmux='TERM=xterm-256color tmux' 
alias tmuxn='tmux new -d -s' 
alias tmuxa='tmux a -d -t' 

# open tmux session with current directory name
alias tms='tmux new -d -s ${PWD##*/}'

# tmux git
alias tmg='~/Documents/scripts/tmux-git.sh' 

alias lg="lazygit"
alias lzd="lazydocker"
alias lzs="~/go/bin/lazysql"

export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet

export PATH=$PATH:/usr/local/go/bin

# odin
export PATH="$PATH:$HOME/odin"

export NVM_DIR="$HOME/.nvm"
# This lazy loads nvm
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
  nvm $@
}
export PATH="$PATH:/opt/mssql-tools18/bin"

newMode() {
    local cmd=(xrandr --newmode '2880x2160_60.00'  534.50  2880 3120 3432 3984  2160 2163 2167 2237 -hsync +vsync)
    echo "=> ${cmd[*]}"
}
addMode() {
    local cmd=(xrandr --addmode DisplayPort-0 2880x2160_60.00)
    echo "=> ${cmd[*]}"
}

alias addWorkMode=newMode "$@" addMode "$@"

alias i3left="i3-msg move workspace to output left"
alias i3right="i3-msg move workspace to output right"


