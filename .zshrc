[ -f .exports.sh ] && source $HOME/.exports.sh

# ZSH plugins
plugins=(tmux wd rails ruby git)

# tmux
ZSH_TMUX_AUTOSTART=true

# oh-my-zsh
[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

# p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# p10k : To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[ -f $HOME/powerlevel10k/powerlevel10k.zsh-theme ] && source $HOME/powerlevel10k/powerlevel10k.zsh-theme
[ -f ~/.p10k.zsh ] && source $HOME/.p10k.zsh

# fzf
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# nvm
[ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh
autoload -U add-zsh-hook
load-nvmrc() {
  [[ -a .nvmrc ]] || return
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"
  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install 2>&1 >/dev/null 
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use 2>&1 >/dev/null
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default 2>&1 >/dev/null
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# rbenv
if command -v rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)";
fi

bindkey  "^[[1~"  beginning-of-line
bindkey  "^[[4~"  end-of-line
bindkey  "^[[3~"  delete-char

source $HOME/.docto-env.sh
source $HOME/.alias.sh
