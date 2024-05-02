if ! command -v spoof &> /dev/null
then
  if command -v npm &> /dev/null
  then
    sudo npm install spoof -g
  fi
fi
