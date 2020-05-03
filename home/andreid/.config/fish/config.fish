set PATH $PATH (du "$HOME/.scripts" | cut -f2 | tr '\n' ' ')
set fish_function_path ~/.config/fish/functions/digital_ocean/ $fish_function_path

set -gx EDITOR "nvim"
set -gx TERMINAL "st"
set -gx BROWSER "firefox"

# Set ssh-agent process's socket file for ssh to talk to
set -gx SSH_AUTH_SOCK (find /tmp/ -type s -name agent.\* 2> /dev/null | grep "/tmp/ssh-.*/agent.*")

# config
alias cv "nvim ~/.config/nvim/init.vim"
alias ci "nvim ~/.config/i3/config"
alias cf "nvim ~/.config/fish/config.fish"

# npm
abbr npu npm run update
abbr nps npm run setup
abbr npsd npm run start:dev
abbr npb npm run build
abbr npl npm run lint

# Other
alias vi "nvim"
alias vim "nvim"
alias lsa "ls -Alhtr --color=auto --group-directories-first"
abbr mkd "mkdir -pv" 
abbr jcurl "curl --verbose --header \"Content-Type: application/json\""

function echo-head -d "Echo text with heading decoration"
  echo ""
  echo "###"

  for arg in $argv
    echo -e "###" "$arg"
  end
  
  echo "###"
  echo ""
end

