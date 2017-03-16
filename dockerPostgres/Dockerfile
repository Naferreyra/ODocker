#Install ubuntu
FROM ubuntu:trusty

MAINTAINER Jesus

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

COPY sources.list /etc/apt/sources.list

# Add the PostgreSQL PGP key to verify their Debian packages.
# It should be the same key as https://www.postgresql.org/media/keys/ACCC4CF8.asc
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8

# Add PostgreSQL's repository. It contains the most recent stable release
#     of PostgreSQL, ``9.3``.
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main 9.5" > /etc/apt/sources.list.d/postgresql.list

RUN apt-get update

RUN apt-get -y upgrade

RUN apt-get install --force-yes -y python byobu curl htop man unzip vim wget git python-software-properties software-properties-common postgresql-9.5 postgresql-client-9.5 postgresql-contrib-9.5 pkg-config

COPY visiotech.sql /home/dump/visiotech.sql

USER postgres

RUN /etc/init.d/postgresql start && \
  psql --command "CREATE USER root WITH SUPERUSER CREATEDB CREATEROLE LOGIN PASSWORD 'komklave';" && \
  psql --command "CREATE USER comunitea WITH CREATEDB CREATEROLE LOGIN PASSWORD 'komklave';" && \
  createdb -O root visiotech_docker_real && \
  psql -d visiotech_docker_real < /home/dump/visiotech.sql && \
  psql -d visiotech_docker_real --command "update ir_cron set active = false;" && \
  psql -d visiotech_docker_real --command "delete from ir_mail_server;" && \
  createdb -O root visiotech_real && \
  psql -d visiotech_real < /home/dump/visiotech.sql && \
  psql -d visiotech_real --command "update ir_cron set active = false;" && \
  psql -d visiotech_real --command "delete from ir_mail_server;"

# Adjust PostgreSQL configuration so that remote connections to the
# database are possible.
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.5/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/9.5/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.5/main/postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5432

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# Set the default command to run when starting the container
CMD ["/usr/lib/postgresql/9.5/bin/postgres", "-D", "/var/lib/postgresql/9.5/main", "-c", "config_file=/etc/postgresql/9.5/main/postgresql.conf"]

