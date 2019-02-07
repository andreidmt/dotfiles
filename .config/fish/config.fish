set -gx PATH "/repository-ssd/tools/" (du "$HOME/scripts" | cut -f2 | tr '\n' ' ') $PATH

set -U fish_user_paths $PATH 

set -gx EDITOR "nvim"
set -gx TERMINAL "kitty"
set -gx BROWSER "firefox"
set -gx FIRST_NAME "Andrei"
set -gx LAST_NAME "Dumitrescu"

# Full system update
alias upgr="notify-send -i ~/doomguy.png 'System upgrade started' 'Running: pacman -Syyuv --noconfirm' & neofetch && sudo pacman -Syyuv --noconfirm && notify-send -i ~/doomguy-smile.png 'System upgrade complete'"

# Refresh wifi
alias newnet="sudo systemctl restart NetworkManager"

# Install AUR package manually 
function auri --description "Install AUR package"
    curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz && tar -xvf $1.tar.gz && cd $1 && makepkg --noconfirm -si && cd .. && rm -rf $1 $1.tar.gz ;
end

# Human readable size, order by date, dir first
alias lsa='ls -Alhtr --color=auto --group-directories-first'

# Other
alias mkd="mkdir -pv" 
alias vi="nvim"
alias vim="nvim"
alias ethspeed="speedometer -r enp0s25"
alias wifispeed="speedometer -r wlp3s0"

alias wl='clear && cd /repository-ssd/work-leeruniek && ls'
alias wo='clear && cd /repository-ssd/work-own && ls'

alias cv='nvim ~/.config/nvim/init.vim'
alias ci='nvim ~/.config/i3/config'
alias cf='nvim ~/.config/fish/config.fish'

# npm
alias npu="npm run update"
alias nps="npm run setup"


alias leeruniek-backend-db-stage='/repository-ssd/tools/cloud_sql_proxy \
    -instances=leeruniek-155216:europe-west1:backend-staging=tcp:8832 \
    -credential_file=/home/andreid/.ssh/leeruniek-cloud-sql.json'

alias leeruniek-backend-db-prod='/repository-ssd/tools/cloud_sql_proxy \
    -instances=leeruniek-155216:europe-west1:backend-production=tcp:8833 \
    -credential_file=/home/andreid/.ssh/leeruniek-cloud-sql.json'
