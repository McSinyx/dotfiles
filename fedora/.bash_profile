# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/.local/share/go/bin
export PATH
export GOPATH=$HOME/.local/share/go

export PATH="$HOME/.cargo/bin:$PATH"
