# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.config/zsh/.zsh-config
source $HOME/.config/zsh/.zsh-vars
source $HOME/.config/zsh/.zsh-vars-local
source $HOME/.config/zsh/.zsh-alias
source $HOME/.config/zsh/.zsh-plugins
source $HOME/.config/zsh/.zsh-extra-awsume
source $HOME/.config/zsh/.zsh-extra-nvm
source $HOME/.config/zsh/.zsh-local

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.zsh-p10k
[[ ! -f ~/.config/zsh/.zsh-p10k ]] || source ~/.config/zsh/.zsh-p10k
