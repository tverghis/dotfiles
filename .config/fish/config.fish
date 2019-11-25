abbr -a e nvim
abbr -a cat bat
abbr -a grep rg
abbr -a rgf 'rg --files | rg'

# Git shortcuts
abbr -a glo 'git log --oneline'
abbr -a gss 'git status -s'

set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

function fish_prompt
	set_color brblack
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
