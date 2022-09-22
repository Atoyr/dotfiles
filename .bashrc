#SSH
eval `ssh-agent` > /dev/null
ssh-add /home/ruchiyama/.ssh/id_ed25519 >& /dev/null
ssh-add /home/ruchiyama/.ssh/id_rsa >& /dev/null

# DISPLAY
export DISPLAY=localhost:0.0

alias vivi='vim ~/.vimrc'
alias g='git'
alias git-log='git log --pretty=format:"%h - %ad : %s"'

