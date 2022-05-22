FROM httpd:2.4
MAINTAINER faris.rahmouni@etu.u-pec.fr
COPY index.html /var/www/html/
EXPOSE 1313

WORKDIR /serveur_apache/