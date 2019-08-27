#!/bin/bash

SCRIPT_DIR=$(cd "$( dirname "$0" )" && pwd) #"current dir
cd $SCRIPT_DIR

vagrant halt
vagrant destroy -f

for (( count=101; count<107; count++ ))
do
  ssh-keygen -f "~/.ssh/known_hosts" -R "172.21.12.$count" || true
done

rm -rf $SCRIPT_DIR/.vagrant
rm -rf $SCRIPT_DIR/*console.log
