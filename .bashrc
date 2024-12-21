# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Colors
RED='\[\033[0;31m\]'
GREEN='\[\033[0;32m\]'
YELLOW='\[\033[0;33m\]'
BLUE='\[\033[0;34m\]'
PURPLE='\[\033[0;35m\]'
CYAN='\[\033[0;36m\]'
WHITE='\[\033[0;37m\]'
RESET='\[\033[0m\]'

function parse_git_branch() {
  if [ -e ".git" ]; then
    branch_name=$(git symbolic-ref -q HEAD)
    branch_name=${branch_name##refs/heads/}
    branch_name=${branch_name:-HEAD}

    echo -n "→ "

    if [[ $(git status 2> /dev/null | tail -n1) = *"nothing to commit"* ]]; then
      echo -n "$WHITE$branch_name$RESET"
    elif [[ $(git status 2> /dev/null | head -n5) = *"Changes to be committed"* ]]; then
      echo -n "$CYAN$branch_name$RESET"
    else
      echo -n "$COLOR_GIT_MODIFIEciwYELLOWD$branch_name*$RESET"
    fi

    echo -n " "
  fi
}

# Prompt
PS1="${PURPLE}\u${RESET}@${PURPLE}\h${RESET}: ${CYAN}\w${RESET} \n ${YELLOW}$(parse_git_branch)${RESET} ~\$ " 

# Alias
alias tst="tab-st.sh"

# Setup fzf
# ---------
if [[ ! "$PATH" == */home/h4ckmil0/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/h4ckmil0/.fzf/bin"
fi

export FZF_DEFAULT_COMMAND='fd -tf --color=never --hidden . /'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}' --bind 'ctrl-o:execute(nvim {})'"

export FZF_ALT_C_COMMAND='fd -td --color=never --hidden . /'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

eval "$(fzf --bash)"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
