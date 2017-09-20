#!/usr/bin/env bash

#################RESET REDWOOD ROUTER##################
echo "Are you using Vagrant for Redwood? [y/n]"
read response
if [ "$response" == 'n' ];
then
  echo "Which Redwood server? (oregon, frankfurt), [blank for leeps admin]" 
  read redwood
  if [ "$redwood" == 'frankfurt' ];
  then
    addr=ubuntu@ec2-35-158-97-190.eu-central-1.compute.amazonaws.com
  elif [ "$redwood" == 'oregon' ];
  then
    addr=ubuntu@ec2-52-59-251-204.eu-central-1.compute.amazonaws.com
  else
    addr=leeps@128.114.97.45
  fi
  ./reset_router.sh $addr
else
  ./reset_router.sh
  clear
  echo Reset Redwood Router
fi

#######################################################
echo "Which exchange server (oregon, frankfurt)"
read server
echo "cda or fba?"
read mechanism
echo "how many groups?"
read num_groups

if [ -z "$server" ];
then
  #default server is oregon
  server='oregon'
fi

./run_exchange.sh $server $mechanism $num_groups

###########################################################
