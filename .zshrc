#export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/alexis/.gem/ruby/2.2.0/bin:/home/alexis/PhpStorm-139.1348/bin:/srv/http/vendor/phpmd/phpmd/src/bin:/srv/http/vendor/squizlabs/php_codesniffer/scripts:/home/alexis/.composer/vendor/bin:/home/alexis/Applications/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.4.0/bin:$HOME/bin"
# Load Syntax highlighting
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#if [[ -r /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
#    source /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
#fi
source "${HOME}/.zgen-setup"

# Set Zsh option
setopt correct

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
#ddate | lolcat
#cowfortune
