#!/usr/bin/env bash

#usage: ./run_exchange.sh [server] [mechanism] [num_groups]
server=$1
mechanism=$2
num_groups=$3

if [ -z "$num_groups" ];
then
  num_groups=1;
fi

if [ -z "$mechanism" ];
then
  mechanism='cda';
fi

if [ "$server" == 'frankfurt' ];
then
  address=ubuntu@ec2-52-59-251-204.eu-central-1.compute.amazonaws.com  
else
  address=ubuntu@ec2-54-149-235-92.us-west-2.compute.amazonaws.com
fi

ssh -t $address "cd /var/HFT2; bash run_${mechanism}_groups.sh ${num_groups}; bash;"
