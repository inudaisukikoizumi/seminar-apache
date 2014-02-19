#!/bin/bash -ex
export DEBIAN_FRONTEND=noninteractive

# copy Apache2 conf.
sudo cp /vagrant/setup/apache2/mods-available/alias.conf /etc/apache2/mods-available/alias.conf
sudo cp /vagrant/setup/apache2/sites-available/default /etc/apache2/sites-available/default
sudo cp /vagrant/setup/apache2/envvars /etc/apache2/envvars

sudo service apache2 restart
