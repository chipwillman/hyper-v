#!/bin/bash
sudo a2enmod rewrite
sudo a2enmod cgi
sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
sudo ln -s /etc/apache2/sites-available/nagios.conf /etc/apache2/sites-enabled/
sudo service nagios start
sudo service apache2 restart
sudo ln -s /etc/init.d/nagios /etc/rcS.d/S99nagios