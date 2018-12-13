#Install ubuntu
FROM ubuntu:xenial

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV LANG C.UTF-8

COPY sources.list /etc/apt/sources.list

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" > /etc/apt/sources.list.d/pgdg.list

# RUN echo "deb http://apt.anybox.fr/openerp common main" > /etc/apt/sources.list

RUN apt-get update

RUN apt-get -y upgrade

RUN apt-get install -y wget

RUN apt-get install -y gnupg

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update

# TARDA MUCHO -> RUN apt-key adv --keyserver hkp://subkeys.pgp.net --recv-keys 0xE38CEB07

# RUN apt-get install -y libc-dev-bin libc6 libc-dev libc6-dev libexpat1-dev libpython3.5-dev

RUN apt-get install -y python3.5-dev

RUN apt-get install -y libreadline-dev
RUN apt-get install -y cups libcups2-dev

RUN apt-get install --force-yes -y --fix-missing openerp-server-system-build-deps python3 byobu curl htop man unzip vim git libreadline-dev libcups2-dev python3-pip build-essential python3-matplotlib pkg-config postgresql-10 postgresql-client-10 postgresql-contrib-9.6 sudo xvfb xfonts-75dpi autoconf libtool python3-opengl python3-pyside.qtopengl qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus libgle3 libssl-dev node-less

RUN pip3 install -U pip setuptools

RUN pip3 install --upgrade virtualenv

RUN pip3 install Flask

RUN pip3 install Flask-XML-RPC

RUN pip3 install flask-peewee

RUN pip3 install pyOpenSSL

RUN pip3 install pyasn1

RUN pip3 install ndg-httpsclient

RUN pip3 install cryptography

RUN pip3 install idna

RUN pip3 install certifi

RUN pip3 install scipy

RUN pip3 install psycogreen

RUN pip3 install xmlsig

RUN pip3 install --ignore-installed seaborn

RUN useradd -ms /bin/bash -p 'contraseña_bbdd' administrador

RUN mkdir /home/administrador/ProjectRED && \
    mkdir /home/administrador/ProjectRED/odooProject

COPY devel_buildoutVT.cfg /home/administrador/ProjectRED/odooProject

COPY devel_odoo.cfg /home/administrador/ProjectRED/odooProject

WORKDIR /home/administrador/ProjectRED/odooProject

RUN git config --global user.email "email_git"
RUN git config --global user.name "usuario_git"

RUN git init && \
    git remote add origin https://github.com/Naferreyra/CMNT_004_15.git && \
    virtualenv sandbox --no-setuptools

RUN sandbox/bin/python bootstrap.py -c devel_buildoutVT.cfg
RUN bin/buildout -c devel_buildoutVT.cfg
RUN bin/start_odoo -d visiotech_real --update all

USER administrador

# Expose the Odoo port
EXPOSE 9069 9071 5000
