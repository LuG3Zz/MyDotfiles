# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=500
SAVEHIST=500
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lugar/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export EDITOR=nvim
export TERMINAL=st
export OPENAI_API_KEY="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"
export all_proxy="http://127.0.0.1:20172"
alias ls='exa --color=auto'
alias ll='exa -al --color=auto'
alias la="lazygit"
alias ra="ranger"
alias s="neofetch"
alias c="peaclock"
alias so="source"
alias tl="~/scripts/translate.py"
#export PATH=$PATH:~/Qt5.14.2/Tools/QtCreator/bin
export PATH=$PATH:~/.cargo/bin/
setopt no_nomatch
#fzf
##
###FZF
###
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_COMPLETION_TRIGGER='\'
export FZF_DEFAULT_COMMAND='fd --hidden --follow -E ".git" -E "node_modules" . /etc /home'
export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --bind=alt-j:down,alt-k:up,alt-i:toggle+down --border --preview "echo {} | ~/scripts/fzf_preview.py" --preview-window=down'

# use fzf in bash and zsh
# Use ~~ as the trigger sequence instead of the default **

# Options to fzf command
#export FZF_COMPLETION_OPTS=''

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow -E ".git" -E "node_modules" . /etc /home
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow -E ".git" -E "node_modules" . /etc /home
}


if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec  startx ~/.config/chadwm/scripts/run.sh 
fi

eval "$(zoxide init zsh)"
