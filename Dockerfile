#Install ubuntu
FROM ubuntu:trusty

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

COPY sources.list /etc/apt/sources.list

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main 9.5" > /etc/apt/sources.list.d/postgresql.list

RUN apt-get update

RUN apt-get -y upgrade

RUN apt install --force-yes -y wget software-properties-common python-software-properties

RUN wget http://security.ubuntu.com/ubuntu/pool/main/g/gcc-5/libstdc++6_5.3.1-14ubuntu2_amd64.deb

RUN wget http://security.ubuntu.com/ubuntu/pool/main/g/gcc-5/gcc-5-base_5.3.1-14ubuntu2_amd64.deb

RUN wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb

RUN apt-get install --force-yes -y openerp-server-system-build-deps python byobu curl htop man unzip vim wget git libreadline-dev libcups2-dev python-pip python-dev build-essential python-matplotlib pkg-config postgresql-9.5 postgresql-client-9.5 postgresql-contrib-9.5 sudo xvfb xfonts-75dpi

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

RUN useradd -ms /bin/bash -p 'komklave' nferreyra

WORKDIR /home/nferreyra

# Expose the Odoo port
EXPOSE 9069 9071
