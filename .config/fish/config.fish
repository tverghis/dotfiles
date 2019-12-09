abbr -a e nvim
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

  set BIG_REPOS 'treehouse'
  if not contains (basename $PWD) $BIG_REPOS
    printf '%s' (__fish_git_prompt)
  end
	set_color red
	echo -n '| '
	set_color normal
end

bass source ~/.airlab/shellhelper.sh

# Airbnb-specific config
set -x ENV development
set -x K2 yes
set -x ONETOUCHGEN_ACCEPT_EULA yep
set -x DATA_DIR $HOME/airlab/repos/data
set -x AFDEV_HOST "i-03923bd837dbdc0f6.inst.aws.airbnb.com"
set -x AFDEV_PORT 50557
set -x AFDEV_USER "$USER"

# Java
set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)

# PATH settings
set PATH $HOME/.cargo/bin $PATH
set PATH $JAVA_HOME/bin $PATH
