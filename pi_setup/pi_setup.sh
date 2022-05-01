#!/bin/bash
# Credits for timer: https://unix.stackexchange.com/a/449899
start_time=$(date +%s)
#
# Update package list & Update installed packages
#
sudo apt update
sudo apt full-upgrade -y
#
# Install neofetch & make an alias to print CPU temperature
#
sudo apt install neofetch
sudo echo "alias temp='/usr/bin/vcgencmd measure_temp'" >> /home/pi/.bash_aliases
#
# Install Webserver & PHP
#
sudo apt install apache2 php7.4 libapache2-mod-php7.4 php7.4-mbstring php7.4-mysql php7.4-curl php7.4-gd php7.4-zip -y
sudo usermod -a -G www-data pi
sudo chown -R -f www-data:www-data /var/www/html
sudo chmod 777 /var/www/html
sudo chmod 777 /var/www/
sudo chmod 777 /
sudo systemctl restart apache2
#
# Install FTP and set it up
#
sudo apt install vsftpd
sudo rm /etc/vsftpd.conf
sudo curl -LO https://raw.githubusercontent.com/SinnerK0N/scripts/master/pi_setup/data/vsftpd.conf
sudo mv vsftpd.conf /etc/
systemctl restart vsftpd
#
# Git
#
sudo apt install git
#
# Install Node.js & NPM
#
sudo curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
sudo apt install -y nodejs
#
# Install PHPMyAdmin and set it up
#
sudo apt install phpmyadmin -y
sudo echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf
sudo service apache2 restart
#
# Finished
#
echo
echo
echo
echo
end_time=$(date +%s)
seconds=$(echo "$end_time - $start_time" | bc)
awk -v t=$seconds 'BEGIN{t=int(t*1000); printf "Finished in: %d:%02d:%02d\n", t/3600000, t/60000%60, t/1000%60}'