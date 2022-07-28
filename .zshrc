# tmux
[[ -z $TMUX && ! -z $DISPLAY ]] && tmux

# p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f .exports.sh ] && source $HOME/.exports.sh

# ZSH plugins
plugins=(wd rails ruby git)

# oh-my-zsh
[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

# p10k : To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[ -f $HOME/powerlevel10k/powerlevel10k.zsh-theme ] && source $HOME/powerlevel10k/powerlevel10k.zsh-theme
[ -f ~/.p10k.zsh ] && source $HOME/.p10k.zsh

# fzf
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# nvm
[ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh

# rbenv
if command -v rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)";
fi

bindkey  "^[[1~"  beginning-of-line
bindkey  "^[[4~"  end-of-line
bindkey  "^[[3~"  delete-char

source $HOME/.docto-env.sh
source $HOME/.alias.sh
