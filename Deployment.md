# Deployment Guide

Go to the [Amazon EC2 Console](https://console.aws.amazon.com/ec2)

Make sure the Ireland (eu-west-1) region is selected at the top right of the console.

Choose "Launch instance"

### Name
Enter a name, e.g. `anvil-demo`

### OS Image
Choose "Ubuntu Server 22.04 LTS"

### Architecture
Keep the default "64-bit (x86)" architecture

### Instance type
Choose the "t3.micro" instance type

### Key pair (login)
Choose "Proceed without a key pair (not recommended)"

### Firewall
Choose "Create security group"
* Keep the "Allow SSH traffic from" checked, but change "Anywhere" to "Custom", and add this CIDR `18.202.216.48/29`
* Check the "Allow HTTP traffic from the internet"

## Deploying Anvil runtime and the example dashboard solution 

### For automated deployment

Expand the "Advanced details" section at the bottom of the page.

Copy the following code segment to the clipboard.

```
#!/bin/bash
apt-get update
apt-get install python3-venv openjdk-8-jdk -y
echo 'net.ipv4.ip_unprivileged_port_start=0' > /etc/sysctl.d/50-unprivileged-ports.conf
sysctl --system 
su ubuntu bash -c "cd ~ && python3 -m venv env && source env/bin/activate && pip install anvil-app-server && git clone https://github.com/mnikoo/anvil-demo.git AnvilDemo && IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4) && anvil-app-server --app AnvilDemo --origin http://\$IP/ --disable-tls"
```

Paste it to the "User data" section at the bottom of the page.

Click "Launch instance". 

### For manual deployment (run shell commands)
Click "Launch instance".

Wait for the EC2 instance to boot up. 

Click "Connect" => "EC2 Instance Connect". 

Leave the User name as default ("Ubuntu").

Click "Connect".

Once you are connected, run the commands in [manual-deployment.sh](./deployment/manual-deployment.sh) one by one from the console.