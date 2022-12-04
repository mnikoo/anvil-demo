#!/bin/bash
apt-get update
apt-get install python3-venv openjdk-8-jdk -y
echo 'net.ipv4.ip_unprivileged_port_start=0' > /etc/sysctl.d/50-unprivileged-ports.conf
sysctl --system 
su ubuntu bash -c "cd ~ && python3 -m venv env && source env/bin/activate && pip install anvil-app-server && git clone https://github.com/mnikoo/anvil-demo.git AnvilDemo && IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4) && anvil-app-server --app AnvilDemo --origin http://\$IP/ --disable-tls"