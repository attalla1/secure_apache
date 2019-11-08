# Ahmed Attalla
# Secure_Apache 1.0
# Add lines to apache2 config file to limit the readtimout 

#!/bin/bash

echo "<IfModule mod_reqtimeout.c>" >> /etc/apache2/apache.conf;
echo "< RequestReadTimeout header=1,MinRate=500 body=1,MinRate=500>" >> /etc/apache2/apache.conf;
echo "</IfModule>" >> /etc/apache2/apache.conf;
sudo systemctl restart apache2.service;
echo;
echo "Success!";
echo;
