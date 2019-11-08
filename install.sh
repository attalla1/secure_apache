#!/bin/bash
# Ahmed Attalla
# Secure_Apache 1.0
cat << "EOF"
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
                                                ""--..__.
                                                
                                Secure_Apatche 1.0 | © Ahmed Attalla 2019 ©

EOF;
sleep 6;
echo;
echo "Note: Hopefully you are a super-user otherwise this script will not work";
echo;
echo;
echo "This tool will:" Add reasonable request_timeout value to apache2 configuration file. install fail2ban and configure it";
echo;
echo "* Add reasonable request_timeout value to apache2 configuration file.";
echo "* Install fail2ban tool and configure it to block any http_dos attack";
echo;
sleep 7;
# Update & Upgrade
apt-get update -y;
apt-get upgrade -y;

# Add config lines to apache2 config file to limit the readtimout;
chmod +x *;
./apache.sh;
echo;
echo "Apache is now Safe!";
echo;
echo "Note: Fail2Ban will be installed now, if you DO NOT want to install it, press ctr+c to exit"
echo;
sleep 7;

# Install Fail2Ban
sudo apt-get install fail2ban;
sudo systemctl start fail2ban;
sudo systemctl enable fail2ban;
cp f2b_local_jail /etc/fail2ban/jail.local;
cp http-get-dos /etc/fail2ban/filter.d/http-get-dos.conf;
sudo systemctl restart fail2ban;
echo;
echo "Success!";
echo;
echo "Fail2Ban Installed!, Now you can configure rules at /etc/fail2ban/jail.local";
echo;
echo "use  'sudo fail2ban-client status' to view current jails";
echo;
echo "use 'sudo fail2ban-client status <jail_name>' to view details for a specific jail";
echo;
echo "use 'sudo fail2ban-client set <jail_name> unbanip <ip_address>' to unblock an ip";
echo;
echo "You are good to go!"
echo;
