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

RUN apt install software-properties-common -y

RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt-get update
RUN apt-get install python3.6 -y
RUN apt-get install python3.6-dev -y

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3.6 get-pip.py
RUN ln -s /usr/bin/python3.6 /usr/local/bin/python3

# TARDA MUCHO -> RUN apt-key adv --keyserver hkp://subkeys.pgp.net --recv-keys 0xE38CEB07

RUN apt-get install -y libreadline-dev
RUN apt-get install -y cups libcups2-dev

RUN apt-get update

RUN apt-get install --force-yes -y --fix-missing openerp-server-system-build-deps python3.6 byobu curl htop man unzip vim git libreadline-dev libcups2-dev python3-pip build-essential python3-matplotlib pkg-config  sudo xvfb xfonts-75dpi autoconf libtool python3-opengl python3-pyside.qtopengl qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus libgle3 libssl-dev node-less
RUN apt-get install -y postgresql-10 postgresql-client-10 postgresql-contrib-9.6

#NUEVO-----
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN tar xvf wkhtmltox*.tar.xz
RUN mv wkhtmltox/bin/wkhtmlto* /usr/bin
#----------

RUN pip3 install -U pip setuptools

RUN pip3 install --upgrade virtualenv

RUN pip3 install --upgrade matplotlib --ignore-installed six

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

RUN pip3 install seaborn

RUN pip3 install psycogreen

RUN pip3 install xmlsig

RUN useradd -ms /bin/bash -p 'komklave' administrador

VOLUME /home/administrador/ProjectRED/odooProject

WORKDIR /home/administrador/ProjectRED/odooProject

USER administrador

EXPOSE 9069 9071 5000 9002

#RUN git init
#RUN git remote add origin https://github.com/Comunitea/CMNT_004_15.git
#RUN git pull origin 11.0

#COPY devel_odoo.cfg /home/administrador/ProjectRED/odooProject/odoo.cfg
#COPY devel_buildout.cfg /home/administrador/ProjectRED/odooProject/buildout.cfg

#RUN git config --global user.email "email_git"
#RUN git config --global user.name "usuario_git"

#RUN virtualenv -p python3 sandbox

#RUN sandbox/bin/python3 bootstrap.py -c buildout.cfg

#RUN bin/buildout -c buildout.cfg
