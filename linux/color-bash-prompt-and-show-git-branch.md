# Color Bash Prompt & Show Git Branch

```bash
parse_git_branch() {
    CYAN="\e[96m"
    NORMAL="$(tput sgr0)"
    RED="\e[91m"
    YELLOW="\e[93m"

    # Parse git branch or return null if an error occurs
    BRANCH="$(git reflog HEAD 2> /dev/null | grep 'checkout:' | head -1 | rev | cut -d' ' -f1 | rev)"

    # Do process only if .git folder is present
    if [ -d ".git" ]
    then
        # Print in red on master branch
        if [ "${BRANCH}" = 'master' ]
        then
            LINE="${RED} (${BRANCH}) ${NORMAL}"

        # Print in yellow on develop branch
        elif [ "${BRANCH}" = 'develop' ]
        then
            LINE="${YELLOW} (${BRANCH}) ${NORMAL}"

        # Print in cyan on any other branch
        else
            LINE="${CYAN} (${BRANCH}) ${NORMAL}"
        fi
    fi

    echo -e "${LINE}"
}

if [ "$color_prompt" = yes ]; then
    PS1="\[\033[38;5;43m\]\u\[$(tput sgr0)\]\[\033[38;5;8m\]@\[$(tput sgr0)\]\[\033[38;5;141m\]\h\[$(tput sgr0)\]\[\033[38;5;8m\]:\[$(tput sgr0)\]\[\033[38;5;33m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\$(parse_git_branch)\[$(tput sgr0)\]\[\033[38;5;8m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
```
