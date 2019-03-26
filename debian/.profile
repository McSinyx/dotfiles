# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export PATH="$HOME/.local/bin:$HOME/.local/share/go/bin:$HOME/.cargo/bin:$PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"
export GOPATH="$HOME/.local/share/go"
export XMODIFIERS=@im=ibus
#export WEBKIT_DISABLE_COMPOSITING_MODE=1
export NLTK_DATA="$HOME/Sources/nlp/nltk_data"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# OPAM configuration
. /home/cnx/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Gruvbox colorscheme
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"
