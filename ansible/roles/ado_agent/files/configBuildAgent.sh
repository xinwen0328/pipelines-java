#!/usr/bin/bash

mkdir ~/vsts && cd ~/vsts
tar -zxvf ~/vsts-agent-linux-x64-3.232.3.tar.gz

mkdir ~/myagent
./config.sh --unattended  --url https://dev.azure.com/xinwenliu --auth pat \
--token i6vp7qdc7dafcltf67riikbtghcj6dobjqphxiba4ulxd4xos3eq \
--pool mypool --agent `hostname` --work ~/myagent

sudo  ./svc.sh install
sudo  ./svc.sh start
sudo  ./svc.sh status