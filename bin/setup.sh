#!/bin/bash

if [ -f "./site/web/wp/index.php" ];
then
	echo "WordPress config file found."
else
	echo "WordPress config file not found. Installing..."
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php --install-dir=bin
    php -r "unlink('composer-setup.php');"
    php ./bin/composer.phar --working-dir=site/ install
fi
