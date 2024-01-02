abbr -a e nvim
abbr -a cat bat
abbr -a grep rg
abbr -a rgf 'rg --files | rg'
abbr -a ls exa

abbr -a glo 'git log --oneline'
abbr -a gss 'git status -s'
abbr -a gprom 'git pull --rebase origin main'
abbr -a gp 'git push -u origin (git branch --show-current)'

abbr -a dockerstop 'osascript  -e \'quit app "Docker"\''
abbr -a dockerstart 'open -a Docker'

abbr -a kc kubectx
abbr -a kns kubens
abbr -a kgp kubectl get pods
abbr -a k kubectl

abbr -a aws aws-sso-util login

abbr -a idea 'open -na "/Applications/IntelliJ IDEA CE.app"'

abbr -a tfmt 'terraform fmt ./**/*.tfvars'

set -x NVM_DIR $HOME/.nvm
function nvm
	bass source $NVM_DIR/nvm.sh --no-use ';' nvm $argv
end

set -x GOROOT /usr/local/Cellar/go/1.19/libexec
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

set -x EDITOR nvim
set -x KUBE_EDITOR nvim

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

# Base16 Shell
if status --is-interactive
	set BASE16_SHELL "$HOME/.config/base16-shell/"
	source "$BASE16_SHELL/profile_helper.fish"
end

# Created by `pipx` on 2023-01-25 22:16:22
set PATH $PATH /Users/tverghis/.local/bin

bass source ~/repos/developer-tools/scripts/aws-helpers.sh
set -x KUBECONFIG (find ~/.kube/wbd -name '*kubeconfig' | xargs | sed 's/ /:/g')

set -x FZF_DEFAULT_COMMAND 'rg --files --hidden -g "!.git"'
