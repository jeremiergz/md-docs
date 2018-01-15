# Bash Aliases

```bash
alias ..='cd ..'
alias ll='ls -lh'
alias lla='ls -lah'
alias llr='ls -lRh'
alias sn='sudo nano'
alias sht='sudo htop'

alias dcp='docker-compose'
alias dklc='docker ps -l'  # List last Docker container
alias dklcid='docker ps -l -q'  # List last Docker container ID
alias dklcip='docker inspect -f "{{.NetworkSettings.IPAddress}}" $(docker ps -l -q)'  # Get IP of last Docker container
alias dkps='docker ps'  # List running Docker containers
alias dkpsa='docker ps -a'  # List all Docker containers
alias dki='docker images'  # List Docker images
alias dkrm='docker rm'
alias dkrmi='docker rmi'
alias dkrmac='docker rm $(docker ps -a -q)'  # Delete all Docker containers
alias dkrmui='docker images -q -f dangling=true | xargs -r docker rmi'  # Delete all untagged Docker images
```