set PATH $PATH (du "$HOME/.scripts" | cut -f2 | tr '\n' ' ')

set fish_function_path ~/.config/fish/functions/digital_ocean/ $fish_function_path

set -gx EDITOR "nvim"
set -gx TERMINAL "kitty"
set -gx BROWSER "firefox"

# Set ssh-agent process's socket file for ssh to talk to
set -gx SSH_AUTH_SOCK (find /tmp/ -type s -name agent.\* 2> /dev/null | grep "/tmp/ssh-.*/agent.*")

# Human readable size, order by date, dir first
alias lsa "ls -Alhtr --color=auto --group-directories-first"

# Other
abbr mkd "mkdir -pv" 
abbr vi "nvim"
abbr vim "nvim"
abbr ethspeed "speedometer -r enp0s25"

alias wo "clear && cd $HOME/work-own && lsa"

alias cv "nvim ~/.config/nvim/init.vim"
alias ci "nvim ~/.config/i3/config"
alias cib "nvim ~/.config/i3blocks/config"
alias cf "nvim ~/.config/fish/config.fish"

# npm
abbr npu npm run update
abbr nps npm run setup
abbr npsd npm run start:dev
abbr npb npm run build

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

