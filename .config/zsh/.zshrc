# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.config/zsh/.zsh-config

source $HOME/.config/zsh/.zsh-vars

source $HOME/.config/zsh/.zsh-alias

# Start ssh-agent if none running 

SSH_AGENT_STATUS=$(ps -C ssh-agent >/dev/null && echo "running" || echo "not-running")

if [ "$SSH_AGENT_STATUS" = "not-running" ]; then
  echo "// starting \`ssh-agent\`"
  eval "$(ssh-agent)"

  if [ "$MACHINE" = "skulltop" ]; then
    ssh-add "$HOME/.ssh/id_skulltop-github"
  fi

  if [ "$MACHINE" = "t440p" ]; then
    ssh-add "$HOME/.ssh/t440p"
    ssh-add "$HOME/.ssh/do.t440p"
    ssh-add "$HOME/.ssh/asd14__andreid"
    ssh-add "$HOME/.ssh/asd14__ci"
  fi
fi

source $HOME/.config/zsh/.zsh-plugins
source $HOME/.config/zsh/.zsh-extra-awsume
source $HOME/.config/zsh/.zsh-extra-nvm

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.zsh-p10k
[[ ! -f ~/.config/zsh/.zsh-p10k ]] || source ~/.config/zsh/.zsh-p10k
