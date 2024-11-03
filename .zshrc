# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# Path setup: customize if you come from bash
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme configuration
# Set theme name or "random" for a random theme at each shell start.
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/emodipt_extend.toml)"
fi

# Theme aliases
alias zen="$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
alias tokyo="$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/tokyonight_storm.toml)"
alias bubbles="$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/bubbles.toml)"
alias emodipt="$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/emodipt_extend.toml)"
alias amro="$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/amro.toml)"

# Theme selection function
function prompt() {
  themes=("zen" "tokyo" "bubbles" "emodipt" "amro")
  theme=$(printf "%s\n" "${themes[@]}" | fzf --prompt="Choose a prompt theme: " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $theme ]]; then
    echo "Nothing selected"
    return 0
  fi
  case $theme in
    zen) zen ;;
    tokyo) tokyo ;;
    bubbles) bubbles ;;
    emodipt) emodipt ;;
    amro) amro ;;
    *) echo "Invalid theme" ;;
  esac
}

# Plugins and sourcing Oh My Zsh
plugins=(git zsh-autosuggestions zsh-syntax-highlighting alias-tips copyfile macos dirhistory web-search zsh-vi-mode)
source $ZSH/oh-my-zsh.sh

# User configuration/
export EDITOR='nvim'
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999

# History options
setopt share_history hist_expire_dups_first hist_ignore_dups hist_verify
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# Alias definitions
eval "$(zoxide init zsh)"
alias ls="eza --icons=always"
alias CP="cd ~/downloads/code/CP"
alias CY="cd ~/downloads/code/cybersec"
alias matrix="cmatrix -u 4 -s -a"
alias connect_pwn="ssh -i ~/Downloads/Code/CyberSec/pwn/key hacker@pwn.college"
alias organize_cp='(cd ~/downloads/code/CP/inProgress && ~/downloads/code/CP/bashScript/organize_cp.sh)'
alias rename_files='(cd ~/downloads/code/CP/inProgress && ~/downloads/code/CP/bashScript/rename_files.sh)'
alias usaco_rename='(cd ~/downloads/code/CP/inProgress && ~/downloads/code/CP/bashScript/usaco_rename.sh)'

# FZF custom commands
unalias fzfopen 2>/dev/null
unalias fzfpre 2>/dev/null
alias fzfpre="fzf --preview 'bat --style=plain --color=always --line-range :500 {}'"
alias fzfopen="nvim \$(fzf --preview 'bat --style=plain --color=always --line-range :500 --paging=always {}')"

# Python virtual environment
source ~/.venv/bin/activate

# Pipx paths
export PATH="$PATH:/Users/swrj/.local/bin"
export PATH=$PATH:/Users/swrj/.spicetify

# Other sources
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval $(thefuck --alias)

