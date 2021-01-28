# Fancy autocompletion and sugestions
autoload -Uz compinit -u && compinit -u

# Vim Keybindings
bindkey -v
bindkey "^?" backward-delete-char

# Prompt
PROMPT='%B%F{green}%n%b %F{blue}%1~%f %# '

# Aliases
alias cal="cal -A 1 -B 1"
alias ll='ls -al'

source ~/.zsh/.zsh_mac

function stu() {
	mv $1 `echo $1 | tr ' ' '_'`
}
