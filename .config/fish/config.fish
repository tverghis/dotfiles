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
	set_color blue
	echo -n (hostname)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end

# Airbnb-specific config
set -x ENV development
set -x K2 yes
set -x ONETOUCHGEN_ACCEPT_EULA yep
set -x DATA_DIR $HOME/airlab/repos/data
set -x AFDEV_HOST "i-0108c4fc978d096fa.inst.aws.airbnb.com"
set -x AFDEV_PORT 50557
set -x AFDEV_USER "$USER"
