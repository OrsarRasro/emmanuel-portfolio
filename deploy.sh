#!/bin/bash
sudo su
yum update -y
yum install -y httpd
cd /var/www/html
wget https://github.com/OrsarRasro/emmanuel-portfolio/archive/refs/heads/master.zip
unzip master.zip
cp -r emmanuel-portfolio-master/* /var/www/html/
rm -rf emmanuel-portfolio-master master.zip
systemctl enable httpd 
systemctl start httpd
