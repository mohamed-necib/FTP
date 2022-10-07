#!/bin/bash

# CE SCRIPT EST À LANCER AVEC SUDO OU EN ROOT

# faire un repo git hub avec les fichiers de config à télécharger
# proftd.conf + tls.conf + modules.conf

# Mise à jour des paquets disponibles:
apt-get update -y
apt-get upgrade -y

# installation proftpd, openssl et git:
apt-get install proftpd-* -y
apt-get install openssl -y
apt-get install git -y

# Commande permettant le bon chemin de mise en place des fichiers téléchargés
cd /etc/

# clone le repo avec les fichiers de configuration 
git clone https://github.com/anais-labit/conf-proftpd.git

# Commande nous permettant de nous déplacer dans le dossier cloné
cd /etc/conf-proftpd/

# copie des fichiers téléchargés en remplacement des initaux (créé lors du téléchargement de proftpd)
cp proftpd.conf /etc/proftpd/proftpd.conf 
cp tls.conf /etc/proftpd/tls.conf
cp modules.conf /etc/proftpd/modules.conf

# securisation de la connexion
    # créer le dossier “ssl” :
	mkdir /etc/proftpd/ssl

    # requête pour de nouveaux certificat et clé :
	echo -e "\n\n\n\n\n\n\n" | openssl req -new -x509 -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem -keyout /etc/proftpd/ssl/proftpd.key.pem

# mise à jour de proftpd
systemctl restart proftpd
