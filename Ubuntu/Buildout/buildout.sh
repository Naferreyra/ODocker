#!/bin/sh

git config --global user.email "email"
git config --global user.name "username"
virtualenv sandbox --no-setuptools
sandbox/bin/python3 --version
sandbox/bin/python3 bootstrap.py -c devel_buildout.cfg
bin/buildout -c devel_buildout.cfg
