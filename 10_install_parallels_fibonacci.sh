#!/bin/bash

cd /opt
git clone https://github.com/anuriq/parallels-fibonacci.git

cp /opt/parallels-fibonacci/nginx.conf /etc/nginx/sites-available/default
