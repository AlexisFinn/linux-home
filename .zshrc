#export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/alexis/.gem/ruby/2.2.0/bin:/home/alexis/PhpStorm-139.1348/bin:/srv/http/vendor/phpmd/phpmd/src/bin:/srv/http/vendor/squizlabs/php_codesniffer/scripts:/home/alexis/.composer/vendor/bin:/home/alexis/Applications/bin"

# Load Syntax highlighting
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#if [[ -r /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
#    source /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
#fi

# Load antigen (zsh package manager)
source /home/alexis/Applications/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh



# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git # Lots of git aliases
####### antigen bundle Tarrasch/zsh-autoenv # Suppoert for folder specific envirronment settings
antigen bundle pip # Python package manager autocomplete helper
antigen bundle command-not-found
antigen bundle common-aliases # Common aliases like ll and la
antigen bundle djui/alias-tips # Alias reminder when launching a command that is aliased
antigen bundle arialdomartini/oh-my-git #Cool git theme
antigen bundle archlinux # Aliases for pacman and yaourt (if installed)
antigen bundle ssh-agent # Launch ssh-agent
antigen bundle history # aliases for showing and searching history
antigen bundle lol # Some funny aliases (cf https://gist.github.com/norova/848213) 
antigen bundle systemd # Aliases for systemctl functions
antigen bundle tig # Aliases for tig
antigen bundle sudo # Esc twice to add sudo in fornt of any command
antigen bundle web-search # literally google things for command-line

# Syntax highlighting bundle.
# ALREADY INSTALLED AND LOADED VIA PACMAN/ARCHLINUX
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
# antigen theme funky
# antigen theme pygmalion
# antigen theme bira
# antigen theme agnoster
# antigen theme avit
# antigen theme junkfood
antigen theme ys
# antigen theme bullet-train
# antigen theme bhilburn/powerlevel9k powerlevel9k

# Tell antigen that you're done.
antigen apply

# Set Zsh option
setopt correct

# Set custom aliases
alias c="clear"
alias zconf="gedit /home/alexis/.zshrc"
alias sf="/home/alexis/EDF/rosie/app/console"
#alias lock="i3lock -te --image=/home/alexis/Images/binary_background_1600.png"
alias lock="i3lock -te --image=/home/alexis/Images/archnerd.png"
alias conkyr="gedit /home/alexis/.conkyrc_right"
alias conkyl="gedit /home/alexis/.conkyrc_left"
alias logout="i3-msg exit"
alias todo="(cd /srv/http/todos && nohup meteor > /dev/null)"
alias tig="tig status"
alias lolll="ls -al | lolcat"
alias nano = "vim"

ddate | lolcat
cowfortune
