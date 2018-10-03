#Install ubuntu
FROM ubuntu:bionic

MAINTAINER visiotech

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install -y gnupg && apt-get install -y wget

# RUN apt-key adv --keyserver hkp://subkeys.pgp.net --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
# RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
# RUN wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | apt-key add -
# RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4

# RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main 10.5" > /etc/apt/sources.list.d/postgresql.list

# RUN apt-get install --allow -y python byobu curl htop man unzip vim wget git python-software-properties software-properties-common postgresql-10.5 postgresql-client-10.5 postgresql-contrib-10.5 pkg-config
#############################################################

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" > /etc/apt/sources.list.d/pgdg.list

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update

RUN apt-get install -y postgresql-10

USER postgres

RUN /etc/init.d/postgresql start && \
  psql --command "CREATE USER root WITH SUPERUSER CREATEDB CREATEROLE LOGIN PASSWORD 'komklave';" && \
psql --command "CREATE USER comunitea WITH CREATEDB CREATEROLE LOGIN PASSWORD 'komklave';"

RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/10/main/pg_hba.conf

RUN echo "listen_addresses='*'" >> /etc/postgresql/10/main/postgresql.conf

EXPOSE 5432

VOLUME ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD ["/usr/lib/postgresql/10/bin/postgres", "-D", "/var/lib/postgresql/10/main", "-c", "config_file=/etc/postgresql/10/main/postgresql.conf"]
