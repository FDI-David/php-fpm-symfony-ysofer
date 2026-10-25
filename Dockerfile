# Image dérivée de l'image PHP 7.4 de damienduboeuf.
# Elle garde son fonctionnement (utilisateur, USER_ID/USER_GID, point d'entrée)
# et n'ajoute que vos réglages.
#
# Pour figer exactement la version actuelle, remplacez le tag par son empreinte :
#   FROM registry.gitlab.com/damienduboeuf/docker/php-fpm-symfony@sha256:...
FROM registry.gitlab.com/damienduboeuf/docker/php-fpm-symfony:7.4-fpm

# Les installations demandent les droits root. Si l'image de base définit un autre
# utilisateur (docker inspect --format "{{.Config.User}}"), remettez-le à la fin.
USER root

# Réglages PHP ajoutés par-dessus ceux de l'image de base
COPY php.ini /usr/local/etc/php/conf.d/zz-app.ini

################
# PDO SQL SERV #
################

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - 
RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list 
RUN apt-get update 
RUN ACCEPT_EULA=Y apt-get -y --no-install-recommends install msodbcsql17 unixodbc-dev 
RUN pecl install sqlsrv
RUN pecl install pdo_sqlsrv
RUN docker-php-ext-enable sqlsrv pdo_sqlsrv

# Extensions supplémentaires si besoin (décommentez et complétez) :
# COPY --from=mlocati/php-extension-installer:2 /usr/bin/install-php-extensions /usr/local/bin/
# RUN install-php-extensions nom_extension

# Paquets système supplémentaires si besoin (Alpine : apk, Debian : apt-get) :
# RUN apk add --no-cache nom_paquet

# USER nom_utilisateur_d_origine
