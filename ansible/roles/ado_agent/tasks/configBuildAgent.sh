#!/usr/bin/bash
sudo tar -zxvf ~/vsts-agent-linux-x64-3.232.3.tar.gz
sudo -c cd ~/myagent
sudo ./config.sh --unattended  --url https://devops.azure.com/xinwenliu --auth pat \
--token ivhebo5arpe6j5zexeocc2q4yon5ymjd7evhvmvqfmfwq2zdilmamyToken \
--pool mypool --agent myAgent --work ~/myagent

sudo ./svc.sh install
sudo ./svc.sh start
sudo ./svc.sh status