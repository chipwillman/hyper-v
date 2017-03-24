# Nagios server

Instructions taken from 
https://www.digitalocean.com/community/tutorials/how-to-install-nagios-4-and-monitor-your-servers-on-ubuntu-14-04

## Setup Nagios

Install nagios 4.1.1 in home directory

```
.\setup.sh
```

## Install Plugins

Install nagios 2.1.1 in home directory

```
.\install_plugins.sh
```

### Configure Nagios

```
sudo vi /usr/local/nagios/etc/nagios.cfg
```

Uncomment the following line

```
#cfg_dir=/usr/local/nagios/etc/servers
```


```
sudo mkdir /usr/local/nagios/etc/servers
```

### Configure Nagios Contacts

```
sudo vi /usr/local/nagios/etc/objects/contacts.cfg
```
Find the email directive, and replace its value (the highlighted part) with your own email address:

```
email                           nagios@localhost        ; <<***** CHANGE THIS TO YOUR EMAIL ADDRESS ******

```


### Configure check_nrpe Command

```
sudo vi /usr/local/nagios/etc/objects/commands.cfg
```

```
define command{
        command_name check_nrpe
        command_line $USER1$/check_nrpe -H $HOSTADDRESS$ -c $ARG1$
}
```

## Configure Apache

```
.\configure_apache.sh
```

### Restrict Access by IP

```
sudo vi /etc/apache2/sites-available/nagios.conf
```
Find and comment the following two lines by adding # symbols in front of them:

```
Order allow,deny
Allow from all
```
Then uncomment the following lines, by deleting the `#` symbols, and add the IP addresses or ranges (space delimited) that you want to allow to in the `Allow from` line:

```
#  Order deny,allow
#  Deny from all
#  Allow from 127.0.0.1
```

restart apache
```
sudo service nagios restart
sudo service apache2 restart
```

## Install NRPE on linux client

```
.\install_nrpe.sh
```

Additional setup

```
sudo vi /etc/xinetd.d/nrpe

```

Modify the `only_from` line by adding the private IP address of the your Nagios server to the end (substitute in the actual IP address of your server):

```
only_from = 127.0.0.1 10.132.224.168
```

restart service

```
sudo service xinetd restart
```


