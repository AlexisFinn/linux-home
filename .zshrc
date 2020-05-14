export PATH="$PATH:$HOME/.gem/ruby/2.4.0/bin:$HOME/bin"
source "${HOME}/.zgen-setup"

# Set Zsh option
setopt correct

ZSH_THEME=pygmalion

for file in $HOME/.zshrc.d/*; do
    source "$file"
done


function chpwd() {
    if [ -e $PWD/bash_aliases.sh ]; then
        source $PWD/bash_aliases.sh
    else
        unalias -m 'bb-*'
    fi
}

