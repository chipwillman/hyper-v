#!/bin/bash
sudo apt-get update
sudo apt-get install apache2
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install php5.6
sudo apt-get install mysql-server