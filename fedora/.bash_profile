# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/.local/share/go/bin:$HOME/.cargo/bin
export PATH
export GOPATH=$HOME/.local/share/go
