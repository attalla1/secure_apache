#Ahmed Attalla
#Secure_Apache 1.0
#!/bin/bash
echo;
echo;
cat << "EOF";

                     .- . _
            .:       `      " - . _
     \     ::          `            ""--..__                                                . . . :  :  :
     `\   ::  :'         ` _ _              ""--..__                       ......_._._:.:.: " " " "  "  "
      `\.::  :'                " " " - ----.....___ ""-##.____...:::""""""""""""
       : :  :'                                     "::":"-----......______
     ."  ""--..__ .                               .:'.:                   """"""-----. . . _ _ _
    /.""--.._    ""--..__ :                     .:'. :                                           "  "  "
   /'   .:   ":-.._      ""--..__             .:'.  :
    `-._:__.-"     ""-.._        ""--...___..:'.   :
      .:               /.""-..__...---""-.'"-:"--.:_
                       "      :  MOTEC .'    ::""-."";.
                             :_         :     ::    ":: `-.
                             :::::.._   '-._ ::      ::    `.
                             : """:::::.._  "''-._  ::       :
                             :       "":::::.._   "':         :
                             `.           """:::::-:_         :
                               :.               """::::::...   :
                     ..__..--"" ".      .              """::::::
                        ""--..__  :.--""                      ":
                                ""-+:=:_                   ("-:
                                   :    ""--.._             []'
                                   :          :""--..___..--"
                                   :          :
                                 ""--..__     :
                                         ""--.:_
                                                ""--..___  
                                              
                                Secure_Apatche 1.0 | © Ahmed Attalla 2019 ©

EOF
sleep 6;
clear;
echo;
echo "WARNING: This tool assumes that you have already apache2 installed and config file located at '/etc/apache2/apache2.conf'";
echo;
echo "* If you don't have apache2 installed you can install it using 'apt install apache2'";
echo;
sleep 15;
clear;
echo;
echo "This tool will:";
echo;
echo "* Add reasonable request_timeout value to apache2 configuration file.";
echo "* Install fail2ban tool and configure it to Block any http_dos attack.";
echo;
echo;
sleep 10;
clear;
# Update & Upgrade
apt-get update -y;
apt-get upgrade -y;

# Add config lines to apache2 config file to limit the readtimout;
bash .apache_magic.sh;
echo;
echo "Apache is now Safe!";
echo;
sleep 3;
clear;
echo;
echo "Note: Fail2Ban will be installed now, if you DO NOT want to install it, press ctr+c to exit"
echo;
sleep 10;
clear;
echo;
echo;
# Install Fail2Ban
# Jail Magic 1.0
cat << "EOF"

  _________________________
     ||   ||     ||   ||
     ||   ||, , ,||   ||
     ||  (||/|/(\||/  ||
     ||  ||| _'_`|||  ||
     ||   || o o ||   ||
     ||  (||  - `||)  ||
     ||   ||  =  ||   ||
     ||   ||\___/||   ||
     ||___||) , (||___||
    /||---||-\_/-||---||\
   / ||--_||_____||_--|| \
  (_(||)-| S123-45 |-(||)_)
|"""""""""""""""""""""""""""|
|                           |  
|      Jail Magic 1.0       |
|                           |   © Ahmed Attalla 2019 ©
 """""""""""""""""""""""""""

EOF
echo;
echo;
sleep 4;
clear;
sudo apt-get install fail2ban -y;
sudo systemctl start fail2ban;
sudo systemctl enable fail2ban;
cp .f2b_local_jail /etc/fail2ban/jail.local;
cp .http-get-dos /etc/fail2ban/filter.d/http-get-dos.conf;
sudo systemctl restart fail2ban;
echo;
clear;
echo;
echo;
cat << "EOF"

                     `. ___
                    __,' __`.                _..----....____
        __...--.'``;.   ,.   ;``--..__     .'    ,-._    _.-'
  _..-''-------'   `'   `'   `'     O ``-''._   (,;') _,'
,'________________                          \`-._`-','
 `._              ```````````------...___   '-.._'-:
    ```--.._      ,.                     ````--...__\-.
            `.--. `-`                       ____    |  |`
              `. `.                       ,'`````.  ;  ;`
                `._`.        __________   `.      \'__/`
                   `-:._____/______/___/____`.     \  `
                               |       `._    `.    \
                               `._________`-.   `.   `.___
                                             SSt  `------'`


            Secure_Apatche 1.0 | © Ahmed Attalla 2019 ©

EOF
echo;
echo;
echo "Success!";
echo;
echo;
echo "Fail2Ban Installed!, Now you can configure rules at /etc/fail2ban/jail.local";
echo;
echo "use  'sudo fail2ban-client status' to view current jails";
echo;
echo "use 'sudo fail2ban-client status <jail_name>' to view details for a specific jail";
echo;
echo "use 'sudo fail2ban-client set <jail_name> unbanip <ip_address>' to unblock an ip";
echo;
echo;
echo "You are good to go!";
echo;
echo;
