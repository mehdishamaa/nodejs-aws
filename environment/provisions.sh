#!/bin/bash

# Update the sources list
sudo apt-get update -y

# upgrade any packages available
sudo apt-get upgrade -y

# install nginx
sudo apt-get install nginx -y

# configuring nginx proxy
sudo unlink /etc/nginx/sites-enabled/default
cd /etc/nginx/sites-available
sudo touch reverse-proxy.conf
sudo chmod 666 reverse-proxy.conf
echo "server{
  listen 80;
  location / {
      proxy_pass http://192.168.10.100:3000;
  }
}" >> reverse-proxy.conf
sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
sudo service nginx restart

# install git
sudo apt-get install git -y

# install nodejs
sudo apt-get install python-software-properties
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y

# install pm2
sudo npm install pm2 -g

# App set up
export DB_HOST="mongodb://192.168.10.150:27017/posts"
cd /home/ubuntu/app
sudo su
npm install
# node app.js

scp  -i ~/.ssh/DevOpsStudents.pem -r app/ ubuntu@ec2-34-247-86-225.eu-west-1.compute.amazonaws.com:~/app/

# scp -i ~/.ssh/DevOpsStudents.pem -r app/ ubuntu@ 34.248.99.137:~/app/

# # remove the old file and add our one
# sudo rm /etc/nginx/sites-available/default
# sudo cp /home/ubuntu/environment/nginx.default /etc/nginx/sites-available/default
#
# # finally, restart the nginx service so the new config takes hold
# sudo service nginx restart