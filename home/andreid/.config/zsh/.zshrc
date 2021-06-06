# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.config/zsh/.zsh-vars

source $HOME/.config/zsh/.zsh-alias

source $HOME/.config/zsh/.zsh-config

# Start ssh-agent and load keys
SSH_AGENT_STATUS=$(ps -C ssh-agent >/dev/null && echo "running" || echo "not-running")

if [ "$SSH_AGENT_STATUS" = "not-running" ]; then
  notify ".bashrc" "No running ssh-agent, starting one."
  eval "$(ssh-agent)"

  ssh-add ~/.ssh/t440p
  ssh-add ~/.ssh/asd14__andreid
  ssh-add ~/.ssh/asd14__ci
fi

source $HOME/.config/zsh/.zsh-plugins

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.zsh-p10k
[[ ! -f ~/.config/zsh/.zsh-p10k ]] || source ~/.config/zsh/.zsh-p10k
