set -gx PATH (du "$HOME/scripts" | cut -f2 | tr '\n' ' ') $PATH
set -U fish_user_paths $PATH 

set -gx EDITOR "nvim"
set -gx TERMINAL "kitty"
set -gx BROWSER "firefox"

# Human readable size, order by date, dir first
alias lsa='ls -Alhtr --color=auto --group-directories-first'

# Other
alias mkd="mkdir -pv" 
alias vi="nvim"
alias vim="nvim"
alias ethspeed="speedometer -r enp0s25"

alias wl='clear && cd /repository-ssd/work-leeruniek && ls'
alias wo='clear && cd /repository-ssd/work-own && ls'

alias cv='nvim ~/.config/nvim/init.vim'
alias ci='nvim ~/.config/i3/config'
alias cib='nvim ~/.config/i3blocks/config'
alias cf='nvim ~/.config/fish/config.fish'

# npm
abbr npu npm run update
abbr nps npm run setup

# bang bang
abbr !! eval command sudo $history[1]

#######
# Common functions
#######

function echo-head -a text -d "Echo text with heading decoration"
  echo ""
  echo "###"
  echo "###" "$text"
  echo "###"
  echo ""
end

