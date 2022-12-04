sudo apt-get update
sudo apt-get install python3-venv openjdk-8-jdk -y
sudo su -
echo 'net.ipv4.ip_unprivileged_port_start=0' > /etc/sysctl.d/50-unprivileged-ports.conf
sysctl --system 
su ubuntu
cd ~
python3 -m venv env
source env/bin/activate
pip install anvil-app-server
git clone ssh://nikoom%40amazon.com@anvil.works:2222/QLRQH5YLCPRFE7BB.git M3_App_1
anvil-app-server --app CRUDnewsappwalkthrough --origin https://ryans-test-app.xyz/
