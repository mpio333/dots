autoload -Uz compinit
compinit -i
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=20000
unsetopt beep
bindkey -e
setopt inc_append_history
setopt share_history
setopt nonomatch #Emulate bash behaviour with *
export LC_CTYPE=en_US.UTF-8
export PATH=~/.local/bin/:~/.cargo/bin/:$PATH
export TERM="xterm-256color"
export EDITOR='nvim'
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export RANGER_LOAD_DEFAULT_RC=FALSE
export PATH="/usr/lib/ccache/bin${PATH:+:}$PATH"
export CCACHE_DIR="/var/cache/ccache"

# Functions for handling urls
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

#Plugins
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.config/zsh/plugins/zsh-colored-man-pages/colored-man-pages.plugin.zsh
source ~/.config/zsh/plugins/forgit/forgit.plugin.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

#Spaceship prompt
autoload -U promptinit; promptinit
prompt spaceship
SPACESHIP_CHAR_SYMBOL=
SPACESHIP_CHAR_SUFFIX= 
SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_DIR_COLOR=12
SPACESHIP_EXEC_TIME_ELAPSED=60
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
  )

#Aliases
alias ls='ls --color -h --group-directories-first'
alias ll='ls -l'
alias vim=nvim
alias sudo='sudo '
alias wget='wget --hsts-file=~/.config/wget-hsts'
alias ydl='youtube-dl -f "bestvideo[vcodec^=avc1][height<=1080]+bestaudio[ext=m4a]" --merge-output-format mp4'
