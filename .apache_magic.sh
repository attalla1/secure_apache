# Ahmed Attalla
# Secure_Apache 1.0
# Apache Magic 1.0
# Add lines to apache2 config file to limit the readtimout (Apache Magic 1.0)
#!/bin/bash
echo;
cat /etc/apache2/apache2.conf | tail -1
if [ ! !!="</IfModule>" ]
        then
        echo >> /etc/apache2/apache2.conf;
        echo "# Prevent Slow HTTP DOS" >> /etc/apache2/apache2.conf;
        echo "<IfModule mod_reqtimeout.c>" >> /etc/apache2/apache2.conf;
        echo " RequestReadTimeout header=1,MinRate=500 body=1,MinRate=500" >> /etc/apache2/apache2.conf;
        echo "</IfModule>" >> /etc/apache2/apache2.conf;
        sudo systemctl restart apache2.service;
        systemctl status apache2.service;
        echo;
        echo;
        sleep 4;
        echo;
else
        echo
        echo "Apache Magic already added, skipping ...";
        sudo systemctl restart apache2.service;
        systemctl status apache2.service;
fi
exit;
