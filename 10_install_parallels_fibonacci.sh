#!/bin/bash

cd /opt
sudo git clone https://github.com/anuriq/parallels-fibonacci.git

sudo cp /opt/parallels-fibonacci/nginx.conf /etc/nginx/sites-available/default
sudo service nginx reload

cd /opt/parallels-fibonacci
sudo virtualenv flask
sudo flask/bin/pip install flask

sudo sh -c 'flask/bin/python src/main.py &>> api.log' &

echo "Installation complete."
