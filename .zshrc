# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/gino/.zshrc'

autoload -Uz compinit
compinit

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# .zshrc
autoload -U promptinit; promptinit
prompt pure

git -C ~/ pull

if [[ "$PWD" = /Users/gino ]]; then
  cd Developer
fi

# Initialize tmux session
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
      tmux attach -t default || tmux new -s default
fi
