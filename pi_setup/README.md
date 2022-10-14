# PI Setup
Almost fully automatic script that removes useless preinstalled packages and sets up:
- screen
- FTP
- LAMP (Apache2, MySQL, PHP)
- Node.js and NPM

### One-liner to download and run
```
sudo curl -LO https://raw.githubusercontent.com/SinnerK0N/scripts/master/pi_setup/pi_setup.sh && sudo chmod u+x pi_setup.sh && sudo ./pi_setup.sh
```

After the installation finished you need to set a password for phpmyadmin.
Just follow this line by line:
```
sudo mysql
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'YOUR_PASSWORD_HERE';
exit
sudo systemctl restart mariadb
```
