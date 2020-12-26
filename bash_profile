export PATH="usr/local/bin:$PATH"

# source git-prompt
# source ~/.bash_git

# Enable Git tab completion
source ~/.git-completion.bash

# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

# enable syntax highlighting
syntax on

export LC_ALL=en_US.UTF-8

# Change command prompt
source ~/.git-prompt.sh
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset"

# git autocompletion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
 
# alias to the most recent version of vim
alias vim='/usr/local/Cellar/vim/8.2.2150/bin/vim'
export PATH="/usr/local/bin:$PATH"

# alias to the version of neovim managed by Homebrew
alias nvim="/usr/local/Cellar/neovim/0.4.4/bin/nvim"
export PATH="/usr/local/Cellar/neovim/0.4.4/bin/nvim:$PATH"

# set default terminal editor to vim

# Exercism bash completion
if [ -f ~/.config/exercism/exercism_completion.bash ]; then
  . ~/.config/exercism/exercism_completion.bash
fi
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/gems/vimgolf-0.4.8/bin/vimgolf:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/gems/vimgolf-0.4.8/bin/:$PATH"

export PATH="~/.composer/vendor/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/GerhardNuffer/CloudCode/google-cloud-sdk/path.bash.inc' ]; then . '/Users/GerhardNuffer/CloudCode/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/GerhardNuffer/CloudCode/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/GerhardNuffer/CloudCode/google-cloud-sdk/completion.bash.inc'; fi

# point python at python3
alias python=/usr/local/bin/python3 

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

alias pip="/Users/GerhardNuffer/.pyenv/shims/pip3"

# put fzf's bin directory in path
export PATH=$PATH:.vim/pack/minpac/start/fzf/bin
