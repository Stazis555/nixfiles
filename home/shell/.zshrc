plugins=(git)

# source $ZSH/oh-my-zsh.sh

#######
# Zen #
#######

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
# zinit snippet OMZP::sudo
# zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
# alias ls='ls --color'
alias vim='nvim'
alias c='clear'

#######
# End #
#######


alias gc='git checkout -b'
alias gpl='git pull'
alias gcm='git checkout master && git pull'
alias gpu='git push'
alias gf='git fetch'
alias gm='git commit -m'
alias ga='git add -u'
alias gaa='git add .'
alias gr='git reset --soft HEAD~'
alias grh='git reset --hard HEAD~'
alias gpuu='git push --set-upstream origin $(git symbolic-ref --short HEAD)'
alias gs='git status'
alias ls='ls -lahG --color'
alias tf='terraform'
alias rs='nix develop ~/.nixos#rust -c zsh'

eval "$(zoxide init zsh	--cmd cd)"

eval "$(direnv hook zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mihhail.kukli/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mihhail.kukli/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mihhail.kukli/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mihhail.kukli/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(starship init zsh)"
source <(fzf --zsh)

export EDITOR=nvim

#Yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
