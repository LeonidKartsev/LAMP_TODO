#!bin/bash

apt-get install -y apache2 php mysql-server mysql-client debconfutils
DEBIAN_FRONTEND=noninteractive

while IFS= read -r line; do
    echo "'phpmyadmin phpmyadmin/$line' | debconf-set-selections"
done < phpmyadmin_config.txt

apt-get install -y phpmyadmin

mysql -p=yourpassword -u "root" -Bse "CREATE USER 'username'@'localhost' IDENTIFIED BY 'yourpassword';"
mysql -p=yourpassword -u "root" -Bse "GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost' WITH GRANT OPTION;"
mysqladmin -u username -pyourpassword create dbname

rm /var/www/html/index.html
mv ./LAMP_TODO/* /var/www/html/

curl 127.0.0.1/install.php
