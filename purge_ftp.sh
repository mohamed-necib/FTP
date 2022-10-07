#!/bin/bash

# CE SCRIPT EST À LANCER AVEC SUDO OU EN ROOT

# suppression de proftpd, openssl et git
 apt-get autoremove --purge proftpd* -y
 apt-get autoremove --purge openssl -y
 apt-get autoremove --purge git -y

# suppression des dossiers de configuration crées
 rm -r /etc/conf-proftpd /etc/proftpd/ssl
