# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias stow='stow -t /home/436e58'
alias gcc='gcc -O2 -lm'
alias g++='g++ -O2 -lm'
alias fpc='fpc -O1 -XS -gl'
alias raku='rlwrap perl6'
alias backup='rsync -avh --delete /home/ /data/Home/'
