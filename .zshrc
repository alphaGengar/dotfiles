# Profiling (uncomment to debug startup time)
# zmodload zsh/zprof

# Critical Performance Settings
skip_global_compinit=1
DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"
ZSH_DISABLE_COMPFIX="true"

# Essential Environment Setup
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/bin:/usr/local/bin:/Users/swrj/.local/bin:$PATH"
export EDITOR='nvim'

# History Configuration (optimized)
HISTSIZE=1000
SAVEHIST=1000
HISTFILE="$HOME/.zhistory"
setopt share_history hist_expire_dups_first hist_ignore_dups hist_verify

# Minimal Plugin Selection
plugins=(git)

# Fast Theme Loading
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  cache_file="${HOME}/.cache/oh-my-posh-init.zsh"
  if [[ ! -f "$cache_file" ]] || [[ ! -s "$cache_file" ]] || [[ $(find "$cache_file" -mtime +1) ]]; then
    mkdir -p "${HOME}/.cache"
    oh-my-posh init zsh --config $HOME/.config/ohmyposh/emodipt.toml > "$cache_file"
  fi
  source "$cache_file"
fi

# Load Oh My Zsh with minimal features
source $ZSH/oh-my-zsh.sh

# Deferred Loading Function
function defer_load() {
  # Load plugins asynchronously
  {
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    eval "$(zoxide init zsh)"
  } &!

  # Remove the deferred loading function after first run
  unfunction defer_load
}

# Add deferred loading to precmd
precmd_functions+=defer_load

# Key Bindings (minimal set)
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# Efficient Aliases
alias ls="eza --icons=always"
alias python="python3"
alias nvim-zen="NVIM_APPNAME=nvim_zen nvim"

# Lazy-loaded Functions
function prompt() {
  themes=("zen" "tokyo" "bubbles" "emodipt" "amro")
  theme=$(printf "%s\n" "${themes[@]}" | fzf --prompt="Choose a prompt theme: " --height=~50% --layout=reverse --border --exit-0)
  [[ -z $theme ]] && return 0
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/${theme}.toml)"
}

function nvims() {
  local items=("default" "Zen") config
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config " --height=~50% --layout=reverse --border --exit-0)
  [[ -z $config ]] && return 0
  NVIM_APPNAME=${config:l} nvim "$@"
}

# Conditional venv activation (only if needed)
[[ -f ~/.venv/bin/activate ]] && [[ -z "${VIRTUAL_ENV}" ]] && source ~/.venv/bin/activate

# Remove PATH duplicates
typeset -U PATH path

# Profiling end (uncomment to debug startup time)
# zprof
