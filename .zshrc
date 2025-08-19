# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
# export PATH=$HOME/Documents/android-studio/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="hx"
export LC_TIME=en_GB.UTF-8

# emscriprten
export EMSDK_QUIET=1
export EMCC_CFLAGS="-O3 -sUSE_GLFW=3 -sASSERTIONS=1 -sWASM=1 -sASYNCIFY -sGL_ENABLE_GET_PROC_ADDRESS=1"

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/Documents/projects/emsdk/emsdk_env.sh

[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# fzf
x() {
  local dir
  # dir=$(fd --type d --strip-cwd-prefix | fzf) && cd "$dir"
  dir=$(fd --type d --base-directory ~/Documents --exclude node_modules --exclude temp --exclude target '' --strip-cwd-prefix | fzf) && cd ~/Documents/"$dir"
}
xd() {
  local dir
  dir=$(fd --type d --strip-cwd-prefix | fzf) && cd "$dir"
}
