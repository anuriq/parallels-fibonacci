#!/bin/bash

cd /opt
git clone https://github.com/anuriq/parallels-fibonacci.git

cp /opt/parallels-fibonacci/nginx.conf /etc/nginx/sites-available/default
service nginx reload

cd /opt/parallels-fibonacci
virtualenv flask
flask/bin/pip install flask

flask/bin/python src/main.py &>> api.log &
