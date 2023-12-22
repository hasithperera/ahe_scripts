source ~/in/.bash_aliases


# AHE - Change shell to show git
# and custom colors

parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

COLOR_DEF='%f'
COLOR_GIT='%F{yellow}'
NEWLINE=$'\n'
val='%F{40}%n@%m %F{33}%1~ %#'

# Set zsh option for prompt substitution
setopt PROMPT_SUBST
export PROMPT='${val}${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}%% '


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/hasith/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/hasith/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/hasith/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/hasith/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


