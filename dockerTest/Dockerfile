#Install ubuntu
FROM ubuntu:trusty

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

COPY sources.list /etc/apt/sources.list

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main 9.6" > /etc/apt/sources.list.d/postgresql.list

RUN apt-get update

RUN apt-get -y upgrade

RUN apt-get install --force-yes -y libblas-dev liblapack-dev libatlas-base-dev gfortran libgeos-dev

RUN apt-get install --force-yes -y postgis postgresql-9.6-postgis-2.4

RUN apt install --force-yes -y wget software-properties-common python-software-properties

RUN wget http://security.ubuntu.com/ubuntu/pool/main/g/gcc-5/libstdc++6_5.3.1-14ubuntu2_amd64.deb

RUN wget http://security.ubuntu.com/ubuntu/pool/main/g/gcc-5/gcc-5-base_5.3.1-14ubuntu2_amd64.deb

RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb

RUN apt-get install --force-yes -y openerp-server-system-build-deps python byobu curl htop man unzip vim wget git libreadline-dev libcups2-dev python-pip python-dev build-essential python-matplotlib pkg-config postgresql-9.6 postgresql-client-9.6 postgresql-contrib-9.6 sudo xvfb xfonts-75dpi autoconf libtool python-opengl python-imaging python-pyrex python-pyside.qtopengl idle-python2.7 qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl libgle3 libssl-dev

RUN dpkg -i gcc-5-base_5.3.1-14ubuntu2_amd64.deb

RUN dpkg -i libstdc++6_5.3.1-14ubuntu2_amd64.deb

RUN dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb

#RUN tar -Jxvf wkhtmltox-0.12.2.1_linux-generic-amd64.tar.xz && \
    #cd wkhtmltox/bin && \
    #cp wkhtmltopdf /usr/local/bin/

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E1DD270288B4E6030699E45FA1715D88E1DF1F24

RUN pip install -U pip setuptools

RUN pip install --upgrade virtualenv

RUN pip install --upgrade matplotlib --ignore-installed six

RUN pip install Flask

RUN pip install Flask-XML-RPC

RUN pip install flask-peewee

RUN pip install pyOpenSSL

RUN pip install pyasn1

RUN pip install ndg-httpsclient

RUN pip install cryptography

RUN pip install idna

RUN pip install certifi

RUN pip install scipy

RUN pip install seaborn

RUN pip install https://pypi.python.org/packages/33/27/e3978243a03a76398c384c83f7ca879bc6e8f1511233a621fcada135606e/Babel-1.3.tar.gz#md5=5264ceb02717843cbc9ffce8e6e06bdb

RUN useradd -ms /bin/bash -p 'komklave' administrador

RUN mkdir /home/administrador/ProjectRED && \
    mkdir /home/administrador/ProjectRED/odooProject

COPY devel_buildoutVT.cfg /home/administrador/ProjectRED/odooProject

COPY devel_odoo.cfg /home/administrador/ProjectRED/odooProject

WORKDIR /home/administrador/ProjectRED/odooProject

RUN git init && \
    git remote add origin https://github.com/Naferreyra/CMNT_004_15.git && \
    virtualenv sandbox --no-setuptools

RUN sandbox/bin/python bootstrap.py -c devel_buildoutVT.cfg
RUN bin/buildout -c devel_buildoutVT.cfg
RUN bin/start_openerp -d visiotech_real --update all

USER administrador

# Expose the Odoo port
EXPOSE 9069 9071 5000
