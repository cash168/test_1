#!/bin/bash

SCRIPT_DIR=$(cd "$( dirname "$0" )" && pwd) #"current dir
cd $SCRIPT_DIR

vagrant up

for (( count=1; count<7; count++ ))
do
  ssh-keygen -f "~/.ssh/known_hosts" -R "172.21.12.10$count" || true
  cp `vagrant ssh-config server-$count | grep IdentityFile | awk -F ' ' '{print $2}'` $SCRIPT_DIR/.vagrant/machines/server-$count/virtualbox/private_key
done


