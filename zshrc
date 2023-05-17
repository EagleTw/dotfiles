# Path to your oh-my-zsh installation.
export ZSH="/Users/panyiping/.oh-my-zsh"

##############################################################
# PATHS
##############################################################
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=/opt/homebrew/bin:$PATH                 # homebrew
export PATH="$HOME/.cargo/bin:$PATH"                # rust cargo
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"
source ~/.ghcup/env
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"      # llvm
export PATH="/opt/homebrew/opt/gdb/bin:$PATH"       # gdb

alias em="emacsclient -c $@"
alias vim="/opt/homebrew/bin/nvim"
alias c="cd .."
alias cc="cd ../.."
alias ccc="cd ../../.."

alias gcc="gcc-12"
alias gitlog="git log --graph --all --pretty=oneline --abbrev-commit"
alias qtcreater="/Applications/Qt\ Creator.app/Contents/MacOS/Qt\ Creator"

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/riscv32-gnu-toolchain-prebuild/bin:$PATH"   # For risc-v gnu toolchain

# ctags
ctags=/opt/homebrew/bin/ctags

# For gtest
export CPLUS_INCLUDE_PATH="/usr/local/include"
export LIBRARY_PATH="/usr/local/lib"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "/Users/panyiping/.ghcup/env" ] && source "/Users/panyiping/.ghcup/env" # ghcup-env

ghcup() {
  OPT=/opt/homebrew/opt/llvm@12/bin/opt \
    LLC=/opt/homebrew/opt/llvm@12/bin/llc \
    /Users/panyiping/.ghcup/bin/ghcup $@
}


##############################################################
# oh my zsh
##############################################################
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel9k/powerlevel9k"
# ZSH_THEME="avit"
ZSH_THEME="eastwood"
#ZSH_THEME="miloshadzic"

# 含有icon的字型
# POWERLEVEL9K_MODE='nerdfont-complete'
# command line 左邊想顯示的內容(資料夾路徑、資料夾讀寫狀態、版本控制資訊)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable vcs) # <= left prompt 設了 "dir"
# command line 右邊想顯示的內容(狀態、時間)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)

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

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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

