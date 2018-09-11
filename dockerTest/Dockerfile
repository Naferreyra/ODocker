#Install ubuntu
FROM ubuntu:trusty

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

COPY sources.list /etc/apt/sources.list

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main 9.5" > /etc/apt/sources.list.d/postgresql.list

RUN apt-get update

RUN apt-get -y upgrade

RUN apt-get install -y libblas-dev liblapack-dev libatlas-base-dev gfortran

RUN apt install --force-yes -y wget software-properties-common python-software-properties

RUN wget http://security.ubuntu.com/ubuntu/pool/main/g/gcc-5/libstdc++6_5.3.1-14ubuntu2_amd64.deb

RUN wget http://security.ubuntu.com/ubuntu/pool/main/g/gcc-5/gcc-5-base_5.3.1-14ubuntu2_amd64.deb

RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb

RUN apt-get install --force-yes -y openerp-server-system-build-deps python byobu curl htop man unzip vim wget git libreadline-dev libcups2-dev python-pip python-dev build-essential python-matplotlib pkg-config postgresql-9.6 postgresql-client-9.6 postgresql-contrib-9.6 sudo xvfb xfonts-75dpi autoconf libtool python-opengl python-imaging python-pyrex python-pyside.qtopengl idle-python2.7 qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl libgle3 libssl-dev postgresql-server-dev-9.6

RUN apt-get remove -y postgresql-10 postgresql-client-10 postgresql-contrib-10 postgresql-server-dev-10 postgresql-9.5 postgresql-client-9.5 postgresql-contrib-9.5 postgresql-server-dev-9.5

RUN apt-get install -y libblas-dev liblapack-dev libatlas-base-dev gfortran

RUN dpkg -i gcc-5-base_5.3.1-14ubuntu2_amd64.deb

RUN dpkg -i libstdc++6_5.3.1-14ubuntu2_amd64.deb

RUN dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb

#RUN tar -Jxvf wkhtmltox-0.12.2.1_linux-generic-amd64.tar.xz && \
    #cd wkhtmltox/bin && \
    #cp wkhtmltopdf /usr/local/bin/

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E1DD270288B4E6030699E45FA1715D88E1DF1F24

RUN pip install -U pip setuptools

RUN pip install --upgrade virtualenv

RUN pip install --upgrade matplotlib

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

RUN pip install https://pypi.python.org/packages/c3/f3/5519551f02ae70fc51f4e608e7b44d59a408fe3264fec4afeea37b8ea317/psycopg2-2.5.2.tar.gz#md5=53d81793fbab8fee6e732a0425d50047

RUN useradd -ms /bin/bash -p 'komklave' administrador

USER administrador

RUN mkdir /home/administrador/ProjectRED && \
    mkdir /home/administrador/ProjectRED/odooProject

COPY devel_buildoutVT.cfg /home/administrador/ProjectRED/odooProject

COPY devel_odoo.cfg /home/administrador/ProjectRED/odooProject

WORKDIR /home/administrador/ProjectRED/odooProject

# Expose the Odoo port
EXPOSE 9069 9071 5000