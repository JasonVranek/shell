#!/usr/bin/env bash

addr=$1
if [ -z "$addr" ];
then 
  cd ~/Desktop/Leeps/2.2
  vagrant up
  vagrant ssh << 'ENDSSH'
  sudo service redwood-router restart
  ENDSSH
else
  ssh ${addr} "./restart_redwood.sh"
fi
