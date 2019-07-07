# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export GOPATH=$HOME/.local/share/go
export PATH=$PATH:$HOME/.local/bin:$GOPATH/bin:$HOME/.cargo/bin
