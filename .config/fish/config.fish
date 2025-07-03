set -U fish_greeting "" # Disable the welcome message

# General Aliases
abbr -a e helix
abbr -a cat bat
abbr -a grep rg
abbr -a ls eza

# Git-specific aliases
abbr -a glo 'git log --oneline'
abbr -a gss 'git status -s'
abbr -a gprom 'git pull --rebase origin main'
abbr -a gp 'git push -u origin (git branch --show-current)'

set -x EDITOR helix

set __fish_git_prompt_showuntrackedfiles yes
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream none

set -g fish_prompt_pwd_dir_length 3

function fish_prompt
    set_color white
    echo -n "["(date "+%H:%M")"] "
    if [ $PWD != $HOME ]
        set_color yellow
        echo -n (basename $PWD)
    end
    set_color green
    printf '%s' (__fish_git_prompt)
    set_color red
    echo -n '| '
    set_color normal
end
