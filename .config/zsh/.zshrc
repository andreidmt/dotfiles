# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.config/zsh/.zsh-vars

source $HOME/.config/zsh/.zsh-alias

source $HOME/.config/zsh/.zsh-config

# 
# Start ssh-agent if none running or export env vars 
# for current running process
#
SSH_AGENT_STATUS=$(ps -C ssh-agent >/dev/null && echo "running" || echo "not-running")

if [ "$SSH_AGENT_STATUS" = "not-running" ]; then
  ssh-agent > "$HOME/.cache/.ssh-agent.env"
  source "$HOME/.cache/.ssh-agent.env" >/dev/null
  
  echo "// \`ssh-agent\` started"
  ssh-add "$HOME/.ssh/id_skulltop-github"
fi

source $HOME/.config/zsh/.zsh-plugins

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.zsh-p10k
[[ ! -f ~/.config/zsh/.zsh-p10k ]] || source ~/.config/zsh/.zsh-p10k
