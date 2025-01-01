#!/usr/bin/env bash

# Automate your hackthebox/VulnLab workflow from a single CLI tool with fzf and tmux
# 
# change the `BASEDIR` to the directory where the boxes are created.

BASEDIR="/home/tr3nb0lone/Documents/boxes"

# feat of parsing command line args manually
action=$1
name=$2

# session names for tmux:

sess1="server"
sess2="hack"

goto(){
  selected=$(ls -d ${BASEDIR}/* | fzf)
  cd $selected/
  tmuxx

  }

new(){
  mkdir -p $BASEDIR/$name
  cd ${BASEDIR}/$name
  echo "New box created, Happy hacking!" 
  tmuxx

}


remove(){
  rm -rf ${BASEDIR}/$name
  echo "Removed $name successfully! "
  exit 1

}


finder(){
  found=$(fd -a -t f . $BASEDIR/ | fzf)
  echo $found
  exit 1
}

tmuxx(){

  tmux new-session -d -s $sess1
  tmux new-session -d -s $sess2

  # modify the sessions:
  tmux neww -t $sess1:2
  tmux neww -t $sess2:2 
  tmux neww -t $sess2:3

  # attach the "server" session:
  tmux attach-session -t $sess1:1

}



main(){

    if [[ -z $action ]]; then 
      goto
    elif [[ $action == "new" ]]; then
      new
    elif [[ $action == "find" ]]; then
      finder
    elif [[ $action == "del" ]]; then
      remove
    else
      echo "Usage: htber.sh [action] [identifyer]
      ex: htber.sh new box_name, htber.sh find, htber.sh "
    fi

}


main "@#" 
