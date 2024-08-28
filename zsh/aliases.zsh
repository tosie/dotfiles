alias reload!='. ~/.zshrc'

# Good 'ol Clear Screen command.
alias cls='clear'

# `ls` with numeric mode.
alias mls="ls -hl | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"

# SSH to a Mikrotik device on its default username and ip.
alias mikrotik-ssh="ssh -o 'PubkeyAcceptedKeyTypes=+ssh-rsa' -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o ConnectTimeout=5 -o ConnectionAttempts=2 -o Port=22 -o LogLevel=ERROR admin@192.168.88.1"

fiasco-find-uploads() {
  if [ -z "$1" ]; then
    echo "Usage: fiasco-find-uploads <request_id>"
    return 1
  fi
  
  echo "Finding uploads for request $1 ..."
  s3cmd ls s3://uploads.fiasco.de/images/requests/$1
}
