#Install ubuntu
FROM ubuntu:trusty

MAINTAINER visiotech

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install -y gnupg && apt-get install -y wget

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update

RUN apt-get install -y postgresql-10 postgresql-client-10 postgresql-contrib-9.6

USER postgres

RUN /etc/init.d/postgresql start && \
    psql --command "CREATE USER root WITH SUPERUSER CREATEDB CREATEROLE LOGIN PASSWORD 'root_password';" && \
    psql --command "CREATE USER usuario WITH CREATEDB CREATEROLE LOGIN PASSWORD 'user_password';"

RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/10/main/pg_hba.conf

RUN echo "listen_addresses='*'" >> /etc/postgresql/10/main/postgresql.conf

EXPOSE 5433

VOLUME ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD ["/usr/lib/postgresql/10/bin/postgres", "-D", "/var/lib/postgresql/10/main", "-c", "config_file=/etc/postgresql/10/main/postgresql.conf", "-p", "5433"]
